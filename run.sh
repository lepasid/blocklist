#!/bin/bash

GITHUB_TOKEN=INPUT_TOKEN_HERE # Taroh tokenmu disini
TARGET_DIR=~/Documents/lepasid_host
REPO_URL=https://github.com/lepasid/blocklist
FILE_NAME="$(date +"%Y%m%d")"
SOURCE_URL=https://trustpositif.kominfo.go.id/assets/db/domains_isp

curl --insecure -o "$TARGET_DIR/$FILE_NAME" "$SOURCE_URL"
cd "$TARGET_DIR" || exit
git add "$FILE_NAME"
git commit -m "Update blocklist file to $FILE_NAME"
echo "https://$GITHUB_TOKEN:x-oauth-basic@github.com" > ~/.git-credentials
git push "$REPO_URL" main
rm -f ~/.git-credentials
git pull "$REPO_URL" main