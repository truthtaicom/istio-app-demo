#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}


function setup() {

  _out ⚡️Kiali: http://kiali.127.0.0.1.nip.io/kiali/
  _out ⚡️Grafana: http://grafana.127.0.0.1.nip.io/
  _out ⚡️Tracing: http://tracing.127.0.0.1.nip.io/
  _out ⚡️Prometheus: http://prometheus.127.0.0.1.nip.io/

}

_out ⭐️ API Information ⭐️
setup