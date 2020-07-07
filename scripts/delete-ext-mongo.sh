#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deleting Ext mongo
  
  cd ${root_folder}/services/api/ext-mongodb
  kubectl delete -f istio.yaml --ignore-not-found
  
  _out Done deleting mongo
}

setup
