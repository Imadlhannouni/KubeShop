package main

import (
	"fmt"
	"math/rand"
	"net/http"
	"os"
	"time"
)

func pay(w http.ResponseWriter, r *http.Request) {
	// Simulate some latency
	time.Sleep(time.Duration(rand.Intn(500)) * time.Millisecond)

	// Simulate random failures (10% chance)
	if rand.Intn(100) < 10 {
		w.WriteHeader(http.StatusInternalServerError)
		w.Write([]byte("Payment Gateway Error"))
		return
	}

	w.WriteHeader(http.StatusOK)
	w.Write([]byte("Payment Processed"))
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8082"
	}

	http.HandleFunc("/pay", pay)
	
	fmt.Printf("Payment Service started on port %s\n", port)
	http.ListenAndServe(":"+port, nil)
}
