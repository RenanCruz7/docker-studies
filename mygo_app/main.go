package main

import (
	"fmt"
	"net/http"
)

func main() {
	// Definir a porta do servidor, usando variável de ambiente ou padrão 8080
	fmt.Print("Starting server on port 8080...\n")
	http.ListenAndServe(":8080", nil)
}
