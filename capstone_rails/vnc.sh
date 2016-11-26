#!/bin/bash

set -x

# Remove VNC lock (if process already killed)
rm -f /tmp/.X0-lock /tmp/.X11-unix/X0

# set the VNC password using a value from environment
#echo VNC_PASSWORD=${VNC_PASSWORD}
printf "${VNC_PASSWORD}\n${VNC_PASSWORD}\n" | vncpasswd

# Run VNC server
vncserver :0 -geometry 1280x800 -depth 24

#uncomment to debug or to keep VM running
#tail -F /root/.vnc/*.log
