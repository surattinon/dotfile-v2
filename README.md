# Minimal DE for Archlinux
### Dependencies

```bash
sudo pacman -Sy --needed wget git base-devel
```


```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

```bash
paru -S --needed kitty foot nvim sway-nvidia swaync waybar fzf zsh tmux neovim eza bat zoxide wmenu j4-dmenu-desktop hyprpaper hyprlock hypridle ttf-jetbrains-mono-nerd
```
