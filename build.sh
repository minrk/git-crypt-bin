#!/usr/bin/env bash
export GIT_CRYPT_VERSION=${GIT_CRYPT_VERSION:-0.5.0}
GIT_CRYPT_DIR=${PWD}/git-crypt-${GIT_CRYPT_VERSION}
GIT_CRYPT=${GIT_CRYPT_DIR}/git-crypt
set -ex


mkdir -p ${GIT_CRYPT_DIR}
curl -L https://github.com/AGWA/git-crypt/archive/${GIT_CRYPT_VERSION}.tar.gz \
    | tar --directory ${GIT_CRYPT_DIR} --gzip --file - --extract --strip-components=1
cd ${GIT_CRYPT_DIR}
make -j
cd -
