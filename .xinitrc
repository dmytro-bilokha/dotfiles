#!/bin/sh
# $Xorg: xinitrc.cpp,v 1.3 2000/08/17 19:54:30 cpqbld Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/usr/X11R6/lib/X11/xinit/.Xresources
sysmodmap=/usr/X11R6/lib/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    /usr/X11R6/bin/xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    /usr/X11R6/bin/xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    /usr/X11R6/bin/xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    /usr/X11R6/bin/xmodmap $usermodmap
fi

# start some nice programs

#/usr/X11R6/bin/twm &
#/usr/X11R6/bin/xclock -geometry 50x50-1+1 &
#exec /usr/X11R6/bin/xterm -geometry 80x66+0+0 -name login
#exec /usr/X11R6/bin/psi &
#exec /usr/X11R6/bin/tilda &
#exec /usr/X11R6/bin/imwheel &
#exec /usr/X11R6/bin/dclock -miltime -noblink -noalarm -geometry 62x16-0-0
#exec /usr/X11R6/bin/wmaker
#exec /usr/local/bin/gnome-session
#exec /usr/local/bin/startkde
#exec /usr/X11R6/bin/fluxbox
#exec /usr/X11R6/bin/starte16
#exec /usr/local/bin/wmii
#exec /usr/local/bin/startlxde
exec /usr/local/bin/xxkb &
exec /usr/local/bin/awesome
