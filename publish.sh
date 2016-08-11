#!/usr/bin/env bash

set -x
git checkout gh-pages
make
git add --force dist
git commit
git push origin gh-pages
git checkout master
