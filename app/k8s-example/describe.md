debian@vps-543d2d81:/lkd/ht/k8s-portal-ovh/app/k8s-external$ 

microk8s kubectl describe deployment  microbot
Name:                   microbot
Namespace:              default
CreationTimestamp:      Fri, 09 Jun 2023 18:26:06 +0000
Labels:                 app=microbot
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=microbot
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=microbot
  Containers:
   microbot:
    Image:        dontrebootme/microbot:v1
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   microbot-66f478bcc6 (1/1 replicas created)
Events:          <none>

debian@vps-543d2d81:/lkd/ht/k8s-portal-ovh/app/k8s-external$
