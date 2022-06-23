#!/usr/bin/env bash

$(echo "${COMMAND:=docker}") exec k8s-thw ansible-playbook playbooks/server/destroy.yml

$(echo "${COMMAND:=docker}") rm --force k8s-thw