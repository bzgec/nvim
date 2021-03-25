" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
  if exists('g:vscode')
    " Easy motion for VSCode
    " Plug 'asvetliakov/vim-easymotion'
    " Plug 'ChristianChiarulli/vscode-easymotion'
    Plug 'machakann/vim-highlightedyank'
  else
    " Install vim-pulg - https://github.com/junegunn/vim-plug#installation
    " Run:
    " ```
    " curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    "    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " ```
    " Specify a directory for plugins
    " - For Neovim: stdpath('data') . '/plugged'
    " - Avoid using standard Vim directory names like 'plugin'
    " Awsome Vim setup - https://www.youtube.com/watch?v=n9k9scbTuvQ
    " Update video from above - https://www.youtube.com/watch?v=DogKdiRx7ls

    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'morhetz/gruvbox'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'yuki-ycino/fzf-preview.vim', { 'branch': 'release/rpc' }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
    Plug 'mbbill/undotree'
    Plug 'machakann/vim-highlightedyank'
    Plug 'lambdalisue/suda.vim'
  endif

" Initialize plugin system
call plug#end()
" Reload `.vimrc` and `:PlugInstall` to install plugins.

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
