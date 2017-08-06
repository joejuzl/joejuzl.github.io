#!/usr/bin/env bash

set -ex

JEKYLL_ENV=production bundle exec jekyll build

git push

git checkout master

find . -maxdepth 1 -not -name CNAME -a -not -name '.git*' -a -not -name _site -a -not -name . -exec rm -r {} \;

cp -r _site/* .
rm -r _site

git add .
git commit -am "build: $(date)"

git push

git checkout source
