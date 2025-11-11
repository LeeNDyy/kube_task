# Stage 1

FROM golang:1.24 AS builder

WORKDIR /myapp

COPY ./go/main.go .
COPY ./go.mod .

RUN go mod tidy

RUN go build -o go /myapp/main.go

# Stage 2

FROM alpine:3.22

WORKDIR /myapp

COPY --from=builder /myapp/goservice .

CMD [ "/myapp/goservice" ]