" Number of spaces that a pre-existing tab is equal to.
" For the amount of space used for a new tab use shiftwidth.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

" What to use for an indent.
" This will affect Ctrl-T and 'autoindent'.
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw set textwidth=79

" Use UNIX (\n) line endings.
" Only used for new files so as to not force existing files to change their
" line endings.
au BufNewFile *.py,*.pyw set fileformat=unix


" Set the default file encoding to UTF-8:
set encoding=utf-8

" Puts a marker at the beginning of the file to differentiate between UTF and
" UCS encoding (WARNING: can trick shells into thinking a text file is actually
" a binary file when executing the text file):
set bomb

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Automatically indent based on file type:
filetype indent on
" Keep indentation level from previous line:
" set autoindent

" Folding based on indentation:
"set foldmethod=indent

" Colorscheme
colo delek
