#!/usr/bin/env bash
# Set the number of your first/main monitor, find it under `hyrpctl monitors` then find your monitor and it is the ID: value at the top.
first=1 
# Set the number of your secondary monitor
second=0
# Set the number of your third monitor
# third=2

# Set the number of workspaces per screen
ws_per_monitor=3


monitor=$(hyprctl activeworkspace | grep -E "monitorID: " | sed -e 's/^[ \t]*//')
if [[ $monitor == *"$first"* ]]; then
    if [[ $2 == "move" ]]; then
        hyprctl dispatch movetoworkspace $1
    else
        hyprctl dispatch workspace $1
    fi
elif [[ $monitor == *"$second"* ]]; then
    calc=$(($1 + $ws_per_monitor))
    if [[ $2 == "move" ]]; then
        hyprctl dispatch movetoworkspace $calc
    else
        hyprctl dispatch workspace $calc
    fi
# elif [[ $monitor == *"$third"* ]]; then
#     calc=$(($1 + $ws_per_monitor))
#     if [[ $2 == "move" ]]; then
#         hyprctl dispatch movetoworkspace $calc
#     else
#         hyprctl dispatch workspace $calc
#     fi
fi
