#!/bin/sh

GREEN='\e[0;32m'
BLUE='\e[0;34m'
END='\e[0;0m'

minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000

eval $(minikube docker-env)
docker build -t service_nginx ./srcs/containers/nginx
docker build -t service_influxdb ./srcs/containers/influxdb
docker build -t service_grafana ./srcs/containers/grafana
docker build -t service_mysql ./srcs/containers/mysql
docker build -t service_wordpress ./srcs/containers/wordpress
docker build -t service_phpmyadmin ./srcs/containers/phpmyadmin
docker build -t service_ftps ./srcs/containers/ftps

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.6/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl create -f ./srcs/manifests/metallb.yaml
kubectl create -f ./srcs/manifests/nginx.yaml
kubectl create -f ./srcs/manifests/influxdb-secrets.yaml
kubectl create -f ./srcs/manifests/influxdb.yaml
kubectl create -f ./srcs/manifests/grafana.yaml
kubectl create -f ./srcs/manifests/mysql-secrets.yaml
kubectl create -f ./srcs/manifests/mysql.yaml
kubectl create -f ./srcs/manifests/wordpress.yaml
kubectl create -f ./srcs/manifests/phpmyadmin.yaml
kubectl create -f ./srcs/manifests/ftps.yaml


minikube dashboard