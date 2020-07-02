#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deleting Istio Ingress definitions
  
  cd ${root_folder}/istio
  kubectl delete -f istio-ingress-gateway.yaml --ignore-not-found
  kubectl delete -f istio-ingress-service-web-api.yaml --ignore-not-found
  
  _out Done deleting Istio Ingress definitions
}

setup
