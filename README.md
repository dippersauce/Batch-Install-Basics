# Bash Install Basics

An example bash script to install all your essential basics on a fresh Ubuntu install. Useful for rapidly setting up a VM or server, or installing all your essentials on a new machine.

First, open the ```installs.sh``` file in a text editor, take a look at the arrays, you can add or edit the lists according to your needs.

Packages can be installed directly from your distro's repositories, however other packages can be installed if you provide the proper PPA's.

PPa's can be added with the PPA array, simply add "ppa:example" to the array to add it to the list.

Deb packages can be downloaded and installed  automatically, all you need is a valid URL to the package. An ifthen is used to separate the 64-bit and 32-bit verion, and install the proper ones.

```
URL='http://path.to/my64bit.deb'; PACKAGE=`mktemp`; wget "$URL" -qO $PACKAGE && sudo dpkg -i $PACKAGE; rm $PACKAGE
```
```
URL='http://path.to/my32bit.deb'; PACKAGE=`mktemp`; wget "$URL" -qO $PACKAGE && sudo dpkg -i $PACKAGE; rm $PACKAGE
```

Once you're happy with what it's going to do, return to the console and make the file executable if it's not already.

```
    chmod +x installs.sh
```

Then become root and execute the file:

```
    sudo su
    ./installs.sh
```

The script will run through all the instructions as if they were typed in to the console with you as root.


