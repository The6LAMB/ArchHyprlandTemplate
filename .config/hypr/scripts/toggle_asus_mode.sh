#!/bin/bash
# ================================================
# Script ASUS Profile Toggle - Version Stylée
# Optimisé pour mako avec couleurs Pywal
# + Auto-switch refresh rate Hyprland
# ================================================

ASUSCTL="/usr/bin/asusctl"
NOTIFY_SEND="/usr/bin/notify-send"
HYPRCTL="/usr/bin/hyprctl"

# Charger les couleurs Pywal si disponibles
if [ -f "$HOME/.cache/wal/colors.sh" ]; then
    source "$HOME/.cache/wal/colors.sh"
fi

# 1. Cycle du profil ASUS
"$ASUSCTL" profile -n &> /dev/null

# 2. Attendre
sleep 0.2

# 3. Obtenir le profil actuel
CURRENT_PROFILE=$("$ASUSCTL" profile -p 2>&1 | \
    grep "Active profile is" | \
    sed 's/Active profile is //' | \
    xargs)

# 4. Configuration selon le profil + Refresh Rate
case "$CURRENT_PROFILE" in
    "Performance")
        ICON="🚀"
        TITLE="Performance Mode"
        MESSAGE="Maximum power activated • 240Hz"
        REFRESH_RATE="240"
        ;;
    "Balanced")
        ICON="⚡"
        TITLE="Balanced Mode"
        MESSAGE="Optimal performance & battery • 240Hz"
        REFRESH_RATE="240"
        ;;
    "Quiet")
        ICON="🌙"
        TITLE="Quiet Mode"
        MESSAGE="Silent operation mode • 60Hz"
        REFRESH_RATE="60"
        ;;
    *)
        ICON="🎮"
        TITLE="ASUS Profile"
        MESSAGE="$CURRENT_PROFILE"
        REFRESH_RATE="240"  # Par défaut
        ;;
esac

# 5. Changer le refresh rate Hyprland si disponible
if command -v "$HYPRCTL" &> /dev/null; then
    "$HYPRCTL" keyword monitor eDP-1,2560x1600@${REFRESH_RATE},auto,1 &> /dev/null
    
    # Vérifier si le changement a réussi
    if [ $? -eq 0 ]; then
        echo "✓ Refresh rate changé à ${REFRESH_RATE}Hz"
    fi
fi

# 6. Envoyer la notification
if [ -n "$CURRENT_PROFILE" ]; then
    "$NOTIFY_SEND" \
        --app-name="ASUS ROG Control" \
        --urgency=normal \
        --expire-time=2500 \
        --icon="preferences-system-power" \
        "$ICON $TITLE" \
        "$MESSAGE"
fi

# Optionnel : Feedback sonore (décommentez si vous voulez)
# paplay /usr/share/sounds/freedesktop/stereo/message.oga &
