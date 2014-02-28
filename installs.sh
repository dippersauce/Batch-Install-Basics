#!/bin/bash
#Script to allow user to install packages automatically.
#v0.4 (Beta)
#Whats new:
#added the ability to add ppa repositories.
#script can now detect architecture and adapt accordingly.
#script can now fetch deb files from external sources, and download the proper packages for that achitecture.




read -p "Do you wish to install from the DEB list or your distros repositories? (deb/repo)?" PROMPT
if [ "$PROMPT" == "deb" ]; then
  printf "Installing from DEB list.\n";
  printf "WARNING: if your listed .deb files do not have an online repository, those package won't be updated!\n"
  sleep 3
  
MACHINE_ARCH=`uname -m`
if [ ${MACHINE_ARCH} == 'x86_64' ]; then

    URL='http://path.to/my64bit.deb'; PACKAGE=`mktemp`; wget "$URL" -qO $PACKAGE && sudo dpkg -i $PACKAGE; rm $PACKAGE
    URL='http://path.to/my64bit.deb'; PACKAGE=`mktemp`; wget "$URL" -qO $PACKAGE && sudo dpkg -i $PACKAGE; rm $PACKAGE
  
else

    URL='http://path.to/my32bit.deb'; PACKAGE=`mktemp`; wget "$URL" -qO $PACKAGE && sudo dpkg -i $PACKAGE; rm $PACKAGE
    URL='http://path.to/my32bit.deb'; PACKAGE=`mktemp`; wget "$URL" -qO $PACKAGE && sudo dpkg -i $PACKAGE; rm $PACKAGE
    
fi
  
elif [ "$PROMPT" == "repo" ]; then
  printf "Installing from the repositories.";
  #pull an update to ensure we have the most recent package lists.
  apt-get update
  
  #some packages may require additional PPAs, they can be added here.
  ppa="
ppa:example/ppa
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

printf "Package installation has finished."
