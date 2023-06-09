microk8s kubectl create deployment microbot --image=dontrebootme/microbot:v1

microk8s kubectl expose deployment microbot --type=NodePort --port=80 --name=microbot-service

