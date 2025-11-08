#!/usr/bin/env bash
set -e

ZSHRC="$HOME/.zshrc"
BLOCK_START="# >>> terminal-prompt start >>>"
BLOCK_END="# <<< terminal-prompt end <<<"

if grep -Fq "$BLOCK_START" "$ZSHRC"; then
  sed -i '' "/$BLOCK_START/,/$BLOCK_END/d" "$ZSHRC"
  echo "Removed terminal-prompt block from ~/.zshrc"
fi

if [ -d "$HOME/.terminal-prompt" ]; then
  rm -rf "$HOME/.terminal-prompt"
  echo "Removed ~/.terminal-prompt"
fi

echo "Uninstall complete. Run: source ~/.zshrc"