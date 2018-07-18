#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# start my window manager or desktop environment here
if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
    [[ -x "$f" ]] && . "$f"
    done
    unset f
fi
# font
xset +fp /usr/share/fonts/terminus-fonts

# X resources
xrdb ~/.Xresources

# start ibus
ibus-daemon --xim -d &

# load window manager/desktop environment

PS3="Enter selection: "
options=$( "i3" "firefox" "xterm" "quit" )
select opt in "${options[@]}"
do
    case $opt in
	i3)
	    exec i3
	    ;;
	firefox)
	    twm &
	    xterm -geometry 80x24+0+0 -fn 7x13bold -fg green -bg black &
	    exec firefox
	    ;;
	xterm)
	    exec xterm
	    ;;
	quit)
	    break
	    ;;
	*)
	    echo "no"
	    ;;
    esac
done 

