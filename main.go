package main

import (
	"encoding/json"
	"fmt"
	"io"
	"log"
	"math"
	"net/http"
	"os"
	"time"

	"github.com/gorilla/mux"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func main() {
	router := mux.NewRouter().StrictSlash(true)
	// Move the static file handler to the end or ensure it doesn't match other paths if using PathPrefix("/")
	// However, usually it's better to register specific paths first.
	router.HandleFunc("/tag", SpitTag)
	router.HandleFunc("/hostname", SpitHostname)
	router.HandleFunc("/both", SpitBoth)
	router.HandleFunc("/primetime", PrimeTime)
	router.HandleFunc("/metrics", PrometheusMetrics)
	router.HandleFunc("/echo", EchoHandler)

	// Static files - capture everything else
	router.PathPrefix("/").Handler(http.StripPrefix("/", http.FileServer(http.Dir("./static/"))))

	log.Fatal(http.ListenAndServe(":8585", router))
}

func PrometheusMetrics(w http.ResponseWriter, r *http.Request) {
	promhttp.Handler().ServeHTTP(w, r)
}

func SpitTag(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "v3")
}

func SpitHostname(w http.ResponseWriter, r *http.Request) {
	localHostname := os.Getenv("HOSTNAME")
	fmt.Println(localHostname)
	fmt.Fprintln(w, localHostname)
}

func SpitBoth(w http.ResponseWriter, r *http.Request) {
	localHostname := os.Getenv("HOSTNAME")
	fmt.Fprintf(w, "v3 %v\n", localHostname)
}

func PrimeTime(w http.ResponseWriter, r *http.Request) {
	const N = 1000000000
	var x, y, n int
	nsqrt := math.Sqrt(N)

	// Use make for large slice to avoid stack overflow issues/ensure heap allocation
	is_prime := make([]bool, N)

	start := time.Now()

	for x = 1; float64(x) <= nsqrt; x++ {
		for y = 1; float64(y) <= nsqrt; y++ {
			n = 4*(x*x) + y*y
			if n <= N && (n%12 == 1 || n%12 == 5) {
				is_prime[n] = !is_prime[n]
			}
			n = 3*(x*x) + y*y
			if n <= N && n%12 == 7 {
				is_prime[n] = !is_prime[n]
			}
			n = 3*(x*x) - y*y
			if x > y && n <= N && n%12 == 11 {
				is_prime[n] = !is_prime[n]
			}
		}
	}

	for n = 5; float64(n) <= nsqrt; n++ {
		if is_prime[n] {
			for y = n * n; y < N; y += n * n {
				is_prime[y] = false
			}
		}
	}

	is_prime[2] = true
	is_prime[3] = true

	// Pre-allocating somewhat less than N/ln(N)
	primes := make([]int, 0, 50847534) // ~N/ln(N) for 10^9 is ~50M
	for x = 0; x < len(is_prime)-1; x++ {
		if is_prime[x] {
			primes = append(primes, x)
		}
	}

	elapsed := time.Since(start)
	fmt.Fprintln(w, elapsed)
}

type EchoResponse struct {
	Headers map[string][]string `json:"headers"`
	Method  string              `json:"method"`
	Body    string              `json:"body"`
	Params  map[string]string   `json:"params"`
	URL     string              `json:"url"`
	Host    string              `json:"host"`
}

func EchoHandler(w http.ResponseWriter, r *http.Request) {
	// Delay logic
	delayStr := r.URL.Query().Get("delay")
	if delayStr != "" {
		delay, err := time.ParseDuration(delayStr)
		if err == nil {
			time.Sleep(delay)
		}
	}

	body, _ := io.ReadAll(r.Body)
	defer r.Body.Close()

	params := make(map[string]string)
	for k, v := range r.URL.Query() {
		params[k] = v[0]
	}

	resp := EchoResponse{
		Headers: r.Header,
		Method:  r.Method,
		Body:    string(body),
		Params:  params,
		URL:     r.URL.String(),
		Host:    r.Host,
	}

	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(resp)
}
