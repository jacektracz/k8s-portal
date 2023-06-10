
debian@vps-543d2d81:/lkd/ht/k8s-portal-ovh/app/k8s-nginx-stateful$ microk8s kubectl describe deployments
Name:               mysql
Namespace:          default
CreationTimestamp:  Thu, 08 Jun 2023 09:40:18 +0000
Labels:             <none>
Annotations:        deployment.kubernetes.io/revision: 1
Selector:           app=mysql
Replicas:           1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:       Recreate
MinReadySeconds:    0
Pod Template:
  Labels:  app=mysql
  Containers:
   mysql:
    Image:      mysql:5.6
    Port:       3306/TCP
    Host Port:  0/TCP
    Environment:
      MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-secret'>  Optional: false
    Mounts:
      /var/lib/mysql from mysql-persistent-storage (rw)
  Volumes:
   mysql-persistent-storage:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  mysql-pv-claim
    ReadOnly:   false
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   mysql-85f6b864f (1/1 replicas created)
Events:          <none>


Name:                   php
Namespace:              default
CreationTimestamp:      Thu, 08 Jun 2023 10:45:45 +0000
Labels:                 tier=backend
Annotations:            deployment.kubernetes.io/revision: 4
Selector:               app=php,tier=backend
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=php
           tier=backend
  Init Containers:
   install:
    Image:      busybox
    Port:       <none>
    Host Port:  <none>
    Command:
      wget
      -O
      /index.php
      https://raw.githubusercontent.com/do-community/php-kubernetes/master/index.php
    Environment:  <none>
    Mounts:
      /app from code (rw)
  Containers:
   php:
    Image:        php:7-fpm
    Port:         <none>
    Host Port:    <none>
    Environment:  <none>
    Mounts:
      /app from code (rw)
  Volumes:
   code:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  code-pv-claim
    ReadOnly:   false
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  php-5486ff9497 (0/0 replicas created), php-85d655f877 (0/0 replicas created), php-5c7c797c67 (0/0 replicas created)
NewReplicaSet:   php-54f65c49d9 (1/1 replicas created)
Events:          <none>


Name:                   init-container-msg-deployment
Namespace:              default
CreationTimestamp:      Thu, 08 Jun 2023 15:50:51 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=init-container-msg-app
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=init-container-msg-app
  Init Containers:
   init-container-msg-container-init:
    Image:      busybox
    Port:       <none>
    Host Port:  <none>
    Command:
      /bin/sh
      -c
      echo 'message from init' > /init-container-msg-mount-path/this
    Environment:  <none>
    Mounts:
      /init-container-msg-mount-path from init-container-msg-volume (rw)
  Containers:
   init-container-msg-container-main:
    Image:      busybox
    Port:       <none>
    Host Port:  <none>
    Command:
      /bin/sh
      -c
      while true; do cat /init-container-msg-mount-path/this; sleep 5; done
    Environment:  <none>
    Mounts:
      /init-container-msg-mount-path from init-container-msg-volume (rw)
  Volumes:
   init-container-msg-volume:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:
    SizeLimit:  <unset>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   init-container-msg-deployment-5f46bd6bcf (1/1 replicas created)
Events:          <none>


Name:                   nginx-deployment
Namespace:              default
CreationTimestamp:      Thu, 08 Jun 2023 15:53:17 +0000
Labels:                 <none>
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app=nginx
Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx
  Containers:
   nginx:
    Image:        nginx:1.14.2
    Port:         90/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  nginx-deployment-cbdccf466 (0/0 replicas created)
NewReplicaSet:   nginx-deployment-6c84585867 (2/2 replicas created)
Events:          <none>


Name:                   hello-world
Namespace:              default
CreationTimestamp:      Fri, 09 Jun 2023 10:56:27 +0000
Labels:                 app.kubernetes.io/name=load-balancer-example
Annotations:            deployment.kubernetes.io/revision: 2
Selector:               app.kubernetes.io/name=load-balancer-example
Replicas:               5 desired | 5 updated | 5 total | 5 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app.kubernetes.io/name=load-balancer-example
  Containers:
   hello-world:
    Image:        gcr.io/google-samples/node-hello:1.0
    Port:         10901/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  hello-world-77bc9c48b8 (0/0 replicas created)
NewReplicaSet:   hello-world-598549cbc9 (5/5 replicas created)
Events:          <none>


Name:                   hello-world-2
Namespace:              default
CreationTimestamp:      Fri, 09 Jun 2023 11:09:04 +0000
Labels:                 app.kubernetes.io/name=load-balancer-example
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app.kubernetes.io/name=load-balancer-example-2
Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app.kubernetes.io/name=load-balancer-example-2
  Containers:
   hello-world-2:
    Image:        gcr.io/google-samples/node-hello:1.0
    Port:         10901/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:       <none>
  Volumes:        <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   hello-world-2-5bb4f4b94c (2/2 replicas created)
Events:          <none>


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


Name:                   nginx-ng-10905
Namespace:              default
CreationTimestamp:      Fri, 09 Jun 2023 14:34:59 +0000
Labels:                 app=nginx-app-10905
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=nginx-app-10905
Replicas:               2 desired | 2 updated | 2 total | 2 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx-app-10905
  Containers:
   nginx-cnt-ng-10905:
    Image:        nginx:1.14.2
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
OldReplicaSets:  <none>
NewReplicaSet:   nginx-ng-10905-55bc66c576 (2/2 replicas created)
Events:          <none>


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


Name:                   nginx-busybox
Namespace:              default
CreationTimestamp:      Thu, 08 Jun 2023 15:18:39 +0000
Labels:                 tier=backend
Annotations:            deployment.kubernetes.io/revision: 3
Selector:               app=nginx-busybox,tier=backend
Replicas:               1 desired | 1 updated | 1 total | 0 available | 1 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx-busybox
           tier=backend
  Containers:
   nginx-busybox:
    Image:        busybox
    Port:         80/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:
      /etc/nginx/conf.d from config (rw)
  Volumes:
   config:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      nginx-config
    Optional:  false
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Progressing    True    NewReplicaSetAvailable
  Available      False   MinimumReplicasUnavailable
OldReplicaSets:  nginx-busybox-5f465cb4f4 (0/0 replicas created), nginx-busybox-c9fd499f (0/0 replicas created)
NewReplicaSet:   nginx-busybox-7df48cf5bc (1/1 replicas created)
Events:          <none>


Name:                   nginx
Namespace:              default
CreationTimestamp:      Thu, 08 Jun 2023 12:21:52 +0000
Labels:                 tier=backend
Annotations:            deployment.kubernetes.io/revision: 5
Selector:               app=nginx,tier=backend
Replicas:               1 desired | 1 updated | 1 total | 0 available | 1 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=nginx
           tier=backend
  Containers:
   nginx:
    Image:        nginx:1.7.9
    Port:         10480/TCP
    Host Port:    0/TCP
    Environment:  <none>
    Mounts:
      /app from code (rw)
      /etc/nginx/conf.d from config (rw)
  Volumes:
   code:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  code-pv-claim
    ReadOnly:   false
   config:
    Type:      ConfigMap (a volume populated by a ConfigMap)
    Name:      nginx-config
    Optional:  false
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Progressing    True    NewReplicaSetAvailable
  Available      False   MinimumReplicasUnavailable
OldReplicaSets:  nginx-79fbc7bdf6 (0/0 replicas created), nginx-9dfcfc48b (0/0 replicas created), nginx-64976d4cdf (0/0 replicas created)
NewReplicaSet:   nginx-7887445865 (1/1 replicas created)
Events:          <none>
