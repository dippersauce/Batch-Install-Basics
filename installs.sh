#!/bin/bash
#Script to install packages automatically. Usefull for rapidly setting up a new installation of Linux.
#v0.5 (Stable)

#Copyright (C) 2014  Austin "MTSnacks" Lasota

#This program is free software; you can redistribute it and/or
#modify it under the terms of the GNU General Public License
#as published by the Free Software Foundation; either version 2
#of the License, or (at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program; if not, write to the Free Software
#Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.






read -p "Do you wish to install from the DEB list or your distros repositories? \n(deb/repo)?" PROMPT
if [ "$PROMPT" == "deb" ]; then
  printf "Installing from DEB list.\n";
  printf "WARNING: if your listed .deb files do not have an\n online repository, those package won't be updated!\n"
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
  printf "Installing packages from the repositories.";
#pull an update to ensure we have the most recent package lists.
        sudo apt-get update
  
#some packages may require additional PPAs, they can be added here.
  ppa="
ppa:example/ppa
"

#pull another update
        sudo apt-get update

#add each ppa from the array with the "yes" flag.
        sudo add-apt-repository $ppa -y

#pull another update.
        sudo apt-get update
  
#Place the name of the package you wish to install here.
#(ie. "gimp" or "vlc")
packages="
	example
	example2
	example3
	example4
	example5
         "

#install each app from the array with "yes" flag.

	apt-get install $packages -y 
  
fi

printf "Package installation has finished."
sleep 5
