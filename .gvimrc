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

" Select colormap: 'soft', 'softlight', 'standard' or 'allblue'
let xterm16_colormap    = 'standard'
"
"                 " Select brightness: 'low', 'med', 'high', 'default'
"                 or custom levels.
let xterm16_brightness  = 'default'
"
" colo xterm16
" Only do this part when compiled with support for autocommands.
"set makeprg=scramv1
set dir=~/Code/.vimCrap
set backupdir=~/Code/.vimCrap
"set makeprg=ssh\ -q\ $THE_SITE\ \"cd\ CMSSW/$THE_RELEASE/src\;\ scramv1\ b\ -j\ 4\ 2\\\>\\\&1\ \\\|\ sed\ \\\"s\\\|/afs/cern.ch/user/f/friis/CMSSW\\\|/Users/friis/Code/$THE_LOC\\\|\\\"\ \\\|\ sed\ \\\"s\\\|/home/friis/CMSSW\\\|/Users/friis/Code/$THE_LOC\\\|\\\"\"

"set makeprg=~/scripts/remoteProjectScripts/buildRemote.sh\ %:p
"set makeprg=~/scripts/remoteProjectScripts/buildRemote.sh\ %:p
set makeprg=~/scripts/remoteProjectScripts/build.py
let $CVSROOT=':gserver:anonymous@cmscvs.cern.ch:/cvs_server/repositories/CMSSW'
" colorscheme xterm16
colorscheme wombat

set guioptions-=T " no toolbar
set guioptions-=l " no scrollbars
set guioptions-=r
set guioptions-=L
set guioptions-=R


" Autoclose omni complete preview window
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"autocmd! BufWritePost * :!/Users/friis/scripts/remoteProjectScripts/putRemote.sh %:p 
"autocmd! BufWritePost * :silent !/Users/friis/scripts/remoteProjectScripts/putRemote.sh %:p 

"set tags=tags;/,~/Code/root_tags
set tags=~/Code/root_tags
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags --c++-kinds=+p --fields=+iaS --extra=+q --languages=c++'


set lines=62
set columns=230
"set hidden
"set autowrite
"set expandtab
"set nowrap
"set cindent
"set number
"set visualbell
"
"set wildmenu
"set wildmode=list:longest
"
"set ignorecase
"set smartcase
"set scrolloff=3
"
"
"let g:proj_window_width=56
"let g:proj_flags="gimstT"
""map <silent> <F13> <Plug>ToggleProject
""map <silent> <C-P> <Plug>ToggleProject
"map <silent> <F13> <ESC>:NERDTreeToggle<CR>
"map <silent> <C-P> <ESC>:NERDTreeToggle<CR>
"
"nmap <F16> <Esc>:make<CR>
"map <F14> <Esc>:copen<CR>
"map <F15> <Esc>:cclose<CR>
"map  <silent> <F17>    <Esc>:cn<CR>
"map  <silent> <F18>    <Esc>:cp<CR>
"
""map <silent> <C-S> :!\/Users\/friis\/scripts\/remoteProjectScripts\/putRemote.sh\ %<CR> 
""map <C-S> :!/Users/friis/scripts/remoteProjectScripts/putRemote.sh %<CR> 
""map <silent> <C-S> :!/Users/friis/scripts/remoteProjectScripts/putRemote.sh %:p<CR>
"map <S-F13> :!/Users/friis/scripts/buildCTags.sh<CR>
""map <C-S-T> :!/Users/friis/scripts/buildCTags.sh<CR>
"
map <C-J> <C-W>j<C-W> 
map <C-K> <C-W>k<C-W> 
"
map <C-L> <C-W>l<C-W> 
map <C-H> <C-W>h<C-W> 
"
"map <F6> <ESC>:VCSVimDiff<CR>
"
""let g:miniBufExplMapWindowNavVim = 1 
""let g:miniBufExplMapWindowNavArrows = 1 
""let g:miniBufExplMapCTabSwitchBufs = 1 
""let g:miniBufExplModSelTarget = 1 
"
""Use one of the following to define the camel characters.
""Stop on capital letters.
"":let g:camelchar = "A-Z"
"""Also stop on numbers.
":let g:camelchar = "A-Z0-9_."
""Include '.' for class member, ',' for separator, ';' end-statement,
""and <[< bracket starts and "'` quotes.
"":let g:camelchar = "A-Z0-9.,;:{([`'\"
"
"noremap <silent><S-Space> :<C-u>cal search('\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%^','bW')<CR>
"
"noremap <silent><Space> :<C-u>cal search('\<\<Bar>\%(^\<Bar>[^'.g:camelchar.']\@<=\)['.g:camelchar.']\<Bar>['.g:camelchar.']\ze\%([^'.g:camelchar.']\&\>\@!\)\<Bar>\%$','W')<CR>
"
:let g:fuzzy_matching_limit = 50
:let g:fuzzy_ceiling = 10000
set cursorline
set cursorcolumn
"map <leader>t :FuzzyFinderTextMate<CR>
"map <leader>b :FuzzyFinderBuffer<CR>
"map <leader>s <ESC>:s/Signal/Background/g<CR>:noh<CR>
"
let NERDTreeHijackNetrw = 0
let NERDTreeIgnore=['CVS', 'pyc$', '\.root$', 'pdf$', 'png$', '@Batch', 'xml.bak$', 'xml.fragment$']
let NERDTreeWinSize=61
let NERDTreeWinPos=0
let NERDTreeChDirMode=2 "always set root as cwd
"
let NERDTreeChristmasTree = 1
"
"" Reduce autocomplete
"set complete=.,w,b,t 
