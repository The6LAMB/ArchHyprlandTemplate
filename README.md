# ArchHyprlandTemplate 🐑

> A modular, pywal-powered Hyprland rice for Arch Linux — built for ASUS ROG laptops with NVIDIA/Intel hybrid GPU support.

![Hyprland](https://img.shields.io/badge/Hyprland-0.52+-blue?style=flat-square)
![Arch Linux](https://img.shields.io/badge/Arch-Linux-1793D1?style=flat-square&logo=arch-linux)
![License](https://img.shields.io/badge/license-MIT-green?style=flat-square)

---

## 📸 Screenshots

<!-- Add your screenshots here -->
> *Screenshots coming soon*

---

## ✨ Features

- **Modular config** — Hyprland split into clean separate files (`monitors`, `keybinds`, `decoration`, etc.)
- **Pywal integration** — all colors (Waybar, Rofi, kitty, hyprlock, cava, spicetify) generated dynamically from your wallpaper
- **Hyprlock** — custom lock screen with clock, date, username, battery and session info
- **Waybar** — fully themed bar with Spotify integration, media controls, workspace icons, and more
- **ASUS ROG support** — keyboard backlight control, profile toggle (Quiet / Balanced / Performance) with auto refresh rate switching
- **Hybrid GPU** — easy Intel/NVIDIA switching via environment variables
- **Auto wallpaper rotation** — random wallpaper every 5 minutes with smooth transitions via `awww`
- **Swiss French keyboard** layout by default (easy to change in `input.conf`)

---

## 🖥️ Components

| Component | Software |
|-----------|----------|
| Compositor | Hyprland 0.52+ |
| Bar | Waybar |
| Launcher | Rofi (wayland) |
| Terminal | Kitty |
| Shell | Fish |
| File manager | Thunar |
| Notifications | Mako |
| Lock screen | Hyprlock |
| Wallpaper | awww + pywal |
| Display manager | SDDM |
| Color scheme | Pywal (dynamic) |
| GTK Theme | WhiteSur-Dark |
| Cursor | WhiteSur-cursors |

---

## 🚀 Installation

> **Arch Linux only.** Do not run as root.

```bash
git clone https://github.com/The6LAMB/ArchHyprlandTemplate
cd ArchHyprlandTemplate
chmod +x install.sh
./install.sh
```

The script will:
1. Install all official packages via `pacman`
2. Install `yay` and AUR packages automatically
3. Deploy all dotfiles to `~/.config/`
4. Set up pywal with your first wallpaper
5. Configure SDDM with the `silent` theme
6. Set Fish as the default shell
7. Back up your existing configs before overwriting

---

## ⚙️ Post-install Setup

### GPU configuration

Edit `~/.config/hypr/environment.conf` to match your hardware:

**NVIDIA (default):**
```ini
env = WLR_DRM_DEVICES,/dev/dri/card1
env = LIBVA_DRIVER_NAME,nvidia
env = GBM_BACKEND,nvidia-drm
env = __GLX_VENDOR_LIBRARY_NAME,nvidia
```

**Intel iGPU (battery saving):**
```ini
env = WLR_DRM_DEVICES,/dev/dri/card0
# comment out the NVIDIA lines above
```

### Monitors

Edit `~/.config/hypr/monitors.conf` to set your resolution and refresh rate:

```ini
monitor = eDP-1,2560x1600@240,auto,1
```

### Wallpapers

Drop your images into `~/Wallpapers/` and `~/WallpapersLock/`, then run:

```bash
wal -i ~/Wallpapers/yourimage.jpg
hyprctl reload
```

---

## ⌨️ Key Bindings (main)

| Shortcut | Action |
|----------|--------|
| `SUPER + RETURN` | Terminal (kitty) |
| `SUPER + TAB` | App launcher (Rofi) |
| `SUPER + B` | Firefox |
| `SUPER + D` | Thunar |
| `SUPER + Q` | Close window |
| `SUPER + F` | Fullscreen |
| `SUPER + V` | Toggle floating |
| `SUPER + L` | Lock screen |
| `SUPER + W` | Wallpaper picker |
| `SUPER + X` | Power menu |
| `SUPER + 1–9` | Switch workspace |
| `SUPER + SHIFT + 1–9` | Move window to workspace |
| `SUPER + H/J/K/L` | Focus (vim-like) |
| `SUPER + SHIFT + E` | Quit Hyprland |
| `PRINT` | Screenshot (area) |
| `XF86Launch4` | Toggle ASUS profile |

---

## 📁 Config Structure

```
~/.config/hypr/
├── hyprland.conf       # Main file (sources all others)
├── monitors.conf       # Screen setup
├── autostart.conf      # Startup applications
├── environment.conf    # Environment variables (GPU, Wayland, etc.)
├── input.conf          # Keyboard, mouse, touchpad
├── general.conf        # Gaps, borders, layout
├── decoration.conf     # Blur, shadows, rounding
├── animations.conf     # Transitions and bezier curves
├── layouts.conf        # Dwindle, Master, gestures
├── keybinds.conf       # All keyboard shortcuts
├── windowrules.conf    # Per-app rules and workspace assignments
└── hyprlock.conf       # Lock screen layout
```

---

## 🎨 Theming

All colors are powered by [pywal](https://github.com/dylanaraps/pywal). Supported apps:

- Waybar → `colors-waybar.css`
- Rofi → `colors-rofi.rasi`
- Kitty → `colors-kitty.conf`
- Hyprland borders → `colors-hyprland.conf`
- Cava → `colors-cava.cava`
- Spicetify → `colors-spicetify.ini`
- Bashtop → `colors-bashtop.theme`

To switch themes (light/dark), click the theme icon in Waybar or run the `theme.sh` script.

---

## 🐛 Troubleshooting

**Check Hyprland logs:**
```bash
cat /tmp/hypr/$(ls -t /tmp/hypr/ | head -n1)/hyprland.log | tail -50
```

**Reload config without restarting:**
```bash
hyprctl reload
```

**Restore your old config:**
```bash
cp ~/.config/hypr/hyprland.conf.backup ~/.config/hypr/hyprland.conf
hyprctl reload
```

---

## 📝 Notes

- Tested on an **ASUS ROG Strix** with a hybrid Intel/NVIDIA setup
- The `XF86Launch4` key (ASUS profile button) cycles Quiet → Balanced → Performance and adjusts the refresh rate automatically
- `blazinlock` is used as the lock screen launcher (`blazinlock -s`); make sure it's installed or replace with `hyprlock` in `keybinds.conf`

---

*Made with 🐑 by [The6LAMB](https://github.com/The6LAMB)*
