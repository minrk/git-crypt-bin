#!/usr/bin/env bash
set -e
export GIT_CRYPT_VERSION=${GIT_CRYPT_VERSION:-0.5.0}
GIT_CRYPT_DIR=${PWD}/git-crypt-${GIT_CRYPT_VERSION}
GIT_CRYPT=${GIT_CRYPT_DIR}/git-crypt

# handle realpath missing on travis
if [[ ! -z "$(which realpath 2>/dev/null)" ]]; then
    realpath=realpath
else
    realpath="readlink -f"
fi

TRAVIS_KEY="$($realpath $(dirname $0))/github_deploy_key"

if [[ ! -f "${TRAVIS_KEY}" ]]; then
    echo "No ssh key at ${TRAVIS_KEY}, not publishing"
    GIT_URL=https://github.com/${TRAVIS_REPO_SLUG}
else
    export GIT_SSH_COMMAND="ssh -i '${TRAVIS_KEY}'"
    GIT_URL=git@github.com:${TRAVIS_REPO_SLUG}
fi

if [[ ! -d builds ]]; then
    git clone -q ${GIT_URL} builds -b builds
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
checksum="$(shasum -a 256 "${DEST}")"
echo "sha256 $checksum"

git commit -am "[travis] build git-crypt-${GIT_CRYPT_VERSION}

sha256:
$checksum
"
git log -1

if [[ -f "${TRAVIS_KEY}" ]]; then
    echo "pushing"
    git push
fi
