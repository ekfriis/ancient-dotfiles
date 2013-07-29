

set -o vi

export CVSROOT=':gserver:@cmscvs.cern.ch:/cvs_server/repositories/CMSSW'

export AFS=/afs/cern.ch/user/f/friis

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
source ~/.zprofile_lxplus

# Setup SSH agent

echo "Setting up SSH agent"
SSH_ENV="$HOME/.ssh/environment"

#function start_agent {
#     echo "Initialising new SSH agent..."
#     /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#     echo succeeded
#     chmod 600 "${SSH_ENV}"
#     . "${SSH_ENV}" > /dev/null
#     /usr/bin/ssh-add;
#}

# Source SSH settings, if applicable
#if [ -f "${SSH_ENV}" ]; then
#     . "${SSH_ENV}" > /dev/null
#     #ps ${SSH_AGENT_PID} doesn't work under cywgin
#     #ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#     ps -e | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#         start_agent;
#     }
#else
#     start_agent;
#fi 
