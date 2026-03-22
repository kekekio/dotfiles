set mouse=

" Paste over without overwriting register
xnoremap p pgvy

"" Leader key is space 
"" (!sic) it's already space
"let g:mapleader = \" \"

set ignorecase smartcase

" Let's save undo info to a file.
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile
