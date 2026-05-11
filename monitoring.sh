  GNU nano 8.4                                                    monitoring.sh                                                             
#!/usr/bin/env bash

color_reset="\e[0m"
color_frame="\e[0;34;46m"
color_content="\e[1;33;44m"
sp="                                                                                "
hd="════════════════════════════════════════════════════════════════════════════════"
vs="│"

disp_first_line() {
    local width="$1"
    echo -e "${color_frame}╒${hd:0:width - 2}╕${color_reset}"
}

disp_last_line() {
    local width="$1"
    echo -e "${color_frame}╘${hd:0:width - 2}╛${color_reset}"
}

disp_title() {
    local text="$1"
    local width="$2"
    local len=${#text}
    local pr=$((width-len-7))
    if (( len > width - 8 )); then
        echo "${text:0:width - 8}"
    fi
    echo -e "${color_frame}╞${hd:0:3}╡${text}╞${hd:0:pr}╡${color_reset}"
}

disp_content() {
    local text="$1"
    local width="$2"
    local len=${#text}
    if (( len > width - 2 )); then
        text=${text:0:max - 2}
    fi
    echo -e "${color_frame}${vs}${color_content}${text}${color_frame}${vs}${color_reset}"
}

strcenter() {
    local text="$1"
    local max="$2"
    local psp="                                        "
    local len=${#text}
    local pl=$(((max-len)/2))
    local pr=$((pl+(max-len)%2))

    if (( len > max )); then
        echo "${text:0:max}"
    else
        echo "${psp:0:pl}${text}${psp:0:pr}"
    fi
}

arg() {
    local a=$(($1+1))
    echo ${!a}
}

#echo "╒══════════════════════════════════════════════════════════════════════════════╕"
#echo "│                                                                              │"
#echo "╞══════════════════════════════════════════════════════════════════════════════╡"
#echo "├──────────────────────────────────────────────────────────────────────────────┤"
#echo "│                                                                              │"
#echo "╘══════════════════════════════════════════════════════════════════════════════╛"
#echo "╔═╦╗ ┌─┬┐ ╒═╤╕ ╓─╥╖"
#echo "╠═╬╣ ├─┼┤ ╞═╪╡ ╟─╫╢"
#echo "╚═╩╝ └─┴┘ ╘═╧╛ ╙─╨╜"

echo ""
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
echo "░                                                                              ░"
echo "░                               ____________/\\\\\\_______/\\\\\\\\\\\\\\\\\\_____         ░"
echo "░       ▒▒▒               ▒▒▒    __________/\\\\\\\\\\_____/\\\\\\///////\\\\\\___        ░"
echo "░          ▒▒▒         ▒▒▒        ________/\\\\\\/\\\\\\____\\///______\\//\\\\\\__       ░"
echo "░       ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒      ______/\\\\\\/\\/\\\\\\______________/\\\\\\/___      ░"
echo "░    ▒▒▒▒▒▒   ▒▒▒▒▒▒▒▒▒   ▒▒▒▒▒▒    ____/\\\\\\/__\\/\\\\\\___________/\\\\\\//_____     ░"
echo "░ ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  __/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_____/\\\\\\//________    ░"
echo "░ ▒▒▒   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒   ▒▒▒   _\\///////////\\\\\\//____/\\\\\\/___________   ░"
echo "░ ▒▒▒   ▒▒▒               ▒▒▒   ▒▒▒    ___________\\/\\\\\\_____/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_  ░"
echo "░          ▒▒▒▒▒▒   ▒▒▒▒▒▒              ___________\\///_____\\///////////////__ ░"
echo "░                                                                              ░"
echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"

echo ""
disp_first_line 80

# Display Date and Time
text=$(date)
str=$(strcenter "${text}" 78)
disp_content "${str}" 80

# Display OS informations
disp_title "Operating sytem" 80

text="Architecture : $(uname -m)"
str1=$(strcenter "${text}" 39)
text="Kernel : $(uname -s)"
str2=$(strcenter "${text}" 39)
disp_content "${str1}${str2}" 80

text="Version : $(uname -r)"
str=$(strcenter "${text}" 78)
disp_content "${str}" 80

# Display Network informations
disp_title "Network" 80

text="Hostname: $(hostname)"
str=$(strcenter "${text}" 78)
disp_content "${str}" 80

ipv4=$(arg 1 $(hostname -I))
text="IP V4 : $ipv4"
str1=$(strcenter "${text}" 39)
mac=$(arg 1 $(hostname -I))
text="MAC Addresse : $ipv4"
str2=$(strcenter "${text}" 39)
disp_content "${str1}${str2}" 80

# Display CPUs informations
disp_title "CPUs" 80

nbsocket=$(arg 2 $(lscpu | grep "^Socket(s)"))
nbcore=$(arg 4 $(lscpu | grep "^Core(s)"))
nbpcpu=$((nbsocket*nbcore))
text="Number of physical processors: $nbpcpu"
str1=$(strcenter "${text}" 39)
nbvcpu=$(arg 2 $(lscpu | grep "^CPU(s)"))
text="Number of virtual processors: $nbvcpu"
str2=$(strcenter "${text}" 39)
disp_content "${str1}${str2}" 80

# Display RAM informations
disp_title "RAM" 80

ramavaible=$(arg 7 $(free -h | grep "^Mem"))
text="Currently available RAM: ${ramavaible}"
str1=$(strcenter "${text}" 39)
ramused=$(arg 3 $(free | grep "^Mem"))
ramtotal=$(arg 2 $(free | grep "^Mem"))
ramusedpourcent=$((100*ramused/ramtotal))
text="Utilization rate: ${ramusedpourcent}%"
str2=$(strcenter "${text}" 39)
disp_content "${str1}${str2}" 80

# Display RAM informations
disp_title "Storage" 80

storageavaible=$(arg 2 $(df -h / | grep "^/"))
text="Currently available storage: ${storageavaible}"
str1=$(strcenter "${text}" 39)
storageused=$(arg 5 $(df -h / | grep "^/"))
text="Utilization rate: ${storageused}"
str2=$(strcenter "${text}" 39)
disp_content "${str1}${str2}" 80

disp_last_line 80
echo ""



echo "Uptime: $(uptime -p)"
echo "CPU Load: $(uptime | awk -F'load average:' '{print $2}')"
echo ""
