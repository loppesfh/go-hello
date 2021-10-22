FROM golang:1.17 AS builder

WORKDIR /go/src/app

COPY hello.go .

RUN go build -ldflags "-s -w" hello.go

#RUN go build hello.go

###### Multi stage
FROM busybox
COPY --from=builder /go/src/app/hello /app/

CMD [ "/app/hello" ]