package main

import (
	"fmt"
	"log"
	"math"
	"net/http"
	"os"
	"time"

	"github.com/gorilla/mux"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

func main() {
	go ShowSimpleUI() // Launch the UI in a new goroutine

	router := mux.NewRouter().StrictSlash(true)
	router.PathPrefix("/").Handler(http.StripPrefix("/", http.FileServer(http.Dir("./static/"))))
	router.HandleFunc("/tag", SpitTag)
	router.HandleFunc("/hostname", SpitHostname)
	router.HandleFunc("/both", SpitBoth)
	router.HandleFunc("/primetime", PrimeTime)
	router.HandleFunc("/metrics", PrometheusMetrics)

	log.Fatal(http.ListenAndServe(":8585", router))
}

func PrometheusMetrics(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, promhttp.Handler())
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
	fmt.Fprintln(w, "v3 %v", localHostname)
}

func PrimeTime(w http.ResponseWriter, r *http.Request) {
	const N = 1000000000
	var x, y, n int
	nsqrt := math.Sqrt(N)

	is_prime := [N]bool{}

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

	primes := make([]int, 0, 1270606)
	for x = 0; x < len(is_prime)-1; x++ {
		if is_prime[x] {
			primes = append(primes, x)
		}
	}

	elapsed := time.Since(start)

	// primes is now a slice that contains all the
	// primes numbers up to N

	// let's print them
	//for _, x := range primes {
	//    fmt.Println(x)
	//}
	fmt.Fprintln(w, elapsed)
}
