# Configuration Hyprland Modulaire

Configuration Hyprland 0.52+ organisée en fichiers séparés pour une meilleure lisibilité et maintenance.

## 📁 Structure des fichiers

```
~/.config/hypr/
├── hyprland.conf           # Fichier principal (source les autres)
└── configs/
    ├── monitors.conf       # Configuration des écrans
    ├── autostart.conf      # Applications au démarrage
    ├── environment.conf    # Variables d'environnement
    ├── input.conf          # Clavier, souris, touchpad
    ├── general.conf        # Configuration générale
    ├── decoration.conf     # Apparence et effets visuels
    ├── animations.conf     # Animations et transitions
    ├── layouts.conf        # Layouts (dwindle, master, gestures)
    ├── keybinds.conf       # Tous les raccourcis clavier
    └── windowrules.conf    # Règles pour les fenêtres
```

## 🚀 Installation

### 1. Sauvegarder votre ancienne config

```bash
cp ~/.config/hypr/hyprland.conf ~/.config/hypr/hyprland.conf.backup
```

### 2. Créer le dossier configs

```bash
mkdir -p ~/.config/hypr/configs
```

### 3. Copier les nouveaux fichiers

```bash
# Depuis le dossier où vous avez téléchargé les fichiers
cp hyprland.conf ~/.config/hypr/
cp configs/* ~/.config/hypr/configs/
```

### 4. Adapter à votre configuration

Éditez les fichiers selon vos besoins :

- **monitors.conf** : Adaptez selon vos écrans
- **input.conf** : Changez le layout clavier si nécessaire
- **keybinds.conf** : Personnalisez vos raccourcis
- **windowrules.conf** : Ajoutez vos applications

### 5. Recharger Hyprland

```bash
hyprctl reload
```

## ✨ Corrections principales

### Par rapport à l'ancienne config :

1. ✅ **Syntaxe modernisée** pour Hyprland 0.52+
2. ✅ **`new_is_master`** → **`new_status = master`**
3. ✅ **Gradient simplifié** pour éviter les erreurs de parsing
4. ✅ **Chemins absolus** au lieu de relatifs
5. ✅ **Variables d'environnement** correctes
6. ✅ **Gestures activés** par défaut
7. ✅ **Plus de raccourcis** (vim-like, redimensionnement, etc.)
8. ✅ **Window rules** plus complets
9. ✅ **Autostart** avec swww-daemon et mako

## 🎨 Pywal Integration

Cette config supporte Pywal pour les couleurs dynamiques.

### Initialiser Pywal :

```bash
# 1. Créer le dossier wallpapers
mkdir -p ~/Wallpapers

# 2. Ajouter des images
cp /chemin/vers/image.jpg ~/Wallpapers/

# 3. Générer les couleurs
wal -i ~/Wallpapers/

# 4. Recharger Hyprland
hyprctl reload
```

## 🔧 Personnalisation

### Modifier les raccourcis

Éditez `~/.config/hypr/configs/keybinds.conf`

### Changer le layout par défaut

Dans `general.conf`, changez :
```
layout = dwindle  # ou "master"
```

### Désactiver les animations

Dans `animations.conf` :
```
enabled = false
```

### Ajuster l'opacité

Dans `decoration.conf`, modifiez :
```
active_opacity = 0.9
inactive_opacity = 0.7
```

## 🐛 Dépannage

### Vérifier les erreurs

```bash
# Voir les logs
cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n1)/hyprland.log | tail -50

# Ou activer le debug
# Dans hyprland.conf, ajoutez :
debug {
    disable_logs = false
}
```

### Tester la config sans redémarrer

```bash
hyprctl reload
```

### Restaurer l'ancienne config

```bash
cp ~/.config/hypr/hyprland.conf.backup ~/.config/hypr/hyprland.conf
hyprctl reload
```

## 📝 Notes

- Les chemins utilisent `$HOME` au lieu de `~` pour plus de compatibilité
- La variable `$scripts` pointe vers `$HOME/.config/hypr/scripts`
- Les couleurs Pywal sont sourcées automatiquement depuis `~/.cache/wal/colors-hyprland.conf`

## 🎯 Raccourcis principaux

| Raccourci | Action |
|-----------|--------|
| `SUPER + RETURN` | Terminal (kitty) |
| `SUPER + D` | Launcher (rofi) |
| `SUPER + W` | Wallpaper selector |
| `SUPER + X` | Power menu |
| `SUPER + Q` | Fermer fenêtre |
| `SUPER + F` | Fullscreen |
| `SUPER + 1-9` | Changer de workspace |
| `SUPER + SHIFT + 1-9` | Déplacer fenêtre vers workspace |

Consultez `configs/keybinds.conf` pour la liste complète !

## 🌟 Fonctionnalités ajoutées

- Navigation vim-like (hjkl)
- Redimensionnement au clavier
- Workspace silencieux (déplacer sans suivre)
- Gestures tactiles activés
- Règles de fenêtres étendues
- Support multi-écrans
- Variables d'environnement pour Wayland
- Idle inhibit pour vidéos

---

**Profitez bien de votre Hyprland ! 🚀**
