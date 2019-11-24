# VS Code Settings

## Symbolic Links
```bash
# Linux
ln -s ~/.config/Code/User/settings.json ~/code_settings.json
ln -s ~/.config/Code/User/keybindings.json ~/code_keyboard_settings.json

# MacOS
USERNAME=$(id -un)
ln -s /Users/$USERNAME/Library/Application\ Support/Code/User/settings.json ~/code_settings.json
ln -s /Users/$USERNAME/Library/Application\
Support/Code/User/keybindings.json ~/code_keyboard_settings.json

# Windows
%APPDATA%\Code\User\settings.json
%APPDATA%\Code\User\keybindings.json
```
