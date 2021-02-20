# Prints server info:
# hostname 
# uname -mr - kernel version
# uptime -s - system start time
# uptime  - system uptime
hname=$(hostname)
printf "%-20s %-25s %-25s %-42s %s \n" "${hname}" "$(uname -mr)" "`uptime -s`" "`uptime -p`"
