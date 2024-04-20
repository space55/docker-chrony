FROM alpine:latest

EXPOSE 123

RUN apk add chrony

ENTRYPOINT ["chronyd"]

CMD ["-d"]