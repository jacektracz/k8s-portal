/* =================================================================== */
/*
/*
/* =================================================================== */

microk8s kubectl describe services nginx-nodeport-10905

Name:                     nginx-nodeport-10905
Namespace:                default
Labels:                   tier=backend
Annotations:              <none>
Selector:                 app=nginx-app-10905,tier=backend
Type:                     NodePort
IP Family Policy:         SingleStack
IP Families:              IPv4
IP:                       10.152.183.198
IPs:                      10.152.183.198
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  30007/TCP
Endpoints:                <none>
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>


/* =================================================================== */
/*
/*
/* =================================================================== */



microk8s kubectl describe deployments nginx-depl-10905

Name:                   nginx-depl-10905
Namespace:              default
CreationTimestamp:      Fri, 09 Jun 2023 14:08:05 +0000
Labels:                 app=nginx-app-10905
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app=nginx-app-10905
Replicas:               5 desired | 5 updated | 5 total | 5 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx-app-10905
  Containers:
   nginx-cont-hello-10905:
    Image:        gcr.io/google-samples/node-hello:1.0
    Port:         80/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  nginx-depl-10905-5cb9f8d575 (0/0 replicas created)
NewReplicaSet:   nginx-depl-10905-5bf9796bc5 (5/5 replicas created)
Events:          <none>

/* =================================================================== */
/*
/*
/* =================================================================== */

