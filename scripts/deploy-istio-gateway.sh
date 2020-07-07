#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out 👉 Deploying Istio Gateway
  
  cd ${root_folder}/istio/gateway
  kubectl apply -f istio-destination-rule.yaml
  kubectl apply -f istio-egress-gateway.yaml
  kubectl apply -f istio-ingress-gateway.yaml
  
  _out ✅ Done deploying Gateway
}

setup