#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deleting Kiali

  cd ${root_folder}/tools
  kubectl delete -f kiali.yaml --ignore-not-found
  
  _out Done Deleting Kiali
}

setup