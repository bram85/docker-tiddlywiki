#!/bin/sh

set -e

cd "$TW_BASE"

if [ ! -f "$TW_PATH/tiddlywiki.info" ]; then
  tiddlywiki "$TW_NAME" --init server
fi

exec tiddlywiki "$TW_NAME" --server 8080 '$:/core/save/all' text/plain text/html "$TW_USER" "$TW_PASSWORD" 0.0.0.0
