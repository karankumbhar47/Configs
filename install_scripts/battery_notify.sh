#!/bin/bash

# Define the notification function
notify() {
    local level=$1
    local message="Battery level is ${level}%"
    notify-send "Battery Notification" "$message"
    # Play a notification sound
    aplay /usr/share/sounds/freedesktop/stereo/message.oga
}

while true; do
    # Get the current battery level
    battery_level=$(acpi -b | grep -P -o '[0-9]+(?=%)')

    # Ensure battery_level is a number
    if [[ "$battery_level" =~ ^[0-9]+$ ]]; then
        # Check if the battery level is 25% or 85%
        if [[ "$battery_level" -eq 25 ]] || [[ "$battery_level" -eq 85 ]]; then
            notify $battery_level
        fi
    fi

    # Sleep for 60 seconds before checking again
    sleep 60
done
