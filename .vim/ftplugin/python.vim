" Nathan Farrar <nathan.farrar@gmail.com>, http://nathanfarrar.com/
" World's very best python.vim configuration file.  Based on http://bit.ly/74Y1T

" Basic Settings
set number		" enable line numbering
syntax on		" enable syntax highlighting
" colorscheme wombat	" enable the wombat theme
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql

" Pressing F2 will toggle line numbering and code folding.
" nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

" Enable the python indent script
" http://www.vim.org/scripts/script.php?script_id=974
" ~/.vim/indent/python.vim
filetype plugin indent on

" Enable the python syntax script
" http://www.vim.org/scripts/script.php?script_id=790
" ~/.vim/syntax/python.vim
autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(

" pydoc plugin
" http://www.vim.org/scripts/script.php?script_id=910
" /~.vim/plugin/pydoc.vim

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Python editing script
" http://www.vim.org/scripts/script.php?script_id=1494
" ~/.vim/ftplugin/python_editing.vim
" <Shift>-f toggles all folds, f toggles current fold

" Pydiction script 
" http://www.vim.org/scripts/script.php?script_id=850
" ~/.vim/after/ftplugin/python_pydiction.vim
" ~/.vim/after/ftplugin/pydiction.py
" ~/.vim/after/ftplugin/complete-dict
let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict' 


" Pyflakes function for easy use.
" Pyflakes is in the standard ubuntu repos.
command Pyflakes :call Pyflakes()
function! Pyflakes()
    let tmpfile = tempname()
    execute "w" tmpfile
    execute "set makeprg=(pyflakes\\ " . tmpfile . "\\\\\\|sed\\ s@" . tmpfile ."@%@)"
    make
    cw
endfunction

" Pylint function for easy use.
" Pylint is in the standard ubuntu repos.
command Pylint :call Pylint()
function! Pylint()
    setlocal makeprg=(echo\ '[%]';\ pylint\ %)
    setlocal efm=%+P[%f],%t:\ %#%l:%m
    silent make
    cwindow
endfunction

