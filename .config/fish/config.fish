# =================
# FISH CONFIG
# =================

# Supprimer le message de bienvenue
set -U fish_greeting ""
function fish_greeting
end

# Variables d'environnement
set -x EDITOR nvim
set -x VISUAL nvim
set -x QT_QPA_PLATFORMTHEME kvantum

# Alias utiles
alias ls='eza --icons'
alias ll='eza -la --icons'
alias cls='clear'
alias ..='cd ..'
alias ...='cd ../..'

# Hyprland
alias hypr-reload='hyprctl reload'
alias hypr-logs='cat ~/.cache/hyprland/hyprland.log'

# Pacman/Yay
alias update='yay -Syu'
alias install='yay -S'
alias remove='yay -R'
alias search='yay -Ss'
export QT_QPA_PLATFORMTHEME=qt5ct

# Configuration JFlex pour Fish Shell
# 'set -gx' signifie set (définir), g (global), x (exportable)
set -gx JFLEX_HOME "$HOME/Documents/hepia/second_year/Embarquer/Technique_de_compilation/jflex-1.9.1/"
set -gx PATH "$PATH" "$JFLEX_HOME/bin"

#racourcie
bind \e exit

# GTK theme from Pywal
set -x GTK_THEME wal

# Created by `pipx` on 2025-11-10 13:56:41
set PATH $PATH $HOME/.local/bin
