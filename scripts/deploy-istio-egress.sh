#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deploying Istio Egress definitions for web-api
  
  cd ${root_folder}/istio
  kubectl apply -f istio-egress-gateway.yaml 
  
  _out Done deploying Istio Egress definitions
}

setup