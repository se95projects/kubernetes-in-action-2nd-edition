## Grab password
kubectl get secret admin-user-token -n kubernetes-dashboard -o json | jq -r .data.token | base64 -d ; echo ""

## Get the service
kubectl get svc -n kubernetes-dashboard

## Edit the service
kubectl edit service kubernetes-dashboard -n kubernetes-dashboard

## Port-forward the service
kubectl port-forward svc/kubernetes-dashboard 1443:443 -n kubernetes-dashboard

## Headlamp
helm repo add headlamp https://kubernetes-sigs.github.io/headlamp/
kubectl create namespace headlamp
helm install my-headlamp headlamp/headlamp \
    --namespace headlamp \
    --set service.type=NodePort \
    --set service.nodePort=30003
kubectl -n headlamp create serviceaccount headlamp-admin
kubectl create clusterrolebinding headlamp-admin --serviceaccount=headlamp:headlamp-admin --clusterrole=cluster-admin
kubectl create token headlamp-admin -n headlamp