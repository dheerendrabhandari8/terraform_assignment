# 1. Expose test-app-service on port 3001
kubectl port-forward svc/test-app-service 3001:3001 --address 0.0.0.0 &

# 2. Deploy/Upgrade Prometheus with desired NodePort and service port
helm upgrade --install prometheus prometheus-community/prometheus \
  --set server.service.type=NodePort \
  --set server.service.nodePort=30900 \
  --set server.service.port=9090

# 3. Expose Prometheus on port 9090 (forwards to service's internal port 9090)
kubectl port-forward svc/prometheus-server 9090:80 --address 0.0.0.0 &


helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install grafana grafana/grafana
kubectl port-forward svc/grafana 3000:80 --address 0.0.0.0 &
