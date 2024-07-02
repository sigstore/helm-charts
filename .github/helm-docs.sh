#!/usr/bin/env bash

set -euo pipefail

SCRIPTPATH=$(dirname "$0")
HELM_DOCS_VERSION="1.11.0"

function install_helm_docs {
  case "$(uname -s)" in
    Linux*)
      machine=Linux
      shasum=sha256sum
      ;;
    Darwin*)
      machine=Darwin
      shasum=shasum
      ;;
    esac

    curl -LO https://github.com/norwoodj/helm-docs/releases/download/v"${HELM_DOCS_VERSION}"/helm-docs_"${HELM_DOCS_VERSION}"_${machine}_x86_64.tar.gz
    curl -L --output /tmp/checksums_helm-docs.txt https://github.com/norwoodj/helm-docs/releases/download/v${HELM_DOCS_VERSION}/checksums.txt
    grep helm-docs_${HELM_DOCS_VERSION}_${machine}_x86_64.tar.gz /tmp/checksums_helm-docs.txt | $shasum -c -
    mkdir -p "$SCRIPTPATH/bin"
    tar -xf helm-docs_"${HELM_DOCS_VERSION}"_${machine}_x86_64.tar.gz helm-docs
    mv helm-docs "$SCRIPTPATH/bin/"
    rm helm-docs_"${HELM_DOCS_VERSION}"_${machine}_x86_64.tar.gz
}

if [ ! -f "$SCRIPTPATH/bin/helm-docs" ] ; then
  install_helm_docs
elif [[ ! "$("$SCRIPTPATH/bin/helm-docs" --version)" =~ .*"$HELM_DOCS_VERSION".* ]] ; then
  install_helm_docs
else
  echo "Using '$("$SCRIPTPATH/bin/helm-docs" --version)'"
fi

# validate docs
"$SCRIPTPATH/bin/helm-docs" -g $1
git diff --exit-code
