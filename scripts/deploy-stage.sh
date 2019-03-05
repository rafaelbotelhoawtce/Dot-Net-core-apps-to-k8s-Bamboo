#!/bin/bash

HELM_REPO=$bamboo_HELM_REPO

#create env if not present
kubectl create ns staging

kubectl run myapplication --image=rafaelbotelhoawtce/hdc:latest --port=8080 -n staging
sleep 60
kubectl expose deployment myapplication --type=LoadBalancer --port=8080 -n staging

#rm -rf helm
helm repo add helm $HELM_REPO
helm repo update

#helm install
helm install --namespace staging --name myapplication-latest-stage --set image.repository==rafaelbotelhoawtce/hdc,image.tag=latest helm/devops

#helm upgrade
#helm upgrade --install --namespace staging myapplication-stage --set image.repository=rafaelbotelhoawtce/hdc,image.tag=latest helm/devops
