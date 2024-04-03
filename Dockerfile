FROM golang:1.21 AS builder

WORKDIR /dir

COPY . .

# Download and install all dependencies
RUN go mod download

# Build the binary statically
RUN go build -o build/fizzbuzz

FROM gcr.io/distroless/base-debian12

WORKDIR /app
COPY --from=builder /dir/templates /app/templates
COPY --from=builder /dir/build/fizzbuzz /app
CMD ["./fizzbuzz", "serve"]