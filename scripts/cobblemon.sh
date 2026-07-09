#!/bin/bash
set -e

COBBLEMON_ARTIFACT_API='https://snapshots.cobblemon.dev/api/download/neoforge?repo=cobblemon'

echo "Updating download link for Cobblemon 1.8"

COBBLEMON_SNAPSHOT=$(curl -I $COBBLEMON_ARTIFACT_API | grep -i ^Location: | sed 's/location: //g' | tr -d '\r')

echo "Updating testing modpack for staging"

cd ../testing
packwiz url add cobblemon $COBBLEMON_SNAPSHOT

echo "Done!"