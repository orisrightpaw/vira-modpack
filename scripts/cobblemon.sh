#!/bin/bash
set -e

echo "Downloading Cobblemon 1.8 Snapshot from Maven"

FILENAME="cobblemon-1.8-$(date +%s).jar"
curl -L --output "../pack-assets/$FILENAME" "https://cdev.valerie.lol/api/download/neoforge?repo=cobblemon"

echo "Committing new Cobblemon snapshot"

git add "../pack-assets/$FILENAME"
git commit -m "Upload new Cobblemon snapshot"
git push origin main

echo "Waiting for GitHub Pages to publish"

sleep 30

echo "Staging Cobblemon update in testing"

cd ../testing
packwiz url add cobblemon "https://orisrightpaw.github.io/vira-modpack/pack-assets/$FILENAME"

echo "Done! Ready for commit."