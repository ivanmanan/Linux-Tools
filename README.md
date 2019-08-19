# Linux-Tools
Everyday working tools I use to setup my Linux environment.

## Grub Bootloader
View the `grub` file to see the resolution size and color.

## Gnome Settings
View gnome.md

## Emacs
View README.md in emacs folder

## Bash Settings
$ cp bashrc ~/.bashrc

Adjust the spotify alias command to proper scaling factor

## Installing Spotify

```bash
snap install spotify
```

## Remove minimize, maximize, and close buttons from Windows applications
$ gsettings set org.gnome.desktop.wm.preferences button-layout :

To undo:
$ gsettings reset org.gnome.desktop.wm.preferences button-layout

## Multi-finger Gestures
1. Copy config.yml file into ~/.config/fusumua/config.yml

2. Run the command
   $ sudo fusuma > /dev/null

3. Note: Cannot run this command at startup because errors occur currently.

## Remove Nautilus File Manager's Bookmark Default Folders
Comment out the lines of the folders you want to hide in the following files:
```bash
~/.config/user-dirs.dirs
/etc/xdg/user-dirs.defaults
```

## Setting Up WiFi with Latest Drivers
0. Create a folder `~/wifi/` to store all driver files and backups.
1. Clone https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware.git/
2. Clone https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/backport-iwlwifi.git/
3. Install the latest driver on your system.
```bash
$ cd backport-iwlwifi
$ sudo make && make install
# Fix any errors by installing any missing pkgs. Ignore warnings.
# The system will tell you to reboot on success, DON'T ... yet.
# Keep reading. Copy some firmware first! :)
```
4. For Intel users: Delete all the firmware files for your Intel wireless from `/lib/firmware/`. It will be all the `iwlwifi-*.ucode` files that must go. Copy them away if you feel like having a backup is wisest, so why the heck not?
5. Copy the newest firmware from the `linux-firmware` repo to your
firmware directory (`/lib/firmware/`). These should also be `iwlwifi-*.ucode` files, like so:
```bash
# Check Network Controller
$ lspci

# EXAMPLE with Intel wireless 8265
$ cd /path/to/linux-firmware
$ sudo cp iwlwifi-8265-* /lib/firmware

# EXAMPLE with 9560 M.2 NIC
$ cd /path/to/linux-firmware
$ sudo cp iwlwifi-9260-th-b0-jf-b0-38.ucode /lib/firmware/
$ sudo cp iwlwifi-9000-pu-b0-jf-b0-38.ucode /lib/firmware/
```
