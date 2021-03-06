#!/bin/bash

HELM_REPO=$bamboo_HELM_REPO

kubectl create ns production

kubectl run myapplication --image=rafaelbotelhoawtce/hdc:latest --port=8080 -n production
sleep 60
kubectl expose deployment myapplication --type=LoadBalancer --port=8080 -n production

#rm -rf helm
helm repo add helm $HELM_REPO
helm repo update

#helm install
helm install --namespace production --name myapplication-latest-prod --set image.repository=rafaelbotelhoawtce/hdc,image.tag=latest helm/devops

#helm upgrade
helm upgrade --install --namespace production myapplication-latest-prod --set image.repository=rafaelbotelhoawtce/hdc,image.tag=latest helm/devops

kubectl run myapplication --labels="app=myapplication" --image=rafaelbotelhoawtce/hdc:latest --replicas=2 --port=8080
