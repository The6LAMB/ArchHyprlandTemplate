#!/bin/bash

# Chemin vers les fichiers de contrôle de la luminosité
BRIGHTNESS_FILE="/sys/class/leds/asus::kbd_backlight/brightness"
MAX_BRIGHTNESS_FILE="/sys/class/leds/asus::kbd_backlight/max_brightness"

# Lire la luminosité actuelle et maximale
CURRENT=$(cat "$BRIGHTNESS_FILE")
MAX=$(cat "$MAX_BRIGHTNESS_FILE")

# Augmenter la luminosité si elle n'est pas déjà au maximum
if [ "$CURRENT" -lt "$MAX" ]; then
    NEXT_LEVEL=$((CURRENT + 1))
    echo $NEXT_LEVEL > "$BRIGHTNESS_FILE"
fi
