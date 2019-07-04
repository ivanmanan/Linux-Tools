# Gnome Settings
Hotkeys: _Alt+F2_ then type _r_

## Persistent Mouse Cursor Size
_gsettings set org.gnome.desktop.interface cursor-size 48_

## gnome-control-center
### At Default Keyboard:
Move to workspace above: _Super+Q_

Move to workspace below: _Super+W_

### At Custom Keyboard:
Pause Spotify Song - F10 - _dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause_

Previous Spotify Song - F11 - _dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous_

Next Spotify Song - F12 - _dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next_

Terminal - Alt+t - _terminator_

Chromium - Alt+g - _chromium-browser_

### At Details:
Device name: thinkpad

Default Applications: Chromium

## gnome-tweak-tool
### Gnome Extensions:
Google search _gnome shell extensions_

### Appearance:
Global Dark Theme: ON

### Fonts:
Adjust scaling factor as necessary

On 1440p: Leave HDPi as 2 in Windows and scaling factor as 0.85 in Fonts; Must edit GRUB Bootloader config file separately;

### Keyboard and Mouse:
Switch between overview and desktop: _Right Super_

Reasoning: We do not want to accidentally press _Super_ to bring up overview. We should only need to press _Super+s_ to bring overview

### Typing:
At 'Ctrl Key Position' - Only check these two boxes: 'Caps Lock as Ctrl' AND 'Swap Ctrl and Caps Lock'

### Workspaces:
Workspace Creation: Dynamic

Workspaces only on primary display: ON

### Extensions:
Hide activities button - ON

No Topleft Hot Corner - ON

Alternate Tab - ON - Present windows as: Thumbnail and application icon; Show only windows in the current workspace

Desktop Scroller - ON - Wallpaper Scrolling: ON; Enabled Edges: LEFT, RIGHT, TOP

Hide Top Bar - ON - Only change Keyboard Shortcuts - key that triggers the bar to be shown: _Super+E_; Pressing the shortcut again rehides the panel: ON

Top Panel workspace scroll: ON


## Installing Drop Down Terminal
```bash
sudo apt install guake
# used to enable the 'exit' command in guake
sudo apt install --reinstall libutempter0
```
Open up Guake Preferences and adjust as needed.


## Removing Ubuntu Side Dock
_sudo apt install dconf-tools_
Navigate org->gnome->shell->extensions->dash-to-dock and set **autohide** to **off**.
