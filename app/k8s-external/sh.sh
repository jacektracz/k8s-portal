microk8s kubectl apply -f depl.yaml
microk8s kubectl apply -f sv.yaml
microk8s kubectl apply -f svn.yaml
microk8s kubectl apply -f svnp.yaml
microk8s kubectl apply -f ng.yaml

microk8s kubectl port-forward -n default service/nginx-svc-10905 30012:10905 --address 146.59.19.222

sudo netstat -tlpn| grep nginx

sudo curl http://146.59.19.222:30007

sudo ufw allow 30007


sudo iptables -I INPUT 1 -i eth0 -p tcp --dport 30007 -j ACCEPT

microk8s kubectl apply -f https://k8s.io/examples/service/access/hello-application.yaml


microk8s kubectl describe services nginx-nodeport-10905


microk8s kubectl expose deployment nginx-depl-10905 --type=NodePort --port=80 --name=nginx-nodeport-manual-10905


microk8s kubectl describe services nginx-nodeport-manual-10905

-manual-10905
Name:                     nginx-nodeport-manual-10905
Namespace:                default
Labels:                   app=nginx-app-10905
Annotations:              <none>
Selector:                 app=nginx-app-10905
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.152.183.237
IPs:                      10.152.183.237
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30126/TCP
Endpoints:                10.1.47.235:80,10.1.47.236:80,10.1.47.237:80 + 4 more...
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>

sudo ufw allow 30126

sudo curl http://146.59.19.222:30126