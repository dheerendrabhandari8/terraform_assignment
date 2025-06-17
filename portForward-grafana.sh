#!/bin/bash
#
sleep 30

echo "Installing/upgrading Grafana..."
helm upgrade --install grafana grafana/grafana \
  --set service.type=NodePort \
  --set service.nodePort=30800 \
  --set service.port=3000

sleep 30
kubectl port-forward svc/grafana 3001:3000 --address 0.0.0.0 &

echo ""
echo "✅ Services deployed and exposed via NodePorts:"

#kubectl get secret --namespace default grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
