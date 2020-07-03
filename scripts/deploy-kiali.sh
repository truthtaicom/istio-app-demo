#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deploying Kiali

  cd ${root_folder}/tools
  kubectl apply -f kiali.yaml
  
  _out Done Deploying Kiali
}

setup