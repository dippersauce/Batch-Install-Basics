#!/bin/bash
#Script to allow user to install packages automatically.
#v0.3 (Beta)
#Whats new:
#added the ability to add ppa repositories.
#script can now detect architecture and adapt accordingly.


#eventually this will be used to properly choose whic deb files to fetch.
#WARNING: if your installed .deb file has no online repository that package won't be updated. 
#MACHINE_TYPE=`uname -m`
#if [ ${MACHINE_TYPE} == 'x86_64' ]; then
#  local arch=64
#else
#  local arch=32
#fi

read -p "Do you wish to install from the DEB list or your distros repositories?" answer
if [[ $answer = y ]] ; then
  # run the command
fi

#pull an update to ensure we have the most up-to-date package lists. 
        apt-get update

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
	

URL='http://path.to/my.deb'; FILE=`mktemp`; wget "$URL" -qO $FILE && sudo dpkg -i $FILE; rm $FILE

echo Package installation has finished.
