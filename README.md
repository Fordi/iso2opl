# iso2opl

Fork of iso2opl, taken from the Open Ps2 Loader repo. It has a better makefile in order to build succesfully.

This repo will also host a cross-platform GUI app for managing a PS2 USB/SD drive on Windows, Mac and Linux.

Build
=====

Just clone the repository using something like (in an empty folder):

git clone https://github.com/arcadenea/iso2opl.git .


then type:

```bash
make
```

If everything goes fine, there will be a new file created named "build/iso2opl".

To install it for everyone on your system:

```bash
sudo make install
```


Usage
=====

Simply put your PS2 USB mass storage device in the computer, mount it and type

```bash
iso2opl /xxxxxx/game.iso /yyyyyyy/massdevice "name of the game" [CD/DVD]
```

If you didn't install, the command will be `build/iso2opl`.

where:
 
/xxxxxx is the path where your game iso exists.
/yyyyyy/massdevice is the path of your mounted USB device (usually something like /media/xxxxx). You can check this out with the command "mount".
"name of the game" is the name that you want to be displayed on Open PS2 Loader. It must have between 3 and 32 characters.
[CD/DVD] It depends if the original media of the game is a CD or a DVD.


Example:

```bash
iso2opl /home/user/game.iso /media/myusbstorage "awesome game" DVD
```