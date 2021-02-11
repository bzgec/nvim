"""""""""""""""""""""""""""""""""""""""""""""""""
" My custom VIM config
" If you don't know what something does run `:options` and search for this option
"""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Show line numbers and also relative numbers
set relativenumber
set nu

" Tab stuff (1 tab = 4 spaces)
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Don't brake a column
set nowrap

" Custom per project `.vimrc`
set exrc

" For `jj` instead of ESC to exit insert mode
set timeoutlen=200

" After you are done searching stop highlighting (no need to type `:noh` after you are done
"set nohlsearch
set hlsearch

set hidden

" Don't save .swp and ~ files, but store backup files in `undodir`
" !!! Note that you must manualy create this directory:
" !!! `mkdir -p ~/.vim/undodir`
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Highlight while you search
set incsearch

" Start scrolling when you are at the bottom/top but 8 lines away
set scrolloff=8

" Draw column line
set colorcolumn=100
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Display a column left of the row numbers to show for some error or git change
set signcolumn=yes
