set -o vi

export CVSROOT=':gserver:@cmscvs.cern.ch:/cvs_server/repositories/CMSSW'

export PATH=$HOME/my_bin/bin:$PATH

alias stylize='astyle --style=allman --indent=spaces=3 --pad-oper --break-blocks'
alias showFatties='du -h -a | grep \[0-9\]M | sort -n'
alias convertEPS='ls *eps | xargs -n 1 epstopdf'
alias cvstat='cvs status | grep -e "File:" -e "?" | grep -v -e "Up-to-date"'
alias root='root -l'
alias hist='history | grep'

echo "HELLO"

source ~/.zprofile_marvin
source ~/.zprofile_laptop
source ~/.zprofile_lpc
source ~/.zprofile_t3

