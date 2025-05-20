package main

import (
    "fmt"
    "log"
    "net/http"
    "os"
)

func main() {
    // Definir a porta do servidor, usando variável de ambiente ou padrão 8080
    port := os.Getenv("PORT")
    if port == "" {
        port = "8080"
    }
    
    // Manipulador da rota principal
    http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
        log.Printf("Recebida requisição %s %s", r.Method, r.URL.Path)
        
        // Escrever resposta
        fmt.Fprintf(w, "Olá do servidor Go! Esta é uma aplicação simples.")
    })
    
    // Manipulador para rota de status
    http.HandleFunc("/status", func(w http.ResponseWriter, r *http.Request) {
        w.WriteHeader(http.StatusOK)
        fmt.Fprintf(w, "Servidor operacional!")
    })
    
    // Iniciar o servidor
    serverAddr := ":" + port
    log.Printf("Iniciando servidor na porta %s...", port)
    
    if err := http.ListenAndServe(serverAddr, nil); err != nil {
        log.Fatalf("Erro ao iniciar servidor: %v", err)
    }
}