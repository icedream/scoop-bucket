#!/bin/bash -e

for package_script in packages/*/package.sh
do
  package="$(basename "$(dirname "$package_script")")"
  echo "Generating package: $package"
  bin/generate_bucket_package.sh "$package"
done
