microk8s kubectl apply -f depl.yaml
microk8s kubectl apply -f sv-10905.yaml
microk8s kubectl port-forward -n default service/nginx-svc-10905 30012:10905 --address 146.59.19.222
netstat -tlpn| grep nginx