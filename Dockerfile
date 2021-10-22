FROM golang:1.17 AS builder

WORKDIR /go/src/app

COPY hello.go .

RUN go build -ldflags "-s -w" hello.go

###### Multi stage
FROM busybox:1.27
COPY --from=builder /go/src/app/hello /app/

CMD [ "/app/hello" ]