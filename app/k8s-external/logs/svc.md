debian@vps-543d2d81:/lkd/ht/k8s-portal-ovh/app/k8s-external$ microk8s kubectl get svc
NAME                             TYPE           CLUSTER-IP       EXTERNAL-IP     PORT(S)           AGE
kubernetes                       ClusterIP      10.152.183.1     <none>          443/TCP           29h
wordpress-mysql                  ClusterIP      None             <none>          3306/TCP          29h
mysql                            ClusterIP      10.152.183.150   <none>          3306/TCP          29h
php                              ClusterIP      10.152.183.252   <none>          9000/TCP          28h
nginx-deployment                 ClusterIP      10.152.183.37    <none>          90/TCP            17h
nginx-out                        NodePort       10.152.183.163   <none>          80:31168/TCP      17h
nginx-out-90                     NodePort       10.152.183.125   <none>          90:31087/TCP      17h
nginx                            ClusterIP      10.152.183.69    146.59.19.222   10900/TCP         28h
my-service                       LoadBalancer   10.152.183.94    <pending>       8080:31323/TCP    4h7m
my-service-2                     LoadBalancer   10.152.183.147   <pending>       10901:31646/TCP   3h55m
nginx-10901                      ClusterIP      10.152.183.52    <none>          10901/TCP         3h2m
nginx-svc-10905                  ClusterIP      10.152.183.126   <none>          10905/TCP         62m
nginx-clusterip-10905            ClusterIP      10.152.183.24    <none>          10905/TCP         12m

nginx-clusterip-external-10905   ClusterIP      10.152.183.91    146.59.19.222   10909/TCP         12m

nginx-nodeport-10905             NodePort       10.152.183.198   <none>          80:30007/TCP      43m


debian@vps-543d2d81:/lkd/ht/k8s-portal-ovh/app/k8s-external$
