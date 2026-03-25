#!/bin/bash

# Chemin vers le fichier de contrôle de la luminosité
BRIGHTNESS_FILE="/sys/class/leds/asus::kbd_backlight/brightness"

# Lire la luminosité actuelle
CURRENT=$(cat "$BRIGHTNESS_FILE")

# Diminuer la luminosité si elle n'est pas déjà à zéro
if [ "$CURRENT" -gt 0 ]; then
    NEXT_LEVEL=$((CURRENT - 1))
    echo $NEXT_LEVEL > "$BRIGHTNESS_FILE"
fi
