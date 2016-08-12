#!/usr/bin/env bash

set -x
git checkout master
git pull origin master
git checkout gh-pages
git merge master
make
git add --force dist
git commit
git push origin gh-pages
git checkout master
