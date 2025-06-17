#!/bin/bash

# 1. Expose test-app-service using NodePort on 31000
kubectl patch svc test-app-service \
  -p '{"spec": {"type": "NodePort", "ports": [{"port": 3000, "targetPort": 3000, "nodePort": 31000}]}}'

# 2. Deploy/Upgrade Prometheus with NodePort on 30900
echo "Installing/upgrading Prometheus..."
helm upgrade --install prometheus prometheus-community/prometheus \
  --set server.service.type=NodePort \
  --set server.service.nodePort=30900 \
  --set server.service.port=9090

# 3. Deploy/Upgrade Grafana with NodePort on 30800
echo "Installing/upgrading Grafana..."
helm upgrade --install grafana grafana/grafana \
  --set service.type=NodePort \
  --set service.nodePort=30800 \
  --set service.port=3000


kubectl port-forward svc/grafana 3001:3000 --address 0.0.0.0 &

echo ""
echo "✅ Services deployed and exposed via NodePorts:"
