#!/bin/bash

sp_state="$(i3-msg -t get_tree | jq '.nodes[] | .nodes[] | .nodes[] | select(.name=="__i3_scratch") | .floating_nodes[] | .nodes[] | [.window_properties|.class]' | grep dropdown 1>/dev/null; echo $?)"

if i3-msg -t get_tree | grep '"class":"dropdown"' &>/dev/null; then
	echo "dropdown exist"
	if [ "$sp_state" == "0" ]; then
		echo "dropdown is hidden"
		i3-msg "[class="dropdown"] scratchpad show"
	else 
		echo "dropdown is not hidden"
		i3-msg '[class="dropdown"] move scratchpad'
	fi
else
	echo "dropdown doesn't exist"
	i3-msg "exec --no-startup-id kitty --class dropdown"
fi
