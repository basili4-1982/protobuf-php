#!/bin/bash

set -ex

VERSION=$(git describe --abbrev=0)


git clone https://github.com/protocolbuffers/protobuf.git

# Clean old files
rm -rf ./src/*

# Copy files
cp -r ./protobuf/php/src/* ./src
cp ./protobuf/php/composer.json.dist ./src/composer.json

rm -rf protobuf
git add .
git commit -m "$VERSION"
if [ $(git tag -l "$VERSION") ]; then
  echo "tag $VERSION already exists"
else
  git tag "$VERSION"
fi
