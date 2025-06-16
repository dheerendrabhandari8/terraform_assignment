kubectl port-forward svc/test-app-service 3000:3000 --address 0.0.0.0 &


helm upgrade --install prometheus prometheus-community/prometheus   --set server.service.type=NodePort   --set server.service.nodePort=30900 --set server.service.port=9090

kubectl port-forward svc/prometheus-server 9090:80 --address 0.0.0.0 &

kubectl port-forward svc/grafana 3000:3000 --address 0.0.0.0 &
