
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/keys/mappings.vim

if exists('g:vscode')
  " VSCode/VSCodium extension
  " Checkout this video https://youtu.be/g4dXZ0RQWdw
  " Which is basically this page: https://www.chrisatmachine.com/Neovim/22-vscodium-neovim/
  " All VSCodium settings are from him (this repo https://github.com/ChristianChiarulli/nvim)
  source ~/.config/nvim/vscode/settings.vim
  source ~/.config/nvim/plug-config/highlightyank.vim
else
  " Source Vim configuration file and install plugins
  nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim<CR>
  nnoremap <silent><leader>2 :PlugInstall<CR>

  " Plugin configuration
  source $HOME/.config/nvim/plug-config/coc.vim
  source $HOME/.config/nvim/plug-config/gruvbox.vim
  source $HOME/.config/nvim/plug-config/highlightyank.vim
  source $HOME/.config/nvim/plug-config/telescope.vim
  source $HOME/.config/nvim/plug-config/undotree.vim
endif

