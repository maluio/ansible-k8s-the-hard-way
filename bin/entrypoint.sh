#!/usr/bin/env bash

# Create a dir where all generated certs and configs are stored for later distribution
if [[ -z "$CERTS_DIR_LOCAL" ]]; then
  CERTS_DIR_LOCAL="/tmp/certs"
  export CERTS_DIR_LOCAL
  mkdir -p $CERTS_DIR_LOCAL
fi


if [[ -z "$HCLOUD_TOKEN" ]]; then
  echo "HCLOUD_TOKEN not set. Aborting..."
  exit 1
fi

ENCRYPTION_KEY=$(head -c 32 /dev/urandom | base64)
export ENCRYPTION_KEY
if [[ -z "$ENCRYPTION_KEY" ]]; then
  echo "Unable to generate ENCRYPTION_KEY. Aborting..."
  exit 1
fi

echo "CERTS_DIR_LOCAL set to $CERTS_DIR_LOCAL"

echo "Starting jupyter server"

jupyter-lab --allow-root --ip=0.0.0.0 --no-browser
