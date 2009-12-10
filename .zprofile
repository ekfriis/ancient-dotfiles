export ROOTSYS=/Applications/root
export PATH=/usr/local/bin:$ROOTSYS/bin:~/scripts:~/scripts/remoteProjectScripts:/Applications/Arduino/hardware/tools/avr/bin/:$PATH
export PATH=/Users/friis/Code/astyle/build/mac/bin/:$HOME/Code/avr/bin:$PATH
export PATH=:$PATH
export GLOBUS_LOCATION=/usr/local/globus-4.2.1
source /usr/local/globus-4.2.1/etc/globus-user-env.sh

# TeX installation
export PATH=/usr/texbin:$PATH

#Fink stuff
test -r /sw/bin/init.sh && . /sw/bin/init.sh
# MacPorts Installer addition on 2009-01-19_at_20:55:23: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export LD_LIBRARY_PATH=/usr/lib:$ROOTSYS/lib:$LD_LIBRARY_PATH:/sw/lib/
export PYTHONPATH=$ROOTSYS/lib/root:$ROOTSYS/lib:$PYTHONPATH
export DYLD_LIBRARY_PATH=$ROOTSYS/lib:$DYLD_LIBRARY_PATH
export CVSROOT=':gserver:anonymous@cmscvs.cern.ch:/cvs_server/repositories/CMSSW'
#export CVSROOT=':kserver:cmscvs.cern.ch:/cvs_server/repositories/CMSSW'
export LS_COLORS="no=00:fi=00:di=01;94:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=01;32:*.cmd=01;32:*.exe=01;32:*.com=01;32:*.btm=01;32:*.bat=01;32:*.sh=01;32:*.csh=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tz=01;31:*.rpm=01;31:*.cpio=01;31:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.xbm=01;35:*.xpm=01;35:*.png=01;35:*.tif=01;35:*.cfg=01;33:*.cc=92:*.h=95:"

export VO_CMS_SW_DIR=/home/friis/cmssw_releases/
export SCRAM_ARCH=slc4_ia32_gcc345


set -o vi

alias stylize='astyle --style=allman --indent=spaces=3 --pad-oper --break-blocks'
alias showFatties='du -h -a | grep \[0-9\]M | sort -n'
alias convertEPS='ls *eps | xargs -n 1 epstopdf'
alias cvstat='cvs status | grep -e "File:" -e "?" | grep -v -e "Up-to-date"'
alias qlf='qlmanage -p'
alias la='ls -aG'
alias ll='ls -lhtG'
alias ls='ls -G'
alias root='root -l'
alias davis='ssh -CXY cms.physics.ucdavis.edu'
alias lxplus='ssh -CY lxplus231.cern.ch'
alias hist='history | grep'

alias fnal='umount -f /Network/LPC; ls /Network/LPC'
alias sizer='avr-size --format=avr --mcu=atmega168'
alias werking='cd ~/CMSSW/tutorial/src/RecoTauTag/TauTagTools/test/'
alias 310='cd ~/CMSSW/310p1/src/'
alias 310t='cd ~/CMSSW/310p1/src/RecoTauTag/TauTagTools/test/'

#alias cvs='cvs -d :gserver:anonymous@cmscvs.cern.ch:/cvs_server/repositories/CMSSW'


alias mathematicaTunnel='ssh -v -L 16286:licelan2.cern.ch:16286 lxplus.cern.ch'
alias arduino='screen /dev/tty.usbserial-A7007cCc 9600'

##
# Your previous /Users/friis/.profile file was backed up as /Users/friis/.profile.macports-saved_2009-01-19_at_20:55:23
##



# MacPorts Installer addition on 2009-01-19_at_20:55:23: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH=/opt/local/share/man:$MANPATH
# Finished adapting your MANPATH environment variable for use with MacPorts.

