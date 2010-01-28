set -o vi

export CVSROOT=':gserver:@cmscvs.cern.ch:/cvs_server/repositories/CMSSW'

export VO_CMS_SW_DIR=/home/friis/cmssw_releases/
export SCRAM_ARCH=slc4_ia32_gcc345
export PATH=$HOME/my_bin/bin:$PATH

alias stylize='astyle --style=allman --indent=spaces=3 --pad-oper --break-blocks'
alias showFatties='du -h -a | grep \[0-9\]M | sort -n'
alias convertEPS='ls *eps | xargs -n 1 epstopdf'
alias cvstat='cvs status | grep -e "File:" -e "?" | grep -v -e "Up-to-date"'
alias la='ls -aG'
alias ll='ls -lhtG'
alias ls='ls -G'
alias root='root -l'
alias hist='history | grep'

echo "HELLO"

source ~/.zprofile_marvin
source ~/.zprofile_laptop
source ~/.zprofile_lpc

