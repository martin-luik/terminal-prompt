# Custom Zsh Terminal Prompt for macOS

A colorful, minimal, and powerline-styled Zsh prompt designed for macOS.  
Shows your current user, working directory, active virtual environment (Python/Conda), and Git branch status — all in a beautiful, compact format.

---

## ✨ Features

- 🖥️ macOS-friendly design with Apple logo  
- 🧪 Shows active **Python virtualenv** or **Conda environment**  
- 💾 Displays **current Git branch** and indicates uncommitted changes  
- 🪶 Lightweight — pure Zsh, no plugins required  
- 🎨 Supports **Nerd Fonts** and powerline icons  

---

## ⚡ Quick Install

Copy and paste this command in your terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/martin-luik/terminal-prompt/main/install.sh | bash
```

This will:
1. Download the latest version of the prompt into `~/.terminal-prompt/`
2. Automatically update your `~/.zshrc` to source the prompt

Then, just reload your shell:

```bash
source ~/.zshrc
```

---

## 🧩 Manual Install

If you prefer a manual setup:

```bash
git clone https://github.com/you/terminal-prompt.git
cd terminal-prompt
./install.sh
```

---

## 🔤 Font Requirements

This prompt uses **Nerd Font** glyphs for icons (    ).  
Make sure you’re using a patched Nerd Font such as:

- [MesloLGS NF](https://www.nerdfonts.com/font-downloads)
- [JetBrains Mono Nerd Font](https://www.nerdfonts.com/font-downloads)

Then set it in your Terminal or iTerm2 preferences.

---

## 🧰 Customization

You can edit color values or symbols inside `prompt.zsh`:

```zsh
local blue=27
local purple=135
local pink=213
local green=84
```

---

## 🪄 Uninstall

To remove it, simply delete the folder and comment out the line in `~/.zshrc`:

```bash
rm -rf ~/.terminal-prompt
```

---
