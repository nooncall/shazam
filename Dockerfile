## Modified from https://github.com/pingcap/tidb/blob/master/Dockerfile

FROM golang:1.13-alpine as builder

RUN apk add --no-cache \
    wget \
    make \
    git \
    gcc \
    musl-dev \
    bash

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 \
 && chmod +x /usr/local/bin/dumb-init

RUN mkdir -p /go/src/github.com/nooncall/shazam
WORKDIR /go/src/github.com/nooncall/shazam

# Cache dependencies
COPY go.mod .
COPY go.sum .

RUN GO111MODULE=on go mod download

# Build real binaries
COPY . .
RUN CGO_ENABLED=0 make shazam-proxy

# Executable image
FROM alpine

COPY --from=builder /go/src/github.com/nooncall/shazam/bin/shazam-proxy /shazam-proxy
COPY --from=builder /usr/local/bin/dumb-init /usr/local/bin/dumb-init

WORKDIR /shazam

EXPOSE 3306

ENTRYPOINT ["/usr/local/bin/dumb-init", "/shazam-proxy"]
CMD ["-config", "./etc/shazam_proxy.ini"]
