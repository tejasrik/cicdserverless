#!/bin/bash
kubectl create -f grafana-datasource-config.yaml --kubeconfig /home/ubuntu/admin.conf
kubectl create -f deployment.yaml --kubeconfig /home/ubuntu/admin.conf
kubectl create -f service.yaml --kubeconfig /home/ubuntu/admin.conf
