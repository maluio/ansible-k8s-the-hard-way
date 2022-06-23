#!/usr/bin/env bash

$(echo "${COMMAND:=docker}") run \
-e HCLOUD_TOKEN="$HCLOUD_TOKEN" \
-p 127.0.0.1:8888:8888 \
--name k8s-thw \
-v "$(pwd)":/usr/src/app \
-d k8s-thw

$(echo "${COMMAND:=docker}") logs -f k8s-thw
