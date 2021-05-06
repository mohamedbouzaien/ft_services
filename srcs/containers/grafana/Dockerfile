FROM alpine

RUN apk update && apk add --no-cache --upgrade bash \
&& apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ grafana
COPY datasource.yaml dashboard.yaml dashboards /tmp/
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache
RUN mkdir -p /etc/telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf
COPY config.sh /config.sh
RUN chmod +x /config.sh
EXPOSE 3000
CMD ./config.sh