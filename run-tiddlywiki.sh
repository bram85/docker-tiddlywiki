#!/bin/sh

set -e

cd "$TW_BASE"

########
# Init #
########

if [ ! -f "$TW_PATH/tiddlywiki.info" ]; then
  tiddlywiki "$TW_NAME" --init server
fi

################
# Lazy loading #
################

# http://tiddlywiki.com/#LazyLoading
# embed all tiddlers in the HTML
DOCUMENT='$:/core/save/all'
TW_LAZY=$(echo $TW_LAZY | tr [A-Z] [a-z])

# lazy loading for images
[ "$TW_LAZY" = 'image' -o "$TW_LAZY" = 'images' ] && DOCUMENT='$:/core/save/lazy-images'

[ "$TW_LAZY" = 'all' -o "$TW_LAZY" = 'yes' -o "$TW_LAZY" = "1" -o "$TW_LAZY" = "true" ] && DOCUMENT='$:/core/save/lazy-all'

#######
# Run #
#######

exec tiddlywiki "$TW_NAME" --server 8080 "$DOCUMENT" text/plain text/html "$TW_USER" "$TW_PASSWORD" 0.0.0.0

