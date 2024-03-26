#!/bin/bash

set -a
source ".env"
set +a

# Create Github Branch
conjur policy update -b data -f <(envsubst < github-branch.yml)

#Load Github root policy
conjur policy update -b conjur/authn-jwt -f <(envsubst < authn-jwt-github.yml)

#Enable the JWT Authenticator in Conjur Cloud
conjur authenticator enable --id authn-jwt/$CONJUR_AUTHENTICATOR_ID

#We populate the jwks-uri variable with the JWT provider URL:
conjur variable set -i conjur/authn-jwt/$CONJUR_AUTHENTICATOR_ID/token-app-property -v "$GITHUB_TOKEN_APP"
conjur variable set -i conjur/authn-jwt/$CONJUR_AUTHENTICATOR_ID/identity-path -v "$GITHUB_IDENTITY"
conjur variable set -i conjur/authn-jwt/$CONJUR_AUTHENTICATOR_ID/issuer -v "$GITHUB_ISSUER"
conjur variable set -i conjur/authn-jwt/$CONJUR_AUTHENTICATOR_ID/jwks-uri -v "$GITHUB_JWKS_URI"
conjur variable set -i conjur/authn-jwt/$CONJUR_AUTHENTICATOR_ID/enforced-claims -v "$GITHUB_CLAIMS"
