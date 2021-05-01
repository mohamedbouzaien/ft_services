FROM alpine

RUN apk update && apk add --no-cache --upgrade bash \
&& apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-7.5.5.linux-amd64.tar.gz \
&& tar -zxvf grafana-7.5.5.linux-amd64.tar.gz
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh
EXPOSE 3000
CMD ./start.sh