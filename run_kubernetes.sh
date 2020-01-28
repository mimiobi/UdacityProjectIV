#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=mimiobi/udacity-pfour:v2

#Step 2:
# Run the Docker Hub container with kubernetes

kubectl create deployment upfour --image=$dockerpath
# Step 3:
# List kubernetes pods

kubectl get pods
echo "sleeping for 10 secondss while waiting for pod to come up"
sleep 30

# Step 4:
#Create Service(LoadBalancer) for the deployment
kubectl expose deployment upfour --type="NodePort" --port=80
sleep 10

#Define variable for targetPort and get the targetPort
#PORT_ID=$(Kubectl get svc -o jsonpath='{.items[1].spec.ports[].targetPort}')
#kubectl port-forward deployment/upfour 8000:$PORT_ID

# Forward the container port to a host
kubectl port-forward deployment/upfour 8000:80

kubectl logs --selector app=upfour

