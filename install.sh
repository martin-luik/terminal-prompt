#!/usr/bin/env bash
set -e

REPO_DIR="${HOME}/.terminal-prompt"
SRC_LINE='source ~/.terminal-prompt/prompt.zsh'

if [ ! -d "$REPO_DIR" ]; then
  mkdir -p "$REPO_DIR"
fi

cp prompt.zsh "$REPO_DIR/prompt.zsh"

if ! grep -Fxq "$SRC_LINE" "$HOME/.zshrc"; then
  echo "" >> "$HOME/.zshrc"
  echo "# custom terminal prompt" >> "$HOME/.zshrc"
  echo "$SRC_LINE" >> "$HOME/.zshrc"
  echo "Added to ~/.zshrc"
else
  echo "~/.zshrc already contains source line, skipping"
fi

echo "Done. Open a new terminal or run: source ~/.zshrc"