# Configuration files by bspw.

## Hyprland
### Required apps:
For screenshots: ```grim slurp wl-copy wl-clipboard copyq```<br>
Apps used in setup: ```alacritty dunst hyprlock swww waybar imv yad rofi```<br>
Nemo: ```sudo pacman -S nemo --assume-installed cinnamon-desktop``` to avoid installing cinnamon dependencies<br>
Some external monules and apps: ```xdg-desktop-portal-hyprland bc scrcpy```<br>
Copy wallpapers to ```.config/swww/wallpapers```

## Other setup guides
### For Neovim, check [Nvim setup hints](https://github.com/beispielsweise/configs/blob/main/config/nvim/README.md):
### For i3:
i3 base installation +
```picom polybar```

### Other stuff
## Setups
To setup and use second built-in SSD natively, preform the following steps:
1. Create a directory for your disc e.g. ```mkdir -p ~/SSD2```
2. Run ```sudo fdisk -l```. Mark the /dev/YOUR_PARTITION_NAME of the partition
3. Get UUID of the partition by running ```sudo blkid /dev/YOUR_PARTITION_NAME```. 
4. Open the ```/etc/fstab``` file and add the following line:<br>
```
UUID=YOUR_UUID  /home/USERNAME/SSD2 ntfs-3g  uid=1000,gid=1000,umask=0022  0  0
```
<br>Just in case, check if the uid and gid values are correct by running ```id -u``` and ```id -g```
## Apps
- MControlCenter to control fans on an MSI laptop (Arch kernels have all modules, unlike fedora/pop_os or others) <br>
- EasyEffects for microphone upgrade. Make sure to tick "Launch on startup" in preferences.
- [Firefox gnome theme](https://github.com/rafaelmardojai/firefox-gnome-theme): <br>
  1. Install the AUR package ```firefox-gnome-theme```
  2. Follow the instructions at cat /usr/share/doc/firefox-gnome-theme/INSTALL.md
