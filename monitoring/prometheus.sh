#!/bin/bash 
kubectl create namespace monitoring --kubeconfig /home/ubuntu/admin.conf
kubectl create -f clusterRole.yaml --kubeconfig /home/ubuntu/admin.conf
kubectl create -f config-map.yaml --kubeconfig /home/ubuntu/admin.conf
kubectl create  -f prometheus-deployment.yaml --kubeconfig /home/ubuntu/admin.conf
kubectl create -f prometheus-service.yaml --namespace=monitoring --kubeconfig /home/ubuntu/admin.conf

  
