# STEP-1
# build application from source

FROM golang:1.24-alpine3.20 AS builder

ENV GOCACHE=/root/.cache/go-build

WORKDIR /appsource

COPY ./go ./go
COPY ./go.mod ./

RUN go mod tidy

RUN --mount=type=cache,target="/root/.cache/go-build" \
   go build -o applinux ./go/main.go

# STEP-2
# make docker container

FROM alpine:3.20

WORKDIR /myapp

COPY --from=builder /appsource/applinux ./

CMD [ "/myapp/applinux" ]