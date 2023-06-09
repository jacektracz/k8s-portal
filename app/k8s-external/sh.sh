microk8s kubectl apply -f depl.yaml
microk8s kubectl apply -f sv.yaml
microk8s kubectl apply -f svn.yaml
microk8s kubectl apply -f svnp.yaml
microk8s kubectl apply -f ng.yaml

microk8s kubectl port-forward -n default service/nginx-svc-10905 30012:10905 --address 146.59.19.222

sudo netstat -tlpn| grep nginx

sudo curl http://146.59.19.222:30007

sudo ufw allow 30036

sudo iptables -I INPUT 1 -i eth0 -p tcp --dport 30007 -j ACCEPT

microk8s kubectl apply -f https://k8s.io/examples/service/access/hello-application.yaml


microk8s kubectl describe services nginx-nodeport-10905