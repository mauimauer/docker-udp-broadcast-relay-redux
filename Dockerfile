FROM alpine:3.7
MAINTAINER mauimauer@gmail.com
ENV TTL_ID=5
ENV UDP_PORT=50222
ENV DEV_IN="eth0"
ENV DEV_INT="eth1"
RUN apk add --update alpine-sdk && apk add linux-headers
RUN git clone -q https://github.com/udp-redux/udp-broadcast-relay-redux.git
WORKDIR udp-broadcast-relay-redux
RUN make
RUN cp udp-broadcast-relay-redux /usr/local/bin
CMD udp-broadcast-relay-redux --id $TTL_ID --port $UDP_PORT --dev $DEV_IN --dev $DEV_OUT
