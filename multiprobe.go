package main

import (
    "fmt"
    "log"
    "net/http"
	"os"

    "github.com/gorilla/mux"
)

func main() {

	router := mux.NewRouter().StrictSlash(true)
    router.HandleFunc("/", Index)
    router.HandleFunc("/tag", SpitTag)
    router.HandleFunc("/hostname", SpitHostname)
    router.HandleFunc("/both", SpitBoth)

    log.Fatal(http.ListenAndServe(":8080", router))
}

func Index(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "Usage: <url>/tag -or- <url>/hostname")
}

func SpitTag(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintln(w, "v1")
}

func SpitHostname(w http.ResponseWriter, r *http.Request) {
	localHostname, err := os.Hostname()
	if err != nil {
		panic(err)
	}
    fmt.Fprintln(w, localHostname)
}

func SpitBoth(w http.ResponseWriter, r *http.Request) {
	localHostname, err := os.Hostname()
	if err != nil {
		panic(err)
	}
    fmt.Fprintln(w, "v1 ", localHostname)
}
