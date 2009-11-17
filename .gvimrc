set makeprg=~/scripts/remoteProjectScripts/build.py
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
set cursorline
set cursorcolumn

