#!/usr/bin/env bash
set -e

REPO_DIR="${HOME}/.terminal-prompt"
RAW_BASE="https://raw.githubusercontent.com/martin-luik/terminal-prompt/main"

mkdir -p "$REPO_DIR"

echo "⬇️  Downloading prompt.zsh..."
curl -fsSL "$RAW_BASE/prompt.zsh" -o "$REPO_DIR/prompt.zsh"

SRC_LINE='source ~/.terminal-prompt/prompt.zsh'

if ! grep -Fxq "$SRC_LINE" "$HOME/.zshrc"; then
  echo "" >> "$HOME/.zshrc"
  echo "# custom terminal prompt" >> "$HOME/.zshrc"
  echo "$SRC_LINE" >> "$HOME/.zshrc"
  echo "✅ Added source line to ~/.zshrc"
else
  echo "ℹ️ ~/.zshrc already includes source line, skipping"
fi

echo "✅ Installation complete!"
echo "Run: source ~/.zshrc  to activate it."