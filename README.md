# huarkiou's own archlinux configurations (backup)
#### Recovering
1. Install archlinux
2. Install the following packages
```bash
# fonts
sudo pacman -S ttf-nerd-fonts-symbols-mono wqy-microhei
# necessities
sudo pacman -S xorg-xinit xorg-xbacklight alacritty i3-gaps rofi picom numlockx network-manager-applet pulseaudio feh thunar
# input method
sudo pacman -S fcitx5 fcitx5-chinese-addons fcitx5-qt fcitx5-gtk fcitx5-configtool
# neovim
sudo pacman -S neovim python-pynvim neovim-plug neovim-symlinks
# some tools
sudo pacman -S btop neofetch clash flameshot
# statusbar
yay -S polybar 

```
3. Copy
```bash
cp ./* ~/ -r
```

