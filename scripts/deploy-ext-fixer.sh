#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deploying ext Fixer.io
  
  cd ${root_folder}/services/api/ext-fixer
  kubectl apply -f istio.yaml
  
  _out Done Deploying ext Fixer.io
}

setup