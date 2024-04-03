FROM golang:1.17-alpine

WORKDIR /app

COPY . .

RUN go build -o build/fizzbuzz

EXPOSE 8080

CMD ["./build/fizzbuzz", "serve"]