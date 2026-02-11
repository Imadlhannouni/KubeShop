FROM golang:1.21-alpine AS builder

WORKDIR /app
COPY main.go .
RUN go build -o payment-service main.go

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /app/payment-service .
ENV PORT=8082
CMD ["./payment-service"]
