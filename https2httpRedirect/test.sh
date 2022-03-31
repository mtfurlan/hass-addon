#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

#docker build \
#	--build-arg BUILD_FROM="homeassistant/amd64-base:latest" \
#	-t local/my-test-addon \
#	.

docker run \
  --rm \
  -it \
  --name builder \
  --privileged \
  -v "$(pwd)":/data \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  homeassistant/amd64-builder \
  -t /data \
  --all \
  --test \
  -i my-test-addon-{arch} \
  -d local || true

docker run \
  --rm \
  -p 8083:443 \
  local/my-test-addon-amd64
