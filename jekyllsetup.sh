#!/bin/sh

# args.length < 1
if [ $# -lt 1 ]; then
  echo "no jekyll project dir"
  exit 1
fi

arg=$1

if [ -e $arg ]; then
  echo "$arg exist"
  exit 1
fi

# --- create jekyll template ----
bundle exec jekyll new $arg



# --- connect link and add vendor to exclude  ---
cd $arg

ln -sf ../.ruby-version ./.ruby-version
ln -sf ../.bundle ./.bundle
ln -sf ../vendor ./vendor

echo "exclude:"   >> _config.yml
echo "  - vendor" >> _config.yml
