#!/usr/bin/env bash
set -e

source `dirname $0`/_utils.sh
workdir ${WORKSPACE_BUILD_DIR}

check-cmd curl sha512sum
check-env NOTION_VERSION NOTION_DOWNLOAD_CHECKSUM

export NOTION_DOWNLOAD_URL="https://desktop-release.notion-static.com/Notion%20Setup%20${NOTION_VERSION}.exe"
export NOTION_DOWNLOADED_NAME="Notion-${NOTION_VERSION}.exe"

log "Downloading Notion Windows package..."
curl "${NOTION_DOWNLOAD_URL}" --output "${NOTION_DOWNLOADED_NAME}"

popd > /dev/null
