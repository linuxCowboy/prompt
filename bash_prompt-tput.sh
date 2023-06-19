# prompt
#
# bash prompt with exit status and git head
#
# https://github.com/linuxCowboy/prompt
#
# color hint:
# 0-black 1-red 2-green 3-brown [yellow] 4-blue 5-purple [magenta] 6-cyan 7-white

PS1='$(i=$?
echo -ne "\[$(tput sgr0)\]"
echo -ne "\[$(tput setaf 3)\]\! "  # history
echo -ne "\[$(tput setaf 5)\]\j "  # jobs
echo -ne "\[$(tput setaf 4)\]\h:"  # host
echo -ne "${PWD//\//\[$(tput bold;tput setaf 4)\]/\[$(tput sgr0;tput setaf 2)\]}"
((i)) && echo -n "\[$(tput bold;tput setaf 1)\][$i]"  # exit code

G=`git rev-parse --is-inside-work-tree 2>/dev/null`

if ((! $?)); then
        H=`git symbolic-ref --short --quiet HEAD ||
                git rev-parse --short HEAD`
        F=
        if [[ $G = true ]]; then
                S=`git --no-optional-locks status --porcelain |
                        cut --bytes 1-2`

                echo "$S" |grep -q "^[MTADRCU]"   && F+="I"  # indexed
                echo "$S" |grep -q  "[MTADRCU]\$" && F+="M"  # modified
                [[ $S =~ \? ]]                    && F+="U"  # untracked

                echo -ne "\[$(tput bold;tput setaf 6)\] {$H}\[$(tput setaf 3)\]${F:+ $F}"
        else
                echo -ne "\[$(tput bold;tput setaf 0)\] {$H}"  # in .git/
        fi
fi
sleep 0.1  # fix for bg jobs
echo -ne "\[$(tput sgr0)\] \$ "
)'
