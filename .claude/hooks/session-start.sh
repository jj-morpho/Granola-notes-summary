#!/bin/bash
set -euo pipefail

# Only run in remote (Claude Code on the web) environments
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

# Install GitHub CLI if not present
if ! command -v gh &>/dev/null; then
  apt-get update -qq && apt-get install -y -qq gh 2>/dev/null
fi

# Install Python dependencies
pip install -r "$CLAUDE_PROJECT_DIR/scripts/requirements.txt" -q
