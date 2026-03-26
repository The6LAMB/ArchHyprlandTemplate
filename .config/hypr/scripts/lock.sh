#!/bin/bash

# Définit le répertoire de fonds d'écran exact comme dans theme.conf
WALLPAPER_DIR="$HOME/WallpapersLock"

# Sélectionne une image aléatoire (comme le fait SDDM)
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) | shuf -n 1)

# Ceci est le point de connexion entre le script et hyprlock
cp "$WALLPAPER" /usr/share/sddm/themes/Makima-SDDM/Backgrounds/background.png
cp "$WALLPAPER" $HOME/.config/hypr/hyprlock.png
