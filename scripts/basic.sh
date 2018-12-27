#!/bin/sh
set -e

RESET="\033[0m"
RED="\033[31m✗"
GREEN="\033[32m✓"

DIR=${1:-./}

# Pre-testing cleanup
rm -Rf $DIR.terraform/modules/

if which terraform; then
    printf "$GREEN Terraform installed $RESET\n"
else
    printf "$RED Couldn't find terraform. Is it in your PATH? $RESET\n"
    exit 1
fi

if terraform init $DIR; then
    printf "$GREEN Dependant modules installed $RESET\n"
    printf "$GREEN Dependant plugins (for providers) installed $RESET\n"
else
    printf "$RED Unable to fetch dependant modules/plugins.$RESET\n"
    exit 2
fi

if terraform validate $DIR; then
    printf "$GREEN Module validates $RESET\n"
else
    printf "$RED Unable to validate module (includes dependant modules).$RESET\n"
    exit 3
fi

# If we got here, all the tests passed
exit 0
