#OBJECTIVES
#In this lab, you learn how to perform the following tasks:
#provision a Kubernetes cluster using Kubernetes Engine
#Deploy and manage Docker containers using kubectl

#launch the ephemeral VM by clicking on the "Activate Cloud Shell" icon
#ensure the correct project ID is set

gcloud config set project qwiklabs-gcp-03-9b1e5d7d1c7b

#create an environment variable referencing your zone

export MY_ZONE=us-central1-a

#start a Kubernetes cluster managed by Kubernetes Engine named "webfrontend" and configure it to run "2" nodes

gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2

#check the installed version of Kubernetes

kubectl get pods

#expose the nginx container to the internet

kubectl expose deployment nginx --port 80 --type LoadBalancer

#view the new service

kubectl get services

#scale up the number of pods running on your service

kubectl scale deployment nginx --replicas 3

#confirm that Kubernetes has updated the number of pod

kubectl get pods

#confirm that your external IP address has not changed

kubectl get services
