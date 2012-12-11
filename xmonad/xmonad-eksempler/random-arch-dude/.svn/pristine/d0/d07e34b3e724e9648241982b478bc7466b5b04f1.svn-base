#!/bin/zsh
#
# xmonad statusline, (c) 2007 by Robert Manea
#
 
# Configuration
DATE_FORMAT='%A, %d.%m.%Y %H:%M:%S'
TIME_ZONES=(Europe/Berlin )
DZEN_ICONPATH=
 
# Main loop interval in seconds
INTERVAL=1
 
# function calling intervals in seconds
DATEIVAL=1
GTIMEIVAL=60
CPUTEMPIVAL=1
WEATHERIVAL=1800
 
# Functions
fdate() {
    date +$DATE_FORMAT
}
 
fgtime() {
    local i
 
    for i in $TIME_ZONES
        { print -n "${i:t}:" $(TZ=$i date +'%H:%M')' ' }
}
 
fcputemp() {
   print -n CPU: ${(@)$(</proc/acpi/thermal_zone/THM/temperature)[2,3]} "|" 
}
 
# Main
 
# initialize data
DATECOUNTER=$DATEIVAL;MAILCOUNTER=$MAILIVAL;GTIMECOUNTER=$GTIMEIVAL;CPUTEMPCOUNTER=$CPUTEMPIVAL;WEATHERCOUNTER=$WEATHERIVAL
 
while true; do
   if [ $DATECOUNTER -ge $DATEIVAL ]; then
     PDATE=$(fdate)
     DATECOUNTER=0
   fi
 
   if [ $GTIMECOUNTER -ge $GTIMEIVAL ]; then
     PGTIME=$(fgtime)
     GTIMECOUNTER=0
   fi
 
   if [ $CPUTEMPCOUNTER -ge $CPUTEMPIVAL ]; then
     PCPUTEMP=$(fcputemp)
     CPUTEMPCOUNTER=0
   fi
 
   # Arrange and print the status line
   print "$PWEATHER $PCPUTEMP $PGTIME $PMAIL ^fg(white)${PDATE}^fg()"
 
   DATECOUNTER=$((DATECOUNTER+1))
   MAILCOUNTER=$((MAILCOUNTER+1))
   GTIMECOUNTER=$((GTIMECOUNTER+1))
   CPUTEMPCOUNTER=$((CPUTEMPCOUNTER+1))
   sleep $INTERVAL
done
