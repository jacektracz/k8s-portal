cd /lkd/ht/k8s-portal-ovh/app/k8s-nginx-stateful

microk8s kubectl apply -f pv.yaml

microk8s kubectl apply -f pvc.yaml

microk8s kubectl apply -f ngi.yaml

microk8s kubectl apply -f ngi-depl.yaml

microk8s kubectl expose deployment task-pv-depl --type=NodePort --port=80 --name=task-pv-pod-service

microk8s kubectl describe deployments task-pv-depl

microk8s kubectl describe pods task-pv-pod

microk8s kubectl describe services task-pv-pod-service

