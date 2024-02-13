first=1
second=0
ws_per_monitor=3

monitor=$(hyprctl activeworkspace | grep -E "monitorID: " | sed -e 's/^[ \t]*//')
if [[ $monitor == *"$first"* ]]; then
    if [[ $2 == "move" ]]; then
        hyprctl dispatch movetoworkspace $1
    else
        hyprctl dispatch workspace $1
    fi
elif [[ $monitor == *"$second"* ]]; then
    calc=$(calc "$1 + $ws_per_monitor" | sed -e 's/^[ \t]*//' )
    if [[ $2 == "move" ]]; then
        hyprctl dispatch movetoworkspace $calc
    else
        hyprctl dispatch workspace $calc
    fi
fi