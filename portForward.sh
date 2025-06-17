# 1. Expose test-app-service on port 3001
kubectl port-forward svc/test-app-service 3000:31000 --address 0.0.0.0

# 2. Deploy/Upgrade Prometheus with desired NodePort and service port
#helm upgrade --install prometheus prometheus-community/prometheus \
 # --set server.service.type=NodePort \
 # --set server.service.nodePort=30900 \
 # --set server.service.port=9090

# 3. Expose Prometheus on port 9090 (forwards to service's internal port 9090)
#kubectl port-forward svc/prometheus-server 9090:80 --address 0.0.0.0 &
#
#helm upgrade --install grafana grafana/grafana \
 # --set service.type=NodePort \
 # --set service.nodePort=30800 \
 # --set service.port=3000

#kubectl port-forward svc/grafana 30800:3000 --address 0.0.0.0 &
