" Vimball Archiver by Charles E. Campbell, Jr., Ph.D.
UseVimball
finish
syntax/c0.vim	[[[1
80
" Vim syntax file
" Language: C0
" Author: Manuel Mayr <manuel.mayr@uni-tuebingen.de>
" --------------------------------------------------

" if there already exists a language definition
" just finish
if exists("b:current_syntax")
  finish
endif

" C0 keywords
syn keyword c0LoopStmts while for break continue
syn keyword c0Conditional if else
syn keyword c0Types int bool string void
syn keyword c0Typedef typedef
syn keyword c0Struct struct
syn keyword c0Return return

syn keyword c0BoolConst true false
syn match	c0Special	display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn region c0String start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=c0Special,@Spell
syn match	cCharacter	"L\='[^\\]'"
syn match	cCharacter	"L'[^']*'" contains=cSpecial
syn match	c0Numbers	display transparent "\<\d\|\.\d" contains=c0Number,cOctal
" Same, but without octal error (for comments)
syn match	c0Number		display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"
" Hex number
syn match	c0Number		display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"
" Flag the first zero of an octal number as something special
syn match	c0Octal		display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=cOctalZero
syn match	c0OctalZero	display contained "\<0"

syn region c0Included display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	c0Included display contained "<[^>]*>"
syn match	c0Use display "^\s*#use\s*["<]" contains=c0Included

syntax region	c0Block		start="{" end="}" transparent fold

syn keyword c0Todo contained TODO FIXME XXX
syn match c0Contract display contained "@\(requires\|ensures\|loop_invariant\|assert\)"
syn match c0Contract display contained "\\old([^)]*)"
syn match c0Contract display contained "\\length([^)]*)"
syn match c0Contract display contained "\\result"
syn cluster	c0CommentGroup	contains=c0Todo,c0Contract
syntax match	c0CommentStartError display "/\*"me=e-1 contained
syntax match	c0CommentSkip	contained "^\s*\*\($\|\s\+\)"
syntax region c0CommentString	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end=+\*/+me=s-1 contains=c0Special,c0CommentSkip
syntax region c0Comment	matchgroup=c0CommentStart start="/\*" end="\*/" contains=@c0CommentGroup,c0CommentStartError,c0CommentString,c0Character,@Spell extend
syntax region c0Comment2String	contained start=+L\=\\\@<!"+ skip=+\\\\\|\\"+ end=+"+ end="$" contains=c0Special
syntax region  c0CommentL	start="//" skip="\\$" end="$" keepend contains=@c0CommentGroup,c0Comment2String,c0Character,@Spell

let b:current_syntax="c0"

hi def link c0LoopStmts Repeat
hi def link c0Conditional Conditional
hi def link c0Return Special

hi def link c0Types Type
hi def link c0Struct Structure
hi def link c0Typedef Typedef

hi def link c0Included c0String
hi def link c0Use PreProc

hi def link c0BoolConst Boolean
hi def link c0Special c0String
hi def link c0String String
hi def link c0Numbers Number
hi def link c0Number		Number
hi def link c0Octal		Number
hi def link c0OctalZero		Error

hi def link c0Todo Error
hi def link c0Contract Special
hi def link c0CommentSkip c0Comment
hi def link c0CommentStart c0Comment
hi def link c0CommentString c0Comment
hi def link c0CommentL c0Comment
hi def link c0Comment Comment
ftdetect/c0.vim	[[[1
1
autocmd BufRead,BufNewFile *.c0,*.h0 set filetype=c0 
