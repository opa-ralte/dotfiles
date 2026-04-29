#!/usr/bin/env sh
set -eu

#wallpaper logic
WALLPAPER_DIR="$HOME/.dotfiles/walls"
WALLPAPER="$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.webp' \) | shuf -n 1)"

# Kill existing swaybg and start a new one
pkill -x swaybg || true
nohup swaybg -i "$WALLPAPER" -m fill >/dev/null 2>&1 &
