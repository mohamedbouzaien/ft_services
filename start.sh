#!/bin/sh

GREEN='\e[0;32m'
BLUE='\e[0;34m'
END='\e[0;0m'

minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=3000-35000

eval $(minikube docker-env)
echo "${GREEN}Docker build init${END}"
docker build -t service_nginx ./srcs/nginx
#docker build -t service_influxdb ./srcs/influxdb
#docker build -t service_grafana ./srcs/grafana
docker build -t service_mysql ./srcs/mysql
docker build -t service_wordpress ./srcs/wordpress
docker build -t service_phpmyadmin ./srcs/phpmyadmin

kubectl create -f ./srcs/nginx/nginx.yaml
#kubectl create -f ./srcs/influxdb/influxdb-secrets.yaml
#kubectl create -f ./srcs/influxdb/influxdb.yaml
#kubectl create -f ./srcs/grafana/grafana.yaml
kubectl create -f ./srcs/mysql/mysql-secrets.yaml
kubectl create -f ./srcs/mysql/mysql.yaml
kubectl create -f ./srcs/wordpress/wordpress.yaml
kubectl create -f ./srcs/phpmyadmin/phpmyadmin.yaml


minikube dashboard