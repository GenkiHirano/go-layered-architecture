FROM golang:1.13.11-alpine3.11 AS build

ENV GO111MODULE=on

WORKDIR /

COPY . /go/src/github.com/GenkiHirano/layered-architecture

RUN apk update && apk add --no-cache git
RUN cd /go/src/github.com/GenkiHirano/layered-architecture/api && go build -o bin/sample main.go

FROM alpine:3.8

COPY --from=build /go/src/github.com/GenkiHirano/layered-architecture/api/bin/sample /usr/local/bin/

CMD ["sample"]
