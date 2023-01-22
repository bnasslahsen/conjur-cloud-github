#!/bin/bash

set -a
source ".env"
set +a

envsubst < github-hosts.yml > github-hosts.yml.tmp
conjur policy update -f github-hosts.yml.tmp -b data/bnl/github-team | tee -a github-hosts.log
rm github-hosts.yml.tmp

conjur policy update -b data/vault/bnl-github-safe -f github-hosts-grants.yml