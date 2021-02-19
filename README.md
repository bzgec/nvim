# My neovim/vim setup
I am using [vim-plug](https://github.com/junegunn/vim-plug) - A minimalist Vim plugin manager.
Check on the link for installation.

This repo should be put in `~/.config` directory (for both Windows and Linux)

### Windows specific
- Download latest [NeoVim](https://github.com/neovim/neovim/releases) and put it in root of `C`
  drive (like this `C:\Neovim\bin`)
- On Windows run this command to link nvim configuration to a folder where it is expected on
  Windows (with Git Bash):
  `ln -s $XDG_CONFIG_HOME/nvim ~/AppData/Local/nvim`
- Install [Vim-plug](https://github.com/junegunn/vim-plug#windows-powershell-1) with PowerShell:
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```
- Now run `C:\Neovim\bin\nvim-qt.exe` few times so that all plugins are installed and no error is
  thrown (probably 2 times).

#### Use Neovim as `Git Bash` editor
- Add `nvim` to path - open `cmd` as administrator and execute:
  `setx /M path "%path%;C:\Neovim\bin\\"`
- Set `nvim` as git editor - open `Git Bash` and execute: `git config --global core.editor nvim-qt`


## VSCode / VSCodium
To make VSCodium behave like Neovim I copied stuff from [this repo](https://github.com/ChristianChiarulli/nvim).
In [this video](https://youtu.be/g4dXZ0RQWdw) author of repo explains his setup.
Also check his [blog post](https://www.chrisatmachine.com/Neovim/22-vscodium-neovim/).

- [VSCodium repo](https://github.com/VSCodium/vscodium)

You need to change `init.vim` to point to your `vscode/settings.json` from this repository.
So you need to change this line `source C:\.config\nvim\vscode\settings.json`.
- `init.vim` location:
  - Windows: `~\AppData\Local\nvim\init.vim` or `C:\.config\nvim\init.vim`.
  - Linux: `~/.config/nvim/init.vim`.

Ok so you need to change this two files in you VSCodium:
- [keybindings.json](./utils/vscodium_config/keybindings.json): press `CTRL+SHIFT+P` and type
  `Open Keyboard Shortcuts (JSON)` and paste keybindings
- [settings.json](./utils/vscodium_config/settings.json): press `CTRL+SHIFT+P` and type
  `Open Settings (JSON)` and paste settings. **Also you need to change `neovimExecutablePaths`**
  **and `neovimInitVimPaths` in this file depending on your `neovim` executable installation**
  **location and its `init.vim` config**

You need to install this extensions:
- `Neo Vim`
- `Which Key`
- `vscode-viml-syntax` (this is not necessary but helps with editing `.vim` files)

Other setup which is not so related to Neovim but more to VSCodium - [link](./utils/vscodium_config/VSCodiumSetup.md).

### Shortcuts
- `CTRL + h/j/k/l` - move between open windows, explorer, terminal...

#### Explorer
- `SPACE + e` - toggle explorer
- `a` - create new file
- `A` - create new folder
- `r` - rename selected file
- `l` - open selected file

#### Editor
- `CTRL + j/k` - move between suggestions
- `SPACE + n` - remove highlights from searching
- `SPACE + M` - toggle minimap
- `SPACE + t` - toggle terminal
- `SPACE + f` - search + select where to search (note that with `CTRL + ALT + ENTER` you replace all
                occurrences)

#### TODO / not working
- - jump to definition
- - resize windows (tiling window manager style)
- `SHIFT + k` - show hover/IntelliSense
