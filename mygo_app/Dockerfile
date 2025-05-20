FROM golang:latest AS builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -ldflags '-extldflags "-static"' -o server main.go

#Final Stage
FROM scratch
COPY --from=builder /app/server /server

CMD ["./server"]