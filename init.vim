

if exists('g:vscode')
    " VSCode/VSCodium extension
    " Checkout this video https://youtu.be/g4dXZ0RQWdw 
    " Which is basically this page: https://www.chrisatmachine.com/Neovim/22-vscodium-neovim/
    " All VSCodium settings are from him (this repo https://github.com/ChristianChiarulli/nvim)
    source $HOME/.config/nvim/vscode/settings.json
    "source C:\Users\Lab\Desktop\bzgec\nvim\vscode\settings.json
else
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
    
    " Use `jj` instead of escape to exit insert mode
    inoremap jj <ESC>
    set timeoutlen=250

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
    
    
    " Install vim-pulg - https://github.com/junegunn/vim-plug#installation
    " Run:
    " ```
    " curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    "    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    " ```
    " Specify a directory for plugins
    " - For Neovim: stdpath('data') . '/plugged'
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.vim/plugged')
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
    
    " Initialize plugin system
    call plug#end()
    " Reload `.vimrc` and `:PlugInstall` to install plugins.
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " telescope setup
    let mapleader = " "
    nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " gruvbox setup
    colorscheme gruvbox
    set bg=dark
    "set bg=light
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " coc setup
    " TextEdit might fail if hidden is not set.
    set hidden
    
    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup
    
    " Give more space for displaying messages.
    set cmdheight=2
    
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300
    
    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c
    
    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif
    
    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    
    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction
    
    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif
    
    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
    
    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    
    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    
    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
    
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')
    
    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)
    
    " Formatting selected code.
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)
    
    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end
    
    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    
    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)
    
    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)
    
    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif
    
    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of language server.
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)
    
    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')
    
    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    
    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
    
    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
    
    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
    
    " coc extensions
    let g:coc_global_extensions = [
    \   'coc-clangd', 'coc-cmake',
    \   'coc-json',
    \   'coc-html', 'coc-css', 'coc-cssmodules',
    \   'coc-pyright',
    \   'coc-markdownlint',
    "\   'coc-eslint',
    \   'coc-explorer',
    \   'coc-fzf-preview',
    \   'coc-git',
    \   'coc-snippets',
    \   'coc-pairs',
    "\   'coc-spell-checker',
    \   ]
    
    set statusline^=%{get(g:,'coc_git_status','')}%{get(b:,'coc_git_status','')}%{get(b:,'coc_git_blame','')}
    :nmap <space>e :CocCommand explorer<CR>
    
    nmap <Leader>f [fzf-p]
    xmap <Leader>f [fzf-p]
    
    nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
    nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
    nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
    nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
    nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
    nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
    nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
    nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
    nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
    nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
    nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
    xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
    nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
    nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
    nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
    
    nmap <leader>a <Plug>(coc-codeaction-selected)
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " undotree setup
    nnoremap <leader>ut :UndotreeToggle<CR>
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    
    fun! TrimWhitespace()
        let l:save = winsaveview()
        keeppatterns %s/\s\+$//e
        call winrestview(l:save)
    endfun
    
    augroup bzgec
        autocmd!
    "    autocmd BufWritePre * :call TrimWhiespace()
        autocmd BufWritePre * :%s/\s\+$//e
    augroup END
    
    " Move shortcuts with split navigations
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>
    
    " Map <C-L> (redraw screen) to also turn off search highlighting until the
    " next search
    nnoremap <leader>cl :nohl<CR><C-L>
    
    " Sizing window horizontally
    "nnoremap <C-,> <C-W><
    "nnoremap <C-.> <C-W>>
    "nnoremap <A-,> <C-W>5<
    "nnoremap <A-.> <C-W>5>
    nnoremap <A-,> <C-W><
    nnoremap <A-.> <C-W>>
    
    " Sizing window vertically
    " taller
    nnoremap <A-t> <C-W>+
    " shorter
    nnoremap <A-s> <C-W>-
    
    " Source Vim configuration file and install plugins
    nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim<CR>
    nnoremap <silent><leader>2 :PlugInstall<CR>

endif 