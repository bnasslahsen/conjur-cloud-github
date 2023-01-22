#!/bin/bash

set -a
source ".env"
set +a

envsubst < github-hosts.yml > github-hosts.yml.tmp
conjur policy update -f github-hosts.yml.tmp -b data/bnl/github-team | tee -a github-hosts.log
rm github-hosts.yml.tmp


envsubst < github-hosts-grants.yml > github-hosts-grants.yml.tmp
conjur policy update -f github-hosts-grants.yml.tmp -b data/vault/bnl-github-safe
rm github-hosts-grants.yml.tmp
