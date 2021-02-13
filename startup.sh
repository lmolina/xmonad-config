#!/bin/sh

# System tray
if [ -z "$(pgrep trayer)" ] ; then
    trayer --edge top \
           --align right \
           --widthtype percent \
           --height 24 \
           --alpha 0 \
           --transparent true \
           --width 5 \
           --tint 0x282c34 &
fi

# Power manager
if [ -z "$(pgrep xfce4-power-manager)" ] ; then
    xfce4-power-manager &
fi

# Load configuration for X applications (e.g., rxvt-unicode)
[ -r "${HOME}/.Xresources" ] && xrdb -merge "${HOME}/.Xresources"

# Taffybar
# if [ -z "$(pgrep taffybar)" ] ; then
#     taffybar &
# fi

# Redshift
if [ -z "$(pgrep redshift)" ] ; then
    redshift &
fi

# Screensaver
if [ -z "$(pgrep gnome-screensaver)" ] ; then
    gnome-screensaver &
fi

# Autolock
if [ -z "$(pgrep xautolock)" ] ; then
    xautolock -time 10 -locker "gnome-screensaver-command -lock" &
fi

# Wallpaper
if [ -x /usr/bin/feh ]; then
  if [ -r "${HOME}/.wallpaper.jpg" ] ; then
    /usr/bin/feh --bg-fill "${HOME}/.wallpaper.jpg" &
  fi
fi

# compton
if [ -z "$(pgrep compton)" ] ; then
    compton -b &
fi

# Network Applet
if [ -z "$(pgrep nm-applet)" ] ; then
    nm-applet &
fi

# Google Drive
#if [ -z "$(pgrep insync)" ] ; then
#    insync start &
#fi
# xbindkeys
