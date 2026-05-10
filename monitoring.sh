  GNU nano 8.4                                                    monitoring.sh                                                             
#!/usr/bin/env bash

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

text=$(date)
str=$(strcenter "${text}" 78)
echo ""
echo "╒══════════════════════════════════════════════════════════════════════════════╕"
echo "│${str}│"

echo "╞══════════════════════════════════════════════════════════════════════════════╡"
text="Operating sytem"
str=$(strcenter "${text}" 78)
echo "│${str}│"

echo "├──────────────────────────────────────┬┬──────────────────────────────────────┤"
text="Architecture : $(uname -m)"
str1=$(strcenter "${text}" 38)
text="Kernel : $(uname -s)"
str2=$(strcenter "${text}" 38)
echo "│${str1}││${str2}│"

echo "├──────────────────────────────────────┴┴──────────────────────────────────────┤"
text="Version : $(uname -r)"
str=$(strcenter "${text}" 78)
echo "│${str}│"

echo "╞══════════════════════════════════════╤╤══════════════════════════════════════╡"
text="Hostname: $(hostname)"
str1=$(strcenter "${text}" 38)
ipv4=$(arg 1 $(hostname -I))
text="IP V4 : $ipv4"
str2=$(strcenter "${text}" 38)
echo "│${str1}││${str2}│"

echo "╞══════════════════════════════════════╪╪══════════════════════════════════════╡"
nbsocket=$(arg 2 $(lscpu | grep "^Socket(s)"))
nbcore=$(arg 4 $(lscpu | grep "^Core(s)"))
nbpcpu=$((nbsocket*nbcore))
text="Number of physical processors: $nbpcpu"
str1=$(strcenter "${text}" 38)
nbvcpu=$(arg 2 $(lscpu | grep "^CPU(s)"))
text="Number of virtual processors: $nbvcpu"
str2=$(strcenter "${text}" 38)
echo "│${str1}││${str2}│"

echo "╞══════════════════════════════════════╪╪══════════════════════════════════════╡"
ramavaible=$(arg 7 $(free -h | grep "^Mem"))
text="Currently available RAM: ${ramavaible}"
str1=$(strcenter "${text}" 38)
ramused=$(arg 3 $(free | grep "^Mem"))
ramtotal=$(arg 2 $(free | grep "^Mem"))
ramusedpourcent=$((100*ramused/ramtotal))
text="Utilization rate: ${ramusedpourcent}%"
str2=$(strcenter "${text}" 38)
echo "│${str1}││${str2}│"

echo "╞══════════════════════════════════════╪╪══════════════════════════════════════╡"
storageavaible=$(arg 2 $(df -h / | grep "^/"))
text="Currently available storage: ${storageavaible}"
str1=$(strcenter "${text}" 38)
storageused=$(arg 5 $(df -h / | grep "^/"))
text="Utilization rate: ${storageused}"
str2=$(strcenter "${text}" 38)
echo "│${str1}││${str2}│"

echo "╘══════════════════════════════════════════════════════════════════════════════╛"
echo ""



echo "Uptime: $(uptime -p)"
echo "CPU Load: $(uptime | awk -F'load average:' '{print $2}')"
echo ""
