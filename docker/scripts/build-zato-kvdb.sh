#!/usr/bin/env bash

ZATO_BIN="/opt/zato/current/bin/zato"
ZATO_CA_PATH="/opt/zato/env"
ZATO_ENV_PATH="/opt/zato/env"

set -e
set -x

function insert_line() {
    ins_file="$1"; shift
    ins_line="$1"; shift
    sed -i "${ins_line}i$(echo $@)" "${ins_file}"
}

source /tmp/build_secrets

if [[ "$1" == "build-zato-kvdb" ]]; then
    set -x
    cp /etc/hosts /etc/hosts2
    echo "127.0.0.1 ${ZATO_KVDB_HOST} $(hostname -s) # zatobase_buildonly" >> /etc/hosts
    exit 0
fi

if [[ "$1" == "run-base-warning" ]]; then
    echo "You really shouldn't be running this image directly" > /dev/stderr
    exit 1
fi

if [[ "$1" == "clean" ]]; then

    exit 0
fi
