# git-crypt binaries

[![Build Status](https://travis-ci.org/minrk/git-crypt-bin.svg?branch=master)](https://travis-ci.org/minrk/git-crypt-bin)

Specifically, binaries of git-crypt for use on Travis to avoid the need to recompile git-crypt from source.

sha256 checksum:

46c288cc849c23a28239de3386c6050e5c7d7acd50b1d0248d86e6efff09c61b  git-crypt

To use:

    curl -L https://github.com/minrk/git-crypt-bin/releases/download/0.5.0/git-crypt > git-crypt
    shasum -a 256 46c288cc849c23a28239de3386c6050e5c7d7acd50b1d0248d86e6efff09c61b git-crypt
    chmod +x git-crypt
    cp git-crypt /usr/local/bin/

See the [travis logs](https://travis-ci.org/minrk/git-crypt-bin/builds) for verification of the builds.
