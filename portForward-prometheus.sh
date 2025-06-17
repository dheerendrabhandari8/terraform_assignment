#!/bin/bash
#
#
sleep 15

# 2. Deploy/Upgrade Prometheus with NodePort on 30900
echo "Installing/upgrading Prometheus..."
helm upgrade --install prometheus prometheus-community/prometheus \
  --set server.service.type=NodePort \
  --set server.service.nodePort=30900 \
  --set server.service.port=9090



kubectl port-forward svc/prometheus-server 9090:80 --address 0.0.0.0 &

echo ""
echo "✅ Services deployed and exposed via NodePorts:"

echo ""
echo "✅ Services deployed and exposed via NodePorts:"
