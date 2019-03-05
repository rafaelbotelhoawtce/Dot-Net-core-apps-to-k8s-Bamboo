#!/bin/bash

HELM_REPO=$bamboo_HELM_REPO


#create env if not present
kubectl create ns test

#kubectl run hello-dotnet --image=sugendh/dotnetcorebmb:latest --port=8080 -n test
#kubectl expose deployment hello-dotnet --type=LoadBalancer --port=8080 -n test

#rm -rf helm
/usr/local/bin/helm repo add helm $HELM_REPO
/usr/local/bin/helm repo update

#helm fetch http://23.101.135.43/artifactory/helm-local/devops-0.45.0.tgz

#helm install
/usr/local/bin/helm install --namespace test --name aw-application-latest-test --set image.repository=rafaelbotelhoawtce/hdc,image.tag=latest helm/devops

#helm upgrade
#/usr/local/bin/helm upgrade --install --namespace test aw-application-latest-test --set image.repository=rafaelbotelhoawtce/hdc,image.tag=latest helm/devops
