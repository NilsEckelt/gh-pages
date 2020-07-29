#!/bin/sh

export JEKYLL_VERSION=4.1.0
docker run --rm \
  --volume="$PWD:/srv/jekyll" \
  -it jekyll/builder:$JEKYLL_VERSION \
  jekyll build $*
