# Minimal DE for Archlinux

# Dependencies

```bash
sudo pacman -Sy --needed wget git base-devel
```


```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

```bash
paru -S --needed kitty foot nvim sway-nvidia swaync waybar fzf zsh tmux neovim
```
