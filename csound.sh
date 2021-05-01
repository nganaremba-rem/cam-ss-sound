red="\e[1;91m"
green="\e[1;92m"
white="\e[0m"
loc="/system/product/media/audio/ui"
su -v
if [ "$?" -ne "0" ]; then
  echo -e "${red}*** No root permission ***${white}"
  exit
else
  echo -e "Root Permission-> ${green} OK ${white}"
fi
if [ -e "$loc/camera_click.ogg" ]; then
  su -c mv $loc/camera_click.ogg $loc/cam
  echo -e "Camera & Screenshot sound -> ${red} OFF"
else
  su -c mv $loc/cam $loc/camera_click.ogg
  echo -e "Camera & Screenshot sound -> ${green} ON"
fi
echo "-------------------------"
ls --color $loc | grep cam
echo "-------------------------"
