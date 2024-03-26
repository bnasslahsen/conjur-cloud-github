#!/bin/bash

set -a
source ".env"
set +a

conjur policy update -b $GITHUB_IDENTITY -f <(envsubst < github-hosts.yml)

conjur policy update -b data/vault -f <(envsubst < github-hosts-grants.yml)

