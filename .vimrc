" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set t_Co=256

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  set nocp
  filetype plugin indent on
  " filetype plugin on
  set shiftwidth=3
  au BufNewFile,BufRead *.pde set filetype=cpp
  au BufNewFile,BufRead *.mvac set filetype=xml

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Don't mess up local directories
set dir=~/Code/.vimCrap
set backupdir=~/Code/.vimCrap

set makeprg=~/scripts/remoteProjectScripts/buildRemote.sh\ %:p

" Correct CVS server
let $CVSROOT=':gserver:anonymous@cmscvs.cern.ch:/cvs_server/repositories/CMSSW'

colorscheme wombat256

" ctags location
set tags=tags

set hidden
set autowrite
set expandtab
set nowrap
set cindent
set number
set visualbell

set wildmenu
set wildmode=list:longest

set ignorecase
set smartcase
set scrolloff=3
set novisualbell

map <C-J> <C-W>j<C-W> 
map <C-K> <C-W>k<C-W> 
map <C-j> <C-W>j<C-W> 
map <C-k> <C-W>k<C-W> 

map <C-L> <C-W>l<C-W> 
map <C-H> <C-W>h<C-W> 

map <F6> <ESC>:VCSVimDiff<CR>


"Use one of the following to define the camel characters.
:let g:camelchar = "A-Z0-9_."
"Include '.' for class member, ',' for separator, ';' end-statement,
"and <[< bracket starts and "'` quotes.
":let g:camelchar = "A-Z0-9.,;:{([`'\"
noremap <silent><S-Space> :<C-u>cal search('\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
noremap <silent><Space> :<C-u>cal search('\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>

set cursorline
"set cursorcolumn

"FuzzyFinder settings
map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>s <ESC>:s/Signal/Background/g<CR>:noh<CR>
:let g:fuzzy_matching_limit = 50
:let g:fuzzy_ceiling = 10000


" NERDTree settings
map <silent> <F13> <ESC>:NERDTreeToggle<CR>
map <silent> <C-P> <ESC>:NERDTreeToggle<CR>
let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['CVS', 'pyc$', '\.root$', 'pdf$', 'png$', '@Batch', 'xml.bak$', 'xml.fragment$']
let NERDTreeWinSize=61
let NERDTreeWinPos=0
let NERDTreeChDirMode=2 "always set root as cwd
let NERDTreeChristmasTree = 1

nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>

"" Reduce autocomplete
set complete=.,w,b
