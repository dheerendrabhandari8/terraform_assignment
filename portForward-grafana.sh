#!/bin/bash

echo "Installing/upgrading Grafana..."
helm upgrade --install grafana grafana/grafana \
  --set service.type=NodePort \
  --set service.nodePort=30800 \
  --set service.port=3000


kubectl port-forward svc/grafana 3001:3000 --address 0.0.0.0 &

echo ""
echo "✅ Services deployed and exposed via NodePorts:"
