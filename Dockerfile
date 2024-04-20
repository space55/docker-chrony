FROM alpine:latest AS builder

ARG CHRONY_VERSION=4.5

EXPOSE 123

WORKDIR /workdir

RUN apk add alpine-sdk pps-tools pps-tools-dev

RUN wget https://chrony-project.org/releases/chrony-${CHRONY_VERSION}.tar.gz

RUN tar -xvf chrony-${CHRONY_VERSION}.tar.gz
RUN cd chrony-${CHRONY_VERSION} && ./configure
RUN cd chrony-${CHRONY_VERSION} && make
RUN mv chrony-${CHRONY_VERSION} chrony

FROM alpine:latest

COPY --from=builder /workdir/chrony/chronyd /bin/chronyd
COPY --from=builder /workdir/chrony/chronyc /bin/chronyc

ENTRYPOINT ["/bin/chronyd"]

CMD ["-d"]