FROM golang:1.19.5 as builder

WORKDIR /usr/src/app
COPY main/main.go .
RUN go build main.go

FROM scratch
COPY --from=builder /usr/src/app/main /
ENTRYPOINT ["/main"]