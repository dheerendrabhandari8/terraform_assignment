#!/bin/bash

kubectl set image deployment/test-app-deployment test-app=dheerendrabhandari/nodejsapp:latest && kubectl rollout status deployment/test-app-deployment

sleep 20
cd /home/ubuntu/terraform_assignment/ && kubectl apply -f  ingress.yaml
cd /home/ubuntu/terraform_assignment/ && kubectl apply -f  service.yaml
