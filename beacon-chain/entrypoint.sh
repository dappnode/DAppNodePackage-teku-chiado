#!/bin/bash

# Concatenate EXTRA_OPTS string
[[ -n $CHECKPOINT_SYNC_URL ]] && EXTRA_OPTS="--initial-state=${CHECKPOINT_SYNC_URL}/eth/v2/debug/beacon/states/finalized ${EXTRA_OPTS}"

exec /opt/teku/bin/teku \
    --network=/usr/config.yaml \
    --initial-state=/usr/genesis.ssz \
    --data-base-path=/opt/teku/data \
    --ee-endpoint=$HTTP_ENGINE \
    --ee-jwt-secret-file="/jwtsecret" \
    --p2p-port=$P2P_PORT \
    --rest-api-cors-origins="*" \
    --rest-api-interface=0.0.0.0 \
    --rest-api-port=$BEACON_API_PORT \
    --rest-api-host-allowlist "*" \
    --rest-api-enabled=true \
    --rest-api-docs-enabled=true \
    --metrics-enabled=true \
    --metrics-interface 0.0.0.0 \
    --metrics-port 8008 \
    --metrics-host-allowlist "*" \
    --log-destination=CONSOLE \
    --p2p-discovery-bootnodes=enr:-KG4QBHSWcjL-sdK83SPvRTmL1b175sS6LoXykFZ_hjzpJAFO6IUQ55vVX7uSU2_ZP6uH03Pxey_YC-mwro_VmNheg4DhGV0aDKQSOoWfAEAAG9aAAAAAAAAAIJpZIJ2NIJpcISqu5rviXNlY3AyNTZrMaED_dNGAGGvZHb85Uiho1aPhd11cwE4zmKdwbIy40qKYTuDdGNwgiMog3VkcIIjKA \
    $EXTRA_OPTS
