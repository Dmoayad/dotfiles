#!/bin/sh

function run {
  if ! pgrep $1 ; then
    $@&
  fi
}
run nm-applet
#run dbus-launch update-checker
#run light-locker
#run pulseaudio -D
#run compton --shadow-exclude '!focused'
#run xcape -e 'Super_L=Super_L|Shift_L|p'
#run /usr/lib/mate-polkit/polkit-mate-authentication-agent-1
run thunar --daemon
#run xfce4-power-manager
# run pa-applet
run volumeicon
#run xrdb merge ~/.Xresources
#run xfsettingsd
#run gnome-keyring-daemon
#run urxvtd
run nitrogen --restore
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
run picom 
# run discord
