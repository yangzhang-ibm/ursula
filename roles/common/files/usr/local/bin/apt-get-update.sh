#!/usr/bin/env bash

# A simple wrapper around "apt-get update" that returns a suitable exit
# code on failure. Useful for cron jobs.

if ! { apt-get update 2>&1 || echo "E: update failed"; } | grep -q '^[WE]:'; then
    exit 0
else
    exit 1
fi
