Skip to content

Make Contact
Services
Tech Services
More
All HowTo'sKubernetes & DockerLinuxUbuntu, Mint & Debian Linux
Kubernetes (MicroK8s) Part 3 – Exposing Applications on Ubuntu 20.04
February 21, 2021 Andrew Galdes 0
This article continues from Part 2 – Replica Sets and Scaling.

Our objective in this article is to get an application exposed to the wider network on an IP address of the host and a port of our choice. The IP address will be “10.0.0.210” and our port of choice will be “30036”.

We’re going to expose a dotNet application which, according to its documentation, listens on port “8080”.

Put the following content into a new file called “dotnet-rs.yaml”:

apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: dotnet-hello-rs # This is what our Service will point to. 
spec:
  replicas: 5 # This is the number of instances we want for this app.
  selector:
    matchLabels:
      app: dotnet-hello-rs
  template:
    metadata:
      labels:
        app: dotnet-hello-rs
    spec:
      containers:
      - name: dotnet-hello-rs
        image: appsvctest/dotnetcore # This is our image to execute. 
        ports:
        - containerPort: 8080 # Doco for this image says it's listening on this port. 
Put the following content into a new file called “dotnet-service.yaml”:

apiVersion: v1
kind: Service
metadata: 
  name: dotnet-hello-service
spec:
  selector: 
    app: dotnet-hello-service
  type: NodePort
  ports: 
    - name: http
      protocol: TCP
      nodePort: 30036 # The port our networked devices will look on for the application. 
      port: 9090 
      targetPort: 8080 # The port of the target ReplicaSet. 
  selector:
    app: dotnet-hello-rs # This is the name or the target ReplicaSet. 
    
Now start the ReplicaSet and Service objects.

sudo microk8s kubectl apply -f dotnet-rs.yaml
sudo microk8s kubectl apply -f dotnet-service.yaml
Validate our ReplicaSet:

sudo microk8s kubectl get rs -o wide
NAME              DESIRED   CURRENT   READY   AGE   CONTAINERS        IMAGES                  SELECTOR
dotnet-hello-rs   5         5         5       15m   dotnet-hello-rs   appsvctest/dotnetcore   app=dotnet-hello-rs
Validate our Service:

sudo microk8s kubectl get service -o wide
NAME                   TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)          AGE   SELECTOR
kubernetes             ClusterIP   10.152.183.1           443/TCP          32h   
dotnet-hello-service   NodePort    10.152.183.9           9090:30036/TCP   11m   app=dotnet-hello-rs
Ensure your firewall allows port “30036” through.

sudo ufw allow 30036
From the Kubernetes host, test that you can get to the Pod:

curl -v 10.152.183.9:8080
Now test from a networked machine (some other machine on your LAN):

curl -v 10.0.0.210:30036
You should get the output of the dotNet application.

Post navigation
Previous Post:Kubernetes (MicroK8s) Part 2 – Replica Sets and Scaling on Ubuntu 20.04Next Post:Ansible To Get Linux OS Version Details
LEAVE A REPLY
Your email address will not be published. Required fields are marked *

Comment * 

Name * 

Email * 

 

PHONE
Australia: +61 8 7324 4429
HEAD OFFICE
Level 2, 170 Greenhill Road Parkside, South Australia 5063
ANDREW GALDES

Welcome to AGIX. I'm the owner of the business. I'm also a member of the Linux System Administrator team responsible for maintaining our client's systems.

RHCE, Sec+, CySA+, CASP+, Linux+

View all posts
Search …

CATEGORIES
AGIX Discussion (52)
All HowTo's (381)
Ansible (11)
Ansible & Terraform Automation (18)
Apple MacOS (10)
Cyber-Security (159)
Kubernetes & Docker (10)
Linux (216)
Linux Administrators (6)
MariaDB (1)
MySQL & MariaDB (23)
pfSense & Netgate (14)
PostgreSQL (10)
Redhat, Fedora and CentOS Linux (161)
Scripting in Bash (22)
Security Baseline Templates (2)
SQL (1)
Terraform (2)
Ubuntu, Mint & Debian Linux (122)
Virtualization (12)
Web Servers (79)
Windows (29)
FOLLOW US
Linked In
Twitter
© 2023 | | Impresser Pty Ltd T/A AGIX, All Rights Reserved | ABN 32130229257 | Terms and Conditions | Linux System Administration | Ubuntu, Redhat & Cybersecurity