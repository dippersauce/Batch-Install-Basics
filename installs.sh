#!/bin/bash
#Script to allow user to install packages automatically.
#v0.3 (Beta)
#Whats new:
#added the ability to add ppa repositories.
#script can now detect architecture and adapt accordingly.


#eventually this will be used to properly choose which deb files to fetch.
#WARNING: if your installed .deb file has no online repository that package won't be updated. 
#MACHINE_TYPE=`uname -m`
#if [ ${MACHINE_TYPE} == 'x86_64' ]; then
#  local arch=64
#else
#  local arch=32
#fi


read -p "Do you wish to install from the DEB list or your distros repositories? (deb/repo)?" PROMPT
if [ "$PROMPT" == "deb" ]; then
  printf "Installing from DEB list.\n";
  printf "WARNING: if your listed .deb files do not have an online repository, those package won't be updated!\n"
  sleep 3
  #place the URL path to the DEB package here.
  
  URL='http://path.to/my.deb'; PACKAGE=`mktemp`; wget "$URL" -qO $PACKAGE && sudo dpkg -i $PACKAGE; rm $PACKAGE
  URL='http://path.to/my.deb2'; PACKAGE=`mktemp`; wget "$URL" -qO $PACKAGE && sudo dpkg -i $PACKAGE; rm $PACKAGE
  
else
  printf "Installing from the repositories.";
  #pull an update to ensure we have the most recent package lists.
  apt-get update
  
  #some packages may require additional PPAs, they can be added here.
  ppa="
ppa:tualatrix/ppa
"
#add each ppa from the array with the "yes" flag.
        sudo add-apt-repository $ppa -y

#stack them, makes them easier to read.
packages="
	gimp
	vlc
	chromium-browser
	gparted
	filezilla
	openjdk-7-jre
	ufw
         "

#install each app from the array with "yes" flag.

	apt-get install $packages -y 
  
fi



	

URL='http://path.to/my.deb'; FILE=`mktemp`; wget "$URL" -qO $FILE && sudo dpkg -i $FILE; rm $FILE

printf "Package installation has finished."
