# prompt
#
# bash prompt with exit status and git branch
#
# https://github.com/linuxCowboy/prompt
#
# color hint:
# 0-black 1-red 2-green 3-brown 4-blue 5-purple 6-cyan 7-white

PS1='\
\[\e[33m\]\! \
\[\e[35m\]\j \
\[\e[34m\]\h:\
${PWD//\//\[\e[1;34m\]/\[\e[0;32m\]}\
\[\e[1;31m\]$(i=$?; ((i)) && echo -n "[$i]"

H=`git symbolic-ref --short HEAD 2>/dev/null`

if [[ $H ]]; then
	W=`git status --porcelain 2>/dev/null`

	if (($? == 128)); then
		echo "\[\e[1;30m\] {$H}"  # in .git/
	else 
		S=`git status 2>/dev/null`

		if [[ ! $W ]]; then
			if [[ $S == *othing\ to\ commit* || $s == *orking*clean* ]]; then
				echo "\[\e[1;36m\] {$H}"  # clean
			else
				echo " -=[Status Error - Check!]=-"
			fi
		else
			[[ $S == *hanges\ to\ be\ committed* ]] && F="I"  # indexed

			[[ $S == *hanges\ not\ staged* || $S == *hanged*not\ updated* ]] && F+="M"  # modified

			[[ $S == *ntracked\ ?iles* ]] && F+="U"  # untracked

			echo "\[\e[1;36m\] {$H} \[\e[1;33m\]$F"
		fi
	fi
fi)\[\e[0;0m\] \$ '

