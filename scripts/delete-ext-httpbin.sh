#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deleting Ext HttpBin
  
  cd ${root_folder}/services/api/ext-httpbin
  kubectl delete -f httpbin-service.yaml --ignore-not-found
  
  _out Done deleting Ext HttpBin
}

setup
