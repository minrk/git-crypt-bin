# git-crypt binaries

[![Build Status](https://travis-ci.org/minrk/git-crypt-bin.svg?branch=master)](https://travis-ci.org/minrk/git-crypt-bin)

Specifically, binaries of git-crypt for use on Travis to avoid the need to recompile git-crypt from source.

sha256 checksum:

128817a63de17a5af03fe69241e453436c6c286c86dd37fb70ed9b3bf7171d7d  git-crypt

To use:

    curl -L https://github.com/minrk/git-crypt-bin/releases/download/0.6.0/git-crypt > git-crypt
    echo "128817a63de17a5af03fe69241e453436c6c286c86dd37fb70ed9b3bf7171d7d  git-crypt" | shasum -a 256 -c -
    chmod +x git-crypt
    cp git-crypt /usr/local/bin/

See the [travis logs](https://travis-ci.org/minrk/git-crypt-bin/builds) for verification of the builds.
