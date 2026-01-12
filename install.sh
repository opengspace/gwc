#!/usr/bin/env bash
set -e

INSTALL_DIR="$HOME/.local/bin"

echo "📦 Installing gwc to $INSTALL_DIR"

mkdir -p "$INSTALL_DIR"
cp bin/gwc "$INSTALL_DIR/gwc"
chmod +x "$INSTALL_DIR/gwc"

# 自动加入 PATH（zsh / bash 通吃）
SHELL_RC="$HOME/.zshrc"
[ -n "$BASH_VERSION" ] && SHELL_RC="$HOME/.bashrc"

if ! grep -q "$INSTALL_DIR" "$SHELL_RC"; then
  echo "export PATH=\"$INSTALL_DIR:\$PATH\"" >> "$SHELL_RC"
  echo "✅ PATH 已写入 $SHELL_RC"
fi

echo "🎉 安装完成，请执行：source $SHELL_RC"

