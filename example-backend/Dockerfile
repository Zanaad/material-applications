FROM golang:1.16-alpine AS build-stage

WORKDIR /app

ENV CGO_ENABLED=0
ENV PORT=8080
ENV REQUEST_ORIGIN=http://localhost

COPY . .

RUN go build -o server . && \
 rm -rf /var/cache/apk/* && \
 rm -rf /tmp/* && \
 rm -rf /root/.cache/go-build /go/pkg/mod

FROM alpine:3.18 AS runtime

WORKDIR /app

COPY --from=build-stage /app/server .

RUN adduser -D appuser
USER appuser

EXPOSE 8080
CMD ["./server"]