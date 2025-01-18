#!/bin/bash

# Detectar si HDMI está conectado
if xrandr | grep -q "^HDMI-A-1 connected"; then
    # Configurar HDMI como principal
    xrandr --output HDMI-A-1 --primary --auto --output eDP --off
    i3-msg 'set $m1 HDMI-A-1'
    i3-msg 'set $m2 eDP'
else
    # Configurar pantalla del portátil como principal
    xrandr --output eDP --primary --auto --output HDMI-A-1 --off
    i3-msg 'set $m1 eDP'
    i3-msg 'set $m2 HDMI-A-1'
fi

# Recargar la configuración de i3
i3-msg reload
