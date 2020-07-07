#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out 👉 Deleting Istio Gateway
  
  cd ${root_folder}/istio/gateway
  kubectl delete -f istio-destination-rule.yaml --ignore-not-found
  kubectl delete -f istio-egress-gateway.yaml --ignore-not-found
  kubectl delete -f istio-ingress-gateway.yaml --ignore-not-found
  
  _out ✅ Done Deleting Istio Gateway
}

setup