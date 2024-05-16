#/bin/bash


# Monitors the server directory for changes and snapshots the paths specified in kosli-paths.yaml


docker run \
    --env KOSLI_API_TOKEN=$KOSLI_API_TOKEN \
    --volume $(pwd)/kosli-paths.yaml:/kosli-paths.yaml \
    --volume $(pwd)/server:/server \
    ghcr.io/kosli-dev/cli:5129074 \
    \
    snapshot paths \
    --watch \
    --org=meekrosoft-demo \
    --paths-file="/kosli-paths.yaml" \
    java-server

