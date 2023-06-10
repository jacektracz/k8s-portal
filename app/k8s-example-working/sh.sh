microk8s kubectl create deployment microbot --image=dontrebootme/microbot:v1

microk8s kubectl expose deployment microbot --type=NodePort --port=80 --name=microbot-service


microk8s kubectl describe services microbot-service

Name:                     microbot-service
Namespace:                default
Labels:                   app=microbot
Annotations:              <none>
Selector:                 app=microbot
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.152.183.64
IPs:                      10.152.183.64
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  32368/TCP
Endpoints:                10.1.47.242:80
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>


sudo curl http://146.59.19.222:32368