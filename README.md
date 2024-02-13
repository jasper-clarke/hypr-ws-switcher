# hypr-ws-switcher
A super simple workspace switching script for those with multiple monitors.

## Usage
Place the script anywhere and change the `first` and `second` variables to the ID's of your monitors in `hyprctl monitors`.
Then change `ws_per_monitor` to the amount of workspaces you have set for each monitor.

As an example if you have 3 monitors per workspace your hyprland config your look something like this:
```conf
workspace = 1, monitor:DP-2, default:true
workspace = 2, monitor:DP-2
workspace = 3, monitor:DP-2

workspace = 4, monitor:DP-1
workspace = 5, monitor:DP-1
workspace = 6, monitor:DP-1
```
Now just set your binds up like below. *In the example below the script was added the the path as `ws-switch`*

*Use the second argument `switch` for changing to the workspace and use `move` to move the active window to that workspace.*
```conf
bind = SUPER, 1, exec, ws-switch 1 switch
bind = SUPER, 2, exec, ws-switch 2 switch
bind = SUPER, 3, exec, ws-switch 3 switch

bind = SUPER SHIFT, 1, exec, ws-switch 1 move
bind = SUPER SHIFT, 2, exec, ws-switch 2 move
bind = SUPER SHIFT, 3, exec, ws-switch 3 move
```

If you have more than 3 workspaces per monitor than just simply increase the amount of, binds, workspaces and the `ws_per_monitor` variable. And simply do the inverse if you have less workspaces per monitor assigned.

## More About

The script works by detecting the monitor assigned to your active workspace and then depending on what monitor it is, it multiply the workspace number to match the assigned one and then dispatch the monitor.
