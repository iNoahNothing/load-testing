FROM alpine:3.8
RUN apk add --no-cache ca-certificates python3 libc6-compat curl bc bash
COPY kubectl simple-load test.sh /usr/local/bin/
RUN mkdir /var/lib/max-load
CMD ["test.sh"]
