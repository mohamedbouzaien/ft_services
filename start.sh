#!/bin/sh

minikube start --vm-driver=docker --extra-config=apiserver.service-node-port-range=1-35000

eval $(minikube docker-env)
docker build -t service_grafana ./srcs/grafana

kubectl create -f ./srcs/influxdb/influxdb-secrets.yaml
kubectl create -f ./srcs/influxdb/influxdb.yaml
kubectl create -f ./srcs/grafana/grafana.yaml

minikube dashboard