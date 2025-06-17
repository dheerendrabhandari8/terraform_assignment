#!/bin/bash
#
#
sleep 60
kubectl port-forward svc/test-app-service 3000:3000 --address 0.0.0.0 &
