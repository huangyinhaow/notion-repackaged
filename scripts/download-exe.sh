#!/usr/bin/env bash
set -e

source `dirname $0`/_utils.sh
workdir ${WORKSPACE_BUILD_DIR}

check-cmd curl md5sum
check-env NOTION_VERSION NOTION_DOWNLOAD_HASH

export NOTION_DOWNLOAD_URL="https://desktop-release.notion-static.com/Notion%20Setup%20${NOTION_VERSION}.exe"
export NOTION_DOWNLOADED_NAME="Notion-${NOTION_VERSION}.exe"

if [ -f "${NOTION_DOWNLOADED_NAME}" ]; then
  log "Removing already downloaded file..."
  rm "${NOTION_DOWNLOADED_NAME}"
fi

log "Downloading Notion Windows package..."
curl "${NOTION_DOWNLOAD_URL}" --output "${NOTION_DOWNLOADED_NAME}

popd > /dev/null
