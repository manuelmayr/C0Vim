Syntax Highlighting for [C0][C0] in VIM
==================================

Enable Syntax Highlighting for Frank Pfenning's imperative
teaching language [C0][C0] in your favourite editor.

### Features
The features so far:

- basic syntax highlighting
- detection for `*.c0` and `*.h0` files

Installation
------------

To install syntax highlighting for [C0][C0] in **VIM**
you can choose between an automatic installation via
**Vimball** or the **Manual installation**.

### Vimball:
Automatic installation of the Vimball via

```
vim -c 'so %' -c 'q' c0.vba
```

### Manual 
Copy all needed files via

```
cp syntax/c0.vim $HOME/.vim/syntax
cp ftdetect/c0.vim $HOME/.vim/ftdetect
```

[C0]: http://c0.typesafety.net/

Enjoy,
-- Manuel

