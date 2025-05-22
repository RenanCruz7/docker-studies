FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o server main.go
#CMD ["./server"]
# Se voce tiver uma aplicaçao com uma inicializaçao fixa melhor utilizar o entrypoint porem caso queira passar mais argumentos voce pode utilizar o CMD
# ou ate mesmo colocar o comando que voce quer executar na linha de comando do docker run 
ENTRYPOINT ["./server"]




#Final Stage
#FROM scratch
#COPY --from=builder /app/server /server