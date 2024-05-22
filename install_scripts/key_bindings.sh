##!/bin/bash

# Define an array of strings (each string contains "Name:Command:Shortcut")
shortcuts=(
    "Open Firefox       :firefox        :<Super>b       "
    "Open VS code       :code           :<Super><Shift>v"
    "Open Android Studio:android-studio :<Super><Shift>a"
    "Open Qutebrowser   :qutebrowser    :<Super><Shift>b"
    "Open Gimp          :gimp           :<Super><Shift>g"
)

# Path to the Python script
script_path="/home/$USER/Templates/ubuntu_configFiles/.myScript/set_customShortcut.py"

# Iterate through the array
for entry in "${shortcuts[@]}"; do
    IFS=':' read -r arg1 arg2 arg3 <<< "$entry"

    # Trim leading and trailing spaces from arg3 (Shortcut)
    arg1="$(echo -e "${arg1}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
    arg2="$(echo -e "${arg2}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
    arg3="$(echo -e "${arg3}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"


    # echo -e "$arg1 $arg2 $arg3"    
    python3 "$script_path" "$arg1" "$arg2" "$arg3"
done
