#!/usr/bin/env bash
export GIT_CRYPT_VERSION=${GIT_CRYPT_VERSION:-0.5.0}
GIT_CRYPT_DIR=${PWD}/git-crypt-${GIT_CRYPT_VERSION}
GIT_CRYPT=${GIT_CRYPT_DIR}/git-crypt

TRAVIS_KEY="$(dirname $0)/github_deploy_key"

if [[ ! -f "${TRAVIS_KEY}" ]]; then
    echo "No ssh key, not publishing"
    GIT_URL=https://github.com/${TRAVIS_REPO_SLUG}
else
    export GIT_SSH_COMMAND="ssh -i '${TRAVIS_KEY}'"
    GIT_URL=git@github.com:${TRAVIS_REPO_SLUG}
fi

set -e

if [[ ! -d builds ]]; then
    git clone ${GIT_URL} builds -b builds
fi
cd builds
git pull

DEST=git-crypt-${GIT_CRYPT_VERSION}
if [[ -f "${DEST}" ]]; then
    echo "${DEST} already exists"
    exit 0
fi

cp "${GIT_CRYPT}" "${DEST}"
git add "${DEST}"
git commit -am "[travis] build git-crypt-${GIT_CRYPT_VERSION}"
if [[ -f "${TRAVIS_KEY}" ]]; then
    echo "pushing"
    git push
fi
