package main

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
	"time"
)

func TestEchoHandler(t *testing.T) {
	req, err := http.NewRequest("GET", "/echo?foo=bar&delay=1ms", strings.NewReader("hello world"))
	if err != nil {
		t.Fatal(err)
	}
	req.Header.Set("X-Test-Header", "testvalue")

	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(EchoHandler)

	start := time.Now()
	handler.ServeHTTP(rr, req)
	elapsed := time.Since(start)

	if elapsed < 1*time.Millisecond {
		t.Errorf("expected delay of at least 1ms, got %v", elapsed)
	}

	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v",
			status, http.StatusOK)
	}

	var resp EchoResponse
	if err := json.NewDecoder(rr.Body).Decode(&resp); err != nil {
		t.Fatal(err)
	}

	if resp.Method != "GET" {
		t.Errorf("expected method GET, got %v", resp.Method)
	}
	if resp.Body != "hello world" {
		t.Errorf("expected body 'hello world', got %v", resp.Body)
	}
	if resp.Params["foo"] != "bar" {
		t.Errorf("expected param foo=bar, got %v", resp.Params["foo"])
	}
	if resp.Headers["X-Test-Header"][0] != "testvalue" {
		t.Errorf("expected header X-Test-Header=testvalue, got %v", resp.Headers["X-Test-Header"])
	}
}

func TestSpitHostname(t *testing.T) {
	req, err := http.NewRequest("GET", "/hostname", nil)
	if err != nil {
		t.Fatal(err)
	}
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(SpitHostname)
	handler.ServeHTTP(rr, req)
	if rr.Code != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v", rr.Code, http.StatusOK)
	}
}

func TestSpitTag(t *testing.T) {
	req, err := http.NewRequest("GET", "/tag", nil)
	if err != nil {
		t.Fatal(err)
	}
	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(SpitTag)
	handler.ServeHTTP(rr, req)
	if rr.Code != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v", rr.Code, http.StatusOK)
	}
	if strings.TrimSpace(rr.Body.String()) != "v3" {
		t.Errorf("expected v3, got %v", rr.Body.String())
	}
}
