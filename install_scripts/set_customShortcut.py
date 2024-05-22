# #!/usr/bin/env python3

# import subprocess
# import sys

# # defining keys & strings to be used
# key = "org.gnome.settings-daemon.plugins.media-keys custom-keybindings"
# subkey1 = "org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:"
# item_s = "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/"
# firstname = "custom_"
# # subkey1 = key.replace(" ", ".")[:-1]+":"
# # item_s = "/"+key.replace(" ", "/").replace(".", "/")+"/"


# # get the current list of custom shortcuts
# get = lambda cmd: subprocess.check_output(["/bin/bash", "-c", cmd]).decode("utf-8")
# array_str = get("gsettings get "+key)


# # in case the array was empty, remove the annotation hints
# command_result = array_str.lstrip("@as")
# current = eval(command_result)


# # make sure the additional keybinding mention is no duplicate
# n = 1
# while True:
#     new = item_s+firstname+str(n)+"/"
#     if new in current:
#         n = n+1
#     else:
#         break


# # add the new keybinding to the list
# current.append(new)

# # create the shortcut, set the name, command and shortcut key
# cmd0 = 'gsettings set '+key+' "'+str(current)+'"'
# cmd1 = 'gsettings set '+subkey1+new+" name '"+sys.argv[1]+"'"
# cmd2 = 'gsettings set '+subkey1+new+" command '"+sys.argv[2]+"'"
# cmd3 = 'gsettings set '+subkey1+new+" binding '"+sys.argv[3]+"'"

# for cmd in [cmd0, cmd1, cmd2, cmd3]:
#     subprocess.call(["/bin/bash", "-c", cmd])



#!/usr/bin/env python3

import subprocess
import sys

# Define keys and strings
key = "org.gnome.settings-daemon.plugins.media-keys custom-keybindings"
# subkey1 = "org.gnome.settings-daemon.plugins.media-keys.custom-keybindings:"
# item_s = "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/"
subkey1 = key.replace(" ", ".")[:-1]+":"
item_s = "/"+key.replace(" ", "/").replace(".", "/")+"/"
firstname = "custom"




# Get the current list of custom shortcuts
array_str = subprocess.check_output(["/bin/bash", "-c", "gsettings get " + key]).decode("utf-8")
current = eval(array_str.lstrip("@as"))

# Check if the combination of command and shortcut is unique
def is_combination_unique():
    for existing in current:
        existing_cmd = subprocess.check_output(
            ["/bin/bash", "-c", f"gsettings get {existing} command"]
        ).decode("utf-8").strip()
        existing_binding = subprocess.check_output(
            ["/bin/bash", "-c", f"gsettings get {existing} binding"]
        ).decode("utf-8").strip()

        if existing_cmd == sys.argv[2] and existing_binding == sys.argv[3]:
            return False

    return True

# Find a unique new keybinding
n = 1
while (new := item_s + firstname + str(n) + "/") in current or not is_combination_unique():
    n += 1
    print(f"Searching for a unique keybinding... Current: {new}")

# Create the shortcut, set the name, command, and shortcut key
cmds = [
    f'gsettings set {key} "{str(current + [new])}"',
    f'gsettings set {subkey1}{new} name "{sys.argv[1]}"',
    f'gsettings set {subkey1}{new} command "{sys.argv[2]}"',
    f'gsettings set {subkey1}{new} binding "{sys.argv[3]}"'
]

for cmd in cmds:
    subprocess.call(["/bin/bash", "-c", cmd])
    print(f"Executed: {cmd}")