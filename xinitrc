####
# Keyboard Settings
#
# Enables the middle mouse button to work as both a middle mouse button
# and as a scroll wheel.
####

xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation" 1
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Button" 2
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "TPPS/2 IBM TrackPoint" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "TPPS/2 IBM TrackPoint" "Device Accel Constant Deceleration" 0.95

####
# Display Sttings
#
# Cursor and compositor
####

xsetroot -cursor_name left_ptr 
compton &

####
# Desktop
#
# Random picture from ~/Pictures/Desktop/
# Dunst Notifications
####

sh ~/.config/.fehbg &
dunst -conf ~/.config/dunst/dunstrc &

####
# Shell
#
####

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
xrdb ~/.Xresources

####
# Keyring
#
# Gnome keyring to remember passwords etc
####

eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

####
# Window Managers
# 
# Currently only configured for use wih Gnome, and only basically.
# Working on bspwm support.
####

sxhkd &
exec bspwm
#exec gnome-session
