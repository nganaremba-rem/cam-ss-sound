red="\e[1;91m"
green="\e[1;92m"
white="\e[0m"
loc="/system/product/media/audio/ui"
su -v &> /dev/null
if [ "$?" -ne "0" ]; then
  echo -e "${red}*** No root permission ***${white}"
  exit
else
  echo -e "Root Permission-> ${green} OK ${white}"
  su -c mount -o remount,rw /
fi
if [ -e "$loc/camera_click.ogg" ]; then
  su -c mv $loc/camera_click.ogg $loc/cam
  echo -e "Camera & Screenshot sound -> ${red} OFF ${white}"
else
  su -c mv $loc/cam $loc/camera_click.ogg
  echo -e "Camera & Screenshot sound -> ${green} ON ${white}"
fi
su -c mount -o remount,ro /
echo "-------------------------"
ls --color $loc | grep cam
echo "-------------------------"
