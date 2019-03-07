#!/bin/bash
# Go build

SCRIPT_DIR=$(dirname "$(realpath "$0")")
GOPATH=$SCRIPT_DIR/build
GOBIN=$GOPATH/bin

echo "GOPATH: $GOPATH"
echo "GOBIN: $GOBIN"

GOPATH=$GOPATH GOBIN=$GOBIN go get -v || exit 1
echo "### Build Complete. Launching ..."
./build/bin/cow -debug -color \
    | grep --line-buffered -v -E 'cli|close connection|connPool' \
    | grep --color=always -E '[Tt]imeout|blocked|via|$'
