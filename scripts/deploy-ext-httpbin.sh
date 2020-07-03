#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deploying ext httpbin
  
  cd ${root_folder}/services/api/ext-httpbin
  kubectl apply -f httpbin-service.yaml
  
  _out Done Deploying ext httpbin
}

setup