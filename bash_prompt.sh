# prompt
#
# bash prompt with exit status and git head
#
# https://github.com/linuxCowboy/prompt
#
# color hint:
# 0-black 1-red 2-green 3-brown [yellow] 4-blue 5-purple [magenta] 6-cyan 7-white

PS1='\
\[\e[0m\]\
\[\e[33m\]\! \
\[\e[35m\]\j \
\[\e[34m\]\h:\
${PWD//\//\[\e[1;34m\]/\[\e[0;32m\]}\
\[\e[1;31m\]\
$(i=$?; ((i)) && echo -n "[$i]"

G=`git rev-parse --is-inside-work-tree 2>/dev/null`

if ((! $?)); then
        H=`git symbolic-ref --short --quiet HEAD ||
                git rev-parse --short HEAD`
        F=
        if [[ $G = true ]]; then
                S=`git --no-optional-locks status --porcelain |
                        cut --bytes 1-2`

                echo "$S" |grep -q "^[MTADRCU]"  && F+="I"
                echo "$S" |grep -q "[MTADRCU]\$" && F+="M"
                [[ $S =~ \? ]]                   && F+="U"

                echo -ne "\[\e[1;36m\] {$H}\[\e[1;33m\]${F:+ $F}"
        else
                echo -ne "\[\e[1;30m\] {$H}"  # in .git/
        fi
fi)\
$(sleep 0.1)\
\[\e[0m\] \$ '

