#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deleting Istio Egress definitions
  
  cd ${root_folder}/istio
  kubectl delete -f istio-egress-gateway.yaml --ignore-not-found
  
  _out Done deleting Istio Egress definitions
}

setup
