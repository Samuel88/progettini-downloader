#!/bin/bash

set -eu

CSV_FILE="$1"

while IFS=',' read -r nome orario tipo url repo;do
    repodir="${repo##*/}"
    userdir="${nome}/${repodir}"
    mkdir "$nome"
    git clone "$repo" "$userdir"
    cd "$userdir"
    npm install
    npm run build
done < <(tail -n +2 "$CSV_FILE")