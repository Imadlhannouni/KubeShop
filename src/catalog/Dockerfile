FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY main.go .
RUN go build -o catalog-service main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/catalog-service .
ENV PORT=8080
CMD ["./catalog-service"]
