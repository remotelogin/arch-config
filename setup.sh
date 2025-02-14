sudo pacman -S xorg-server xorg-xinit xorg-xrandr xorg-xsetroot hdparm emacs awk bc base-devel libx11 libxft libxinerama 
sudo timedatectl set-timezone Europe/Berlin

echo "installed all deps, compile dwm / st manually and then copy your preffered xinit"
