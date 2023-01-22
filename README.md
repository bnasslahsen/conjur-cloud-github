# Demo project for Github

## Pre-requisites
- OS Linux / MacOS
- conjur-cloud-cli

## Github Setup

- Create BNL ROOT Branch - AS Security Admin
```shell
conjur policy update -b data -f root-branch.yml
```

- Create GITHUB Branch - AS Security Admin
```shell
conjur policy update -b data/bnl -f github-branch.yml
```

- Delegation on the branch for the team - AS Security Admin
```shell
conjur policy update -b data/vault -f github-user-grants.yml
```

- Declare Github authenticator - AS Security Admin
```shell
./load-authenticator.sh
```

- Declare Your Apps - AS Projects Team
```shell
./load-hosts.sh
```
