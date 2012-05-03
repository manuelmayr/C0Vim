augroup filedetect
  autocmd BufRead,BufNewFile *.c0,*.h0 set filetype=c0 
  autocmd BufRead,BufNewFile *.c0 compiler c0
augroup END
