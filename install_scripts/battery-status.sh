#!/bin/bash

while true
do
  battery_level=`acpi -b | grep "Char"| grep -P -o '[0-9]+(?=%)'`
   if [ $battery_level -ge 85 ]; then
      notify-send "Battery Full" "Level: ${battery_level}%"
      paplay /usr/share/sounds/ubuntu/notifications/Positive.ogg
   fi
 sleep 120
done
