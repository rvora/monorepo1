#!/bin/bash -E
# -E: trap on ERR is inherited by shell functions, command substitutions, and
#                      commands executed in a subshell environment.

MYPROJECT=$(dirname $0)/..
NAME=kumo-margarita
DESCRIPTION=$NAME

# get absolute path
pushd $MYPROJECT
MYPROJECT=$(pwd)
popd

. $MYPROJECT/manifest.sh

VERSION=$COMPONENT_VERSION

RELEASE=${bamboo_buildNumber:-0}

function cleanup {
  true
}

function error_exit {
  local parent_lineno="$1"
  local message="$2"
  local code="${3:-1}"

  cleanup

  if [[ -n "$message" ]] ; then
    echo "Error on or near line ${parent_lineno}: ${message}; exiting with status ${code}"
  else
    echo "Error on or near line ${parent_lineno}; exiting with status ${code}"
  fi

  exit "${code}"
}

trap 'cleanup' 0
trap 'error_exit ${LINENO}' ERR
set -E

function create_rpm {
    VERSION=$COMPONENT_VERSION

    ARCH=$(uname -m)

    pushd $MYPROJECT/target
      rm -f $NAME-*.rpm

      FPMARGS="-s dir -t rpm -n $NAME -v $VERSION"
      FPMARGS+=" --iteration $RELEASE"
      FPMARGS+=" --inputs $MYPROJECT/bin/rpm_include.txt"
      FPMARGS+=" --prefix /opt/ruckuswireless/helloworld"
      FPMARGS+=" --template-scripts"
      FPMARGS+=" --before-install $MYPROJECT/bin/bi.sh"
      FPMARGS+=" --after-install $MYPROJECT/bin/ai.sh"
      FPMARGS+=" --before-remove $MYPROJECT/bin/br.sh"
      FPMARGS+=" --after-remove $MYPROJECT/bin/ar.sh"
      echo fpm $FPMARGS --description "$DESCRIPTION"
      fpm $FPMARGS --description "$DESCRIPTION"
    popd
}

cleanup

create_rpm

exit $?
