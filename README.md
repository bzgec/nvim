# My neovim/vim setup
I am using [vim-plug](https://github.com/junegunn/vim-plug) - A minimalist Vim plugin manager.
Check on the link for installation.

## VSCode / VSCodium
To make VSCodium behave like Neovim I copied stuff from [this repo](https://github.com/ChristianChiarulli/nvim).
In [this video](https://youtu.be/g4dXZ0RQWdw) author of repo explains his setup.
Also check his [blog post](https://www.chrisatmachine.com/Neovim/22-vscodium-neovim/).

- [VSCodium repo](https://github.com/VSCodium/vscodium)

You need to change `init.vim` to point to your `vscode/settings.json` from this repository.
So you need to change this line `source C:\.config\nvim\vscode\settings.json`. 

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
- `vscode-viml-syntax` (this is not neccessary but helps with editing `.vim` files) 

Other setup which is not so related to Neovim but more to VSCodium - [link](.//utils/vscodium_config/VSCodiumSetup.md).
