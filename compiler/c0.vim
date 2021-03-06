" Vim compiler file
" Compiler: C0 Compiler
" Maintainer: Manuel Mayr <manuel.mayr@uni-tuebingen.de>
" Latest Revision: 2012-04-24

if exists("current_compiler")
  finish
endif
let current_compiler = "cc0"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo-=C

CompilerSet errorformat=%f:%l.%c-%*[0-9].%*[0-9]:error:%m

CompilerSet makeprg=cc0\ \-d\ -o\ \"%:r\"\ \"%:p\"
