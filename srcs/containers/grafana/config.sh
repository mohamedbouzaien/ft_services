#!/bin/sh
mv /tmp/datasource.yaml /usr/share/grafana/conf/provisioning/datasources/
mv /tmp/dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
mv /tmp/*.json /usr/share/grafana/conf/provisioning/dashboards/
telegraf & /usr/sbin/grafana-server --homepath=/usr/share/grafana