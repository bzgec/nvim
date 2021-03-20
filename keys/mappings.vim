
" g Leader key
let mapleader = " "
nnoremap <Space> <Nop>

if exists('g:vscode')

else
    " Use `jj` instead of ESC to exit insert mode
    inoremap jj <ESC>

    " Copy to system clipboard
    vnoremap <C-c> "+y

    " Alternate way to save
    nnoremap <silent> <C-s> :w<CR>
    " Alternate way to quit
    nnoremap <silent> <C-Q> :wq!<CR>
    " Use control-c instead of escape
    " nnoremap <silent> <C-c> <Esc>
    " <TAB>: completion.
    inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

    " Better window navigation: `CTRL + W + h/j/k/l
    " nnoremap <C-h> <C-w>h
    " nnoremap <C-j> <C-w>j
    " nnoremap <C-k> <C-w>k
    " nnoremap <C-l> <C-w>l
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " Use `SHIFT + h/j/k/l` to resize windows
    nnoremap <silent> <S-k> :resize +1<CR>
    nnoremap <silent> <S-j> :resize -1<CR>
    nnoremap <silent> <S-h> :vertical resize -1<CR>
    nnoremap <silent> <S-l> :vertical resize +1<CR>

    " Move shortcuts with split navigations

    " Map <C-L> (redraw screen) to also turn off search highlighting until the
    " next search
    nnoremap <leader>cl :nohl<CR><C-L>

    " " Sizing window horizontally
    " "nnoremap <C-,> <C-W><
    " "nnoremap <C-.> <C-W>>
    " "nnoremap <A-,> <C-W>5<
    " "nnoremap <A-.> <C-W>5>
    " nnoremap <A-,> <C-W><
    " nnoremap <A-.> <C-W>>

    " " Sizing window vertically
    " " taller
    " nnoremap <A-t> <C-W>+
    " " shorter
    " nnoremap <A-s> <C-W>-
endif
