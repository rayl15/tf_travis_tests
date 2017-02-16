#!/bin/sh
set -e

reset="\033[0m"
white="\033[37m"

terraform_travis_tests() {
  BRANCH=${1:-master}
  printf "${white}Running Terraform Travis Tests from ${BRANCH}!$reset\n"
  curl -o- -L https://raw.githubusercontent.com/freeletics-engineering/terraform_travis_tests/$BRANCH/scripts/basic.sh | sh -s
  curl -o- -L https://raw.githubusercontent.com/freeletics-engineering/terraform_travis_tests/$BRANCH/scripts/fmt.sh | sh -s
}

cd ~
terraform_travis_tests $1