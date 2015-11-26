# ~/.bashrc: executed by bash(1) for non-login shells.

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
alias ll='ls $LS_OPTIONS -l'
alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

##QBIAN-CONF-START##
# Note : these export will be available within the qbian cli & within the provision script ( until deleted form you )
export user=pi
export userpass=raspberry
export rootpass=raspberry
export hostname=raspberrypi
export minibain_img_url=https://s3-eu-west-1.amazonaws.com/qbain-images/trojanspike-minibian.tar.gz


################################################################################################
# The only difference in mine & the original minibain image is a symbolic link
# ran at boot executing /root/Provision.sh
# view $ less /etc/init.d/qbian-provision
# It passes true|false if it's a deveice | not
# One I created which just runs the provision script on start up
# https://s3-eu-west-1.amazonaws.com/qbain-images/trojanspike-minibian.tar.gz

# Original image used
# Note , you'd need to log in and run your provision script 
# $ /root/Provision.sh # and do 
# http://sourceforge.net/projects/minibian/files/2015-02-18-wheezy-minibian.tar.gz/download

# minibian wifi - TODO : make into compatable image
# http://sourceforge.net/projects/minibianwifi/files/latest/download
# Note : you could do something in your provision script to remove this piece of config
# using a tool like sed to replace.
##QBIAN-CONF-END##
