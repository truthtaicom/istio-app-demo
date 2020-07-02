#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}


function setup() {
  
  _out Installing Kiali
  istioctl install --set values.kiali.enabled=true
}

_out Pre-Installing some application
setup