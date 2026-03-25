#!/bin/bash
# ══════════════════════════════════════════════════════════════════
#  ArchHyprlandTemplate — Script d'installation
#  Repo: https://github.com/The6LAMB/ArchHyprlandTemplate
# ══════════════════════════════════════════════════════════════════

set -e

# Couleurs
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

DOTS="$(cd "$(dirname "$0")" && pwd)"

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║       🐑 ArchHyprlandTemplate — Installer              ║"
echo "║       By The6LAMB                                       ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"

# ══════════════════════════════════════════════════════════════════
#  1. VÉRIFICATIONS
# ══════════════════════════════════════════════════════════════════

if [ ! -f /etc/arch-release ]; then
    echo -e "${RED}[✘] Ce script est fait pour Arch Linux uniquement.${NC}"
    exit 1
fi

echo -e "${GREEN}[✔] Arch Linux détecté${NC}"

# ══════════════════════════════════════════════════════════════════
#  2. INSTALLATION DES PAQUETS
# ══════════════════════════════════════════════════════════════════

echo ""
echo -e "${CYAN}[1/5] Installation des paquets officiels...${NC}"

# Paquets essentiels Hyprland
PACMAN_PKGS=(
    # Hyprland & composants
    hyprland
    hyprlock
    hyprpicker
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-gtk

    # Barre & Notifications
    waybar
    mako

    # Wallpaper & Thèmes
    swww
    python-pywal
    nwg-look

    # Lanceur
    rofi-wayland

    # Terminal & Shell
    kitty
    fish
    ranger

    # Gestionnaire de fichiers
    thunar

    # Navigateurs
    firefox

    # Outils système
    brightnessctl
    playerctl
    pavucontrol
    blueman
    networkmanager
    nm-connection-editor
    polkit-kde-agent
    grim
    slurp
    swappy
    syncthing

    # Audio
    pipewire
    pipewire-pulse
    wireplumber

    # Fonts
    ttf-font-awesome
    otf-font-awesome

    # Display Manager
    sddm
    qt5-graphicaleffects
    qt5-quickcontrols2

    # Outils
    git
    base-devel
    neofetch
    mpv
    swaync
)

echo -e "${YELLOW}Installation de ${#PACMAN_PKGS[@]} paquets pacman...${NC}"
sudo pacman -S --needed --noconfirm "${PACMAN_PKGS[@]}"

# ══════════════════════════════════════════════════════════════════
#  3. INSTALLATION YAY + PAQUETS AUR
# ══════════════════════════════════════════════════════════════════

echo ""
echo -e "${CYAN}[2/5] Installation de yay et paquets AUR...${NC}"

if ! command -v yay &> /dev/null; then
    echo -e "${YELLOW}Installation de yay...${NC}"
    git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
    cd /tmp/yay-bin
    makepkg -si --noconfirm
    cd "$DOTS"
    rm -rf /tmp/yay-bin
else
    echo -e "${GREEN}[✔] yay déjà installé${NC}"
fi

AUR_PKGS=(
    # Apps
    brave-bin
    discord
    obsidian
    spotify-launcher
    visual-studio-code-bin
    telegram-desktop

    # Thèmes
    whitesur-cursor-theme
    whitesur-gtk-theme

    # Fonts
    ttf-red-hat-display
    ttf-red-hat-mono

    # Spicetify (thème Spotify)
    spicetify-cli

    # Lock screen
    # blazinlock  # décommente si c'est un paquet AUR
)

echo -e "${YELLOW}Installation de ${#AUR_PKGS[@]} paquets AUR...${NC}"
yay -S --needed --noconfirm "${AUR_PKGS[@]}"

# ══════════════════════════════════════════════════════════════════
#  4. COPIE DES DOTFILES
# ══════════════════════════════════════════════════════════════════

echo ""
echo -e "${CYAN}[3/5] Déploiement des dotfiles...${NC}"

# Backup des configs existantes
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
echo -e "${YELLOW}Backup des configs actuelles dans $BACKUP_DIR${NC}"
mkdir -p "$BACKUP_DIR"

# Liste des dossiers à copier
CONFIG_DIRS=(
    hypr
    waybar
    mako
    rofi
    kitty
    fish
    ranger
    wal
    gtk-3.0
    gtk-4.0
    nwg-look
    swaync
    neofetch
    spicetify
    mpv
)

for dir in "${CONFIG_DIRS[@]}"; do
    if [ -d "$DOTS/.config/$dir" ]; then
        # Backup si existant
        if [ -d "$HOME/.config/$dir" ]; then
            cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
        fi
        # Copie
        cp -r "$DOTS/.config/$dir" "$HOME/.config/"
        echo -e "${GREEN}  [✔] $dir${NC}"
    else
        echo -e "${YELLOW}  [—] $dir (pas dans le repo, skip)${NC}"
    fi
done

# ══════════════════════════════════════════════════════════════════
#  5. SDDM
# ══════════════════════════════════════════════════════════════════

echo ""
echo -e "${CYAN}[4/5] Configuration SDDM...${NC}"

if [ -f "$DOTS/sddm/sddm.conf" ]; then
    sudo cp "$DOTS/sddm/sddm.conf" /etc/sddm.conf
    echo -e "${GREEN}  [✔] sddm.conf copié${NC}"
fi

if [ -d "$DOTS/sddm/theme" ]; then
    sudo cp -r "$DOTS/sddm/theme" /usr/share/sddm/themes/silent
    echo -e "${GREEN}  [✔] Thème SDDM 'silent' installé${NC}"
fi

# Activer SDDM
sudo systemctl enable sddm
echo -e "${GREEN}  [✔] SDDM activé${NC}"

# ══════════════════════════════════════════════════════════════════
#  6. FINITIONS
# ══════════════════════════════════════════════════════════════════

echo ""
echo -e "${CYAN}[5/5] Finitions...${NC}"

# Définir fish comme shell par défaut
if command -v fish &> /dev/null; then
    chsh -s $(which fish)
    echo -e "${GREEN}  [✔] Fish défini comme shell par défaut${NC}"
fi

# Activer les services
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
echo -e "${GREEN}  [✔] Services activés (NetworkManager, Bluetooth)${NC}"

# ══════════════════════════════════════════════════════════════════
#  RÉSUMÉ
# ══════════════════════════════════════════════════════════════════

echo ""
echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════════╗"
echo "║  ✅ Installation terminée !                             ║"
echo "║                                                          ║"
echo "║  → Backup des anciennes configs: $BACKUP_DIR            ║"
echo "║                                                          ║"
echo "║  Prochaines étapes:                                      ║"
echo "║  1. Reboot ton PC                                        ║"
echo "║  2. SDDM va se lancer automatiquement                   ║"
echo "║  3. Connecte-toi et Hyprland démarre                    ║"
echo "║                                                          ║"
echo "║  Notes:                                                  ║"
echo "║  • Lance 'wal -i /chemin/wallpaper.jpg' pour les        ║"
echo "║    couleurs pywal                                        ║"
echo "║  • Vérifie tes monitors dans hypr/monitors.conf         ║"
echo "║  • Si NVIDIA: vérifie hypr/environment.conf             ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo -e "${NC}"
