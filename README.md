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
