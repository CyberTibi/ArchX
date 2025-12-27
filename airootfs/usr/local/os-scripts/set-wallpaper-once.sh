#!/bin/bash

# Monitor azonosítók kinyerése és háttérkép beállítása minden monitorra
for monitor in $(/usr/bin/xrandr --current | /usr/bin/grep -w connected | /usr/bin/cut -d" " -f1); do
    /usr/bin/xfconf-query --create -c xfce4-desktop -p "/backdrop/screen0/monitor${monitor}/workspace0/last-image" -t string -s /usr/share/backgrounds/os/dark-nature-3.png
done

# -Az autostart törlése, hogy ne fusson újra
rm /home/$USER/.config/autostart/set-wallpaper-once.desktop
