#!/bin/sh
minikube --vm-driver=virtualbox start 
#--disk-size=5000MB;
minikube addons enable metallb;
minikube addons enable dashboard;

kubectl apply -f ./srcs/metallb.yaml

eval $(minikube docker-env)
docker build -t nginx_img ./srcs/nginx
docker build -t phpmyadmin_img ./srcs/phpmyadmin
docker build -t wordpress_img ./srcs/wordpress
docker build -t mysql_img ./srcs/mysql
docker build -t influxdb_img ./srcs/influxdb
docker build -t grafana_img ./srcs/grafana
docker build -t ftps_img ./srcs/ftps
kubectl apply -f ./srcs/nginx.yaml
kubectl apply -f ./srcs/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress.yaml
kubectl apply -f ./srcs/mysql.yaml
kubectl apply -f ./srcs/influxdb.yaml
kubectl apply -f ./srcs/grafana.yaml
kubectl apply -f ./srcs/ftps.yaml

minikube dashboard
