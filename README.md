# huarkiou's own archlinux configurations (backup)
#### Recovering
1. Install archlinux
2. Install the following packages
```bash
# fonts
sudo pacman -S ttf-nerd-fonts-symbols-mono
# necessities
sudo pacman -S vim xorg xinit alacritty i3-gaps polybar rofi picom numlockx nm-applet xbacklight pulseaudio feh flameshot clash
# input method
sudo pacman -S fcitx5 fcitx5-chinese-addons fcitx5-qt fcitx5-gtk fcitx5-configtool
# some tools
sudo pacman -S btop

```
3. Copy
```bash
cp ./* ~/ -r
```

