# (qbian) qemu + minibian :: qbian

#### A cli tool-set to help create & provision minibian images

* Run on linux or vagrant VM linix machine ( TO BE COMPLETE )
* Uses kpartx for mounting the *.img and editing with a provision script
* Uses qemu for emulation of the arm image.
* Toolset will be extended over time. i.e create new images & config with custom proviisions.

_Add the cli into your bin_
```bash
$ git clone -b {release} {url}
$ ln -f /path/to/qbain/package/bin/qbain ~/bin/qbain
```

![Running on qemu](/../images/run-img.png?raw=true "Running on qemu")
![Running on qemu](https://raw.githubusercontent.com/trojanspike/qbian/images/run-img.png)


#### _Quick example_

---
```bash
$ qbain --create-default # creates a default image, uses the injects/default folder as injects
$ qbian --run default 5522 # run the default image, uses port 5522 to ssh
$ qbian --list # List the available images to run
```
_After you create the default image you can login using_ :
```bash
$ ssh root@127.0.0.1 -p 5522
```
_At root home directory there'll be a Provision file to run_ :
```bash
$ ./Provision.sh
```
_create a new image based on the default img updated_
```bash
$ qbian --create-img updated "-redir tcp:8080::8080" 1G default # create new images using the default img, Injects/updated folder required
$ qbian --remove default # delete an image
```

_The provision script will take a little while to complete. Add a user & password perdefined. add nvm & iojs with forever to run node. Add a quick express server & runs this at start up._

#### note :

* ~/bin/rpi-serial-console needs to be ran on a device because /boot/cmdline.txt is not on the qemu boot directory.

* ~/bin/i2cdetect also cannot be ran from the qemu env because there is no i2c attached.
---

#### TODO:

* Output stdout to log file /imageName/output.log
* Output stderr to log file /imageName/error.log # hopefully none
* Quiet down with minibian-qemu.sh scritp , clear , echo info to user & put to log file
* Checks folder and files are avail , else either create or error out
* Error Checks in /bin/qbain 
