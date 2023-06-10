microk8s kubectl port-forward -n kube-system service/kubernetes-dashboard 10902:443 --address 146.59.19.222

curl http://146.59.19.222:10902


https://146.59.19.222:10443/#/login