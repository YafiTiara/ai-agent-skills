#!/usr/bin/env bash
set -euo pipefail

TARGET="claude"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target|-t)
      TARGET="${2:-}"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: ./install.sh [--target claude|antigravity|cursor|agents|all]"
      exit 1
      ;;
  esac
done

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_DIR="$SCRIPT_DIR/skills"

install_to() {
  local dest="$1"
  mkdir -p "$dest"
  cp -R "$SOURCE_DIR"/* "$dest"/
  echo "Installed skills to $dest"
}

case "$TARGET" in
  claude)      install_to "$HOME/.claude/skills" ;;
  antigravity) install_to "$HOME/.gemini/config/skills" ;;
  cursor)      install_to "$HOME/.cursor/skills" ;;
  agents)      install_to "$HOME/.agents/skills" ;;
  all)
    install_to "$HOME/.claude/skills"
    install_to "$HOME/.gemini/config/skills"
    install_to "$HOME/.cursor/skills"
    install_to "$HOME/.agents/skills"
    ;;
  *)
    echo "Invalid target: $TARGET"
    echo "Valid targets: claude, antigravity, cursor, agents, all"
    exit 1
    ;;
esac
