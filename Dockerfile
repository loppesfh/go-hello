FROM golang:1.17 AS builder

WORKDIR /go/src/app

COPY hello.go .

RUN go build hello.go

###### Multi stage
FROM alpine:3.5
RUN apk add --no-cache
COPY --from=builder /go/src/app/hello /app/

CMD [ "/app/hello" ]