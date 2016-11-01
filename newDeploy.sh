#!/bin/bash
# See https://medium.com/@nthgergo/publishing-gh-pages-with-travis-ci-53a8270e87db
set -o errexit

rm -rf public
mkdir public

# config
git config --global user.email "nobody@nobody.org"
git config --global user.name "Travis CI"

# build 
mkdir test
echo hello > test/hello.txt

# deploy
cd test
git init
git add .
git commit -m "Deploy to Github Pages"
git push --force --quiet "https://${GHT}@github.com/${GITHUB_REPO}.git" master:gh-pages > /dev/null 2>&1
