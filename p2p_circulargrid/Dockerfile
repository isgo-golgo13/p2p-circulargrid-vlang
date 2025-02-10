FROM vlang/vlang:latest AS builder
WORKDIR /app
COPY src/ src/
COPY v.mod v.mod
RUN v -prod -o /app/bin/p2p-node src/main.v

FROM alpine:latest
WORKDIR /app
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser
COPY --from=builder /app/bin/p2p-node /app/p2p-node
EXPOSE 8080
ENTRYPOINT ["/app/p2p-node"]
