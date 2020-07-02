#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deploying Istio Ingress definitions for web-api
  
  cd ${root_folder}/istio
  kubectl apply -f istio-ingress-gateway.yaml
  kubectl apply -f istio-ingress-service-web-api.yaml
  
  _out Done deploying Istio Ingress definitions
}

setup