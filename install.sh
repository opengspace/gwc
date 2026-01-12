#!/usr/bin/env bash
set -e

INSTALL_DIR="$HOME/.local/bin"
REPO_RAW="https://raw.githubusercontent.com/opengspace/gwc/main"

echo "📦 Installing gwc to $INSTALL_DIR"

mkdir -p "$INSTALL_DIR"
curl -fsSL "$REPO_RAW/bin/gwc" -o "$INSTALL_DIR/gwc"
chmod +x "$INSTALL_DIR/gwc"

if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
  SHELL_RC="$HOME/.zshrc"
  [ -n "$BASH_VERSION" ] && SHELL_RC="$HOME/.bashrc"
  echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$SHELL_RC"
  echo "✅ PATH 已写入 $SHELL_RC"
fi

echo "🎉 安装完成，请执行：source ~/.zshrc"

