#!/bin/sh

[ -r /etc/profile ] && source /etc/profile
[ -r $HOME/.profile ] && source $HOME/.profile

function check_cmd () {
	command -v "${1}" >/dev/null 2>&1;
	return $?;
}

# System tray
if [ -z "$(pgrep trayer)" ] ; then
    trayer --edge top \
           --align right \
           --expand true \
           --alpha 0 \
           --transparent true \
           --width 10 \
           --tint 0x282c34 &
fi

# Power manager
if [ -z "$(pgrep xfce4-power-manager)" ] ; then
    xfce4-power-manager &
fi

# Load configuration for X applications (e.g., rxvt-unicode)
[ -r "${HOME}/.Xresources" ] && xrdb -merge "${HOME}/.Xresources"

# Change the cursor with an arrow :)
check_cmd xsetroot && xsetroot -cursor_name left_ptr &

# Taffybar
# if [ -z "$(pgrep taffybar)" ] ; then
#     taffybar &
# fi

# Redshift
if [ -z "$(pgrep redshift)" ] ; then
    redshift &
fi

# Screensaver
if [ -z "$(pgrep xscreensaver)" ] ; then
    xscreensaver -no-splash &
fi

# Autolock
if [ -z "$(pgrep xautolock)" ] ; then
    xautolock -time 10 -locker "xscreensaver-command -lock" &
fi

# Wallpaper
if [ -x /usr/bin/feh ]; then
  if [ -r "${HOME}/.wallpaper.jpg" ] ; then
    /usr/bin/feh --bg-fill "${HOME}/.wallpaper.jpg" &
  fi
fi

# compton
#if [ -z "$(pgrep compton)" ] ; then
    #compton -b &
#fi

# Network Applet
if [ -z "$(pgrep nm-applet)" ] ; then
    nm-applet &
fi

# NexCloud
if [ -z "$(pgrep nextcloud)" ] ; then
  check_cmd nextcloud && nextcloud &
fi

check_cmd xcompmg && xcompmgr &

if [ -z "$(pgrep volti)" ] ; then
  check_cmd volti && volti &
fi

if [ -z "$(pgrep workrave)" ] ; then
  check_cmd workrave && workrave &
fi
# xbindkeys
