Bash-Batch-Install-Basics
=========================

A bash script to install all your essential basics on a fresh Ubuntu install

First open the installs.sh file in a text editor, take a look at the array of apps, you can add or edit the list according to your needs. Below the array it runs 'apt-get install X' on each one, so make sure the string you enter is the proper name of the package. The -y flag automatically says 'YES' to 'Are you sure you wish to install X?' to save you faffing.

Below the installation line there are a few extras - such as installing MySQL as this requires you to set a root password, so I put it towards the end so it can get a lot done before requiring your input. There are a couple of things which I've filled with default values - change these to your own before proceeding.

Once you're happy with what it's going to do, return to the console and make the file executable. You're going to need to be root to execute the file so you may as well do that now:

sudo su
chmod +x installs.sh

Then execute the file (still as root):

./installs.sh

The script will run through all the instructions as if they were typed in to the console with you as root.

Please patch if you notice any problems.

The script should work on other distros such as Fedora - just replace 'apt-get' with 'yum'.
