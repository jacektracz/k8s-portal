microk8s kubectl create deployment microbot --image=dontrebootme/microbot:v1

microk8s kubectl expose deployment microbot --type=NodePort --port=80 --name=microbot-service


microk8s kubectl describe services microbot-nodeport


debian@vps-543d2d81:/lkd/ht/k8s-portal-ovh/app/k8s-example-np$ microk8s kubectl describe services microbot-nodeport

Name:                     microbot-nodeport
Namespace:                default
Labels:                   tier=backend
Annotations:              <none>
Selector:                 app=microbot,tier=microbot-backend
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.152.183.187
IPs:                      10.152.183.187
Port:                     http  9090/TCP
TargetPort:               80/TCP
NodePort:                 http  30013/TCP
Endpoints:                <none>
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>

sudo curl http://146.59.19.222:30013

sudo ufw allow 30013
