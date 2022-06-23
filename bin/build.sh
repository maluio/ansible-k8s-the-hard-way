#!/usr/bin/env bash

$(echo "${COMMAND:=docker}") build -t k8s-thw .