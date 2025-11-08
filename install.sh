#!/usr/bin/env bash
set -e

REPO_DIR="$HOME/.terminal-prompt"
RAW_BASE="https://raw.githubusercontent.com/martin-luik/terminal-prompt/main"

mkdir -p "$REPO_DIR"
curl -fsSL "$RAW_BASE/prompt.zsh" -o "$REPO_DIR/prompt.zsh"

BLOCK_START="# >>> terminal-prompt start >>>"
BLOCK_END="# <<< terminal-prompt end <<<"
ZSHRC="$HOME/.zshrc"

if ! grep -Fq "$BLOCK_START" "$ZSHRC"; then
  {
    echo ""
    echo "$BLOCK_START"
    echo "[ -f ~/.terminal-prompt/prompt.zsh ] && source ~/.terminal-prompt/prompt.zsh"
    echo "$BLOCK_END"
  } >> "$ZSHRC"
fi

echo "Installed. Run: source ~/.zshrc"