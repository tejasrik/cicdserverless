#!/bin/bash
kubectl create -f cluster-role-binding.yaml --kubeconfig /home/ubuntu/admin.conf
kubectl create -f cluster-role.yaml --kubeconfig /home/ubuntu/admin.conf                
kubectl create -f deployment.yaml --kubeconfig /home/ubuntu/admin.conf
kubectl create -f service-account.yaml --kubeconfig /home/ubuntu/admin.conf
kubectl create -f service.yaml --kubeconfig /home/ubuntu/admin.conf
