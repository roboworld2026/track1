#!/usr/bin/env bash
# download_data.sh — Download the LCVN dataset into data/lcvn/.
# Usage: bash download_data.sh
#        SPLITS="val_seen val_unseen" bash download_data.sh   # fetch a subset

set -e

SPLITS="${SPLITS:-train val_seen val_unseen}"

mkdir -p data/lcvn
cd data/lcvn

for split in $SPLITS; do
    echo "[DOWNLOAD] ${split}.tar"
    wget -c "https://huggingface.co/datasets/fly1113/LCVN/resolve/main/${split}.tar"

    echo "[EXTRACT] ${split}.tar"
    tar -xf "${split}.tar"

    echo "[CLEAN] removing ${split}.tar"
    rm -f "${split}.tar"
done

echo "[DONE] LCVN dataset is ready under $(pwd)/"
