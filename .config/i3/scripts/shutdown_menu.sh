#!/bin/bash

i3-msg mode default

case "$1" in
	poweroff)
		exec poweroff
		;;
	hibernate)
		systemctl hibernate
		;;
	suspend)
		systemctl suspend
		;;
	reboot)
		exec reboot
		;;
	logout)
		i3-msg exit
		;;
	lock)
		exec $HOME/.config/i3/scripts/lock
		;;
esac
