Syntax Highlighting for C0 in VIM
==================================

Enable Syntax Highlighting for Frank Pfenning's imperative
teaching language [C0][C0] in your favourite editor.

Installation
------------

### Vimball
Simply execute `./create_vimball` and `./install_vimball` on
your terminal.

### Setting up your vimrc
You need to add the follwing line to your `$HOME/.vimrc`:

```
autocmd BufRead,BufNewFile *.c0 set filetype=c0 
```

[C0]: http://c0.typesafety.net/

Enjoy

