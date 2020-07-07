#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  _out Deleting Ext Fixer.io
  
  cd ${root_folder}/services/api/ext-fixer
  kubectl delete -f istio.yaml --ignore-not-found
  
  _out Done Ext Fixer.io
}

setup
