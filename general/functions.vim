" Random Useful Functions

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup bzgec
  autocmd!
"  autocmd BufWritePre * :call TrimWhiespace()
  autocmd BufWritePre * :%s/\s\+$//e
augroup END
