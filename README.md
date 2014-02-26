# Bash Batch Install Basics

An example bash script to install all your essential basics on a fresh Ubuntu install. Useful for rapidly setting up a LAMP stack on a VM or server, or installing all your essentials on a new machine.

First open the ```installs.sh``` file in a text editor, take a look at the array of apps, you can add or edit the list according to your needs.

Below the array it runs ```apt-get install``` on each one, so make sure the string you enter is the proper name of the package. The ```-y``` flag automatically says 'YES' to 'Are you sure you wish to install X?' to save you having to watch the script and wait to confirm each one.

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


