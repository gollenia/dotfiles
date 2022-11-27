function __setprompt
{
	local LAST_COMMAND=$? # Must come first!

	# Define colors
	local LIGHTGRAY="\033[0;37m"
	local WHITE="\033[1;37m"
	local BLACK="\033[0;30m"
	local DARKGRAY="\033[1;30m"
	local RED="\033[0;31m"
	local LIGHTRED="\033[1;31m"
	local GREEN="\033[0;32m"
	local LIGHTGREEN="\033[1;32m"
	local BROWN="\033[0;33m"
	local YELLOW="\033[1;33m"
	local BLUE="\033[0;34m"
	local LIGHTBLUE="\033[1;34m"
	local MAGENTA="\033[0;35m"
	local LIGHTMAGENTA="\033[1;35m"
	local CYAN="\033[0;36m"
	local LIGHTCYAN="\033[1;36m"
	local NOCOLOR="\033[0m"


	if [[ $HOSTNAME == "server" ]]; then
		local SERVERCOLOR="\033[0;35m"
	elif [ $HOSTNAME == "digitalocean" ]; then
		local SERVERCOLOR="\033[1;34m"
 	elif [ $HOSTNAME == "dd47608" ]; then
                local SERVERCOLOR="\033[0;36m"
	else
		local  SERVERCOLOR="\033[0;37m"
	fi
	
	
	PS1=""

	PS1+="\[${SERVERCOLOR}\]\u@\h\[${BROWN}\]:\[${BROWN}\]\w"


	if [[ $EUID -ne 0 ]]; then
		PS1+="\[${GREEN}\]$\[${NOCOLOR}\] " # Normal user
	else
		PS1+="\[${RED}\]$\[${NOCOLOR}\] " # Root user
	fi

	# PS3 is used to enter a number choice in a script
	PS3='Please enter a number from above list: '

	# PS4 is used for tracing a script in debug mode
	PS4='\[${DARKGRAY}\]+\[${NOCOLOR}\] '
}
PROMPT_COMMAND='__setprompt'
