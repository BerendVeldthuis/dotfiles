#!/bin/bash

# system apps
(/bin/numlockx on &)
(/bin/indicator-cpufreq &) # systray to ajust cpu govoneur
(/usr/lib/policykit-1-gnome/polkit-gnome-authentication-agent-1 &) # the polkit
(/usr/bin/nm-applet &) # Wifi icon in systray
(/usr/bin/xfce4-power-manager &) # Power managment

# systray apps/utils
(/bin/solaar -w hide &) # systray for logitech mouse
(/bin/blueman-applet &) # systray icon for blueman
(/home/berend/.local/bin/greenclip daemon &) # start clipboard manager

## audio system
(/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=easyeffects com.github.wwmm.easyeffects &)
(/usr/bin/flatpak run --branch=stable --arch=x86_64 --command=qpwgraph --file-forwarding org.rncbc.qpwgraph @@ @@ &)
