#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deploying ext mongo-db
  
  cd ${root_folder}/services/api/ext-mongodb
  kubectl apply -f istio.yaml
  
  _out Done Deploying ext mongo-db
}

setup