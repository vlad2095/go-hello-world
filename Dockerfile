# Dockerfile
FROM golang:1.17-alpine AS build

WORKDIR /app
COPY go.mod .
COPY go.sum .
RUN go mod download

COPY . .

RUN go build -o /go-hello-world

FROM alpine:3.14
COPY --from=build /go-hello-world /go-hello-world
ENTRYPOINT ["/go-hello-world"]
