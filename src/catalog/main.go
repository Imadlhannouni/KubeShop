package main

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"
	"os"
)

type Product struct {
	ID    string  `json:"id"`
	Name  string  `json:"name"`
	Price float64 `json:"price"`
}

var products = []Product{
	{ID: "1", Name: "Kubernetes T-Shirt", Price: 19.99},
	{ID: "2", Name: "Kuberstronaut Mug", Price: 12.50},
	{ID: "3", Name: "Container Sticker Pack", Price: 5.00},
}

func getProducts(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(products)
}

func healthCheck(w http.ResponseWriter, r *http.Request) {
	w.WriteHeader(http.StatusOK)
	w.Write([]byte("OK"))
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	http.HandleFunc("/products", getProducts)
	http.HandleFunc("/health", healthCheck)

	fmt.Printf("Catalog Service started on port %s\n", port)
	log.Fatal(http.ListenAndServe(":"+port, nil))
}
