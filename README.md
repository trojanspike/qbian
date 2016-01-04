# (qbian) qemu + minibian :: qbian

v 0.1.0

#### A cli tool-set to help create & provision minibian images

* Run on linux or vagrant VM linix machine ( TO BE COMPLETE )
* Uses kpartx for mounting the *.img and editing with a provision script
* Uses qemu for emulation of the arm image.
* Toolset will be extended over time. i.e create new images & config with custom provisions.
* Automated provisioning & easy replication with imports & exports.
* I just created this for myself & it's not perfect. People are more than welcome to use it, make changes & improve it.

![Splash](https://raw.githubusercontent.com/trojanspike/qbian/images/qbian-raspflash.jpg "Splash image")

#### Envoironments Available:
[ qbain cloud 9 IDE interface ](https://github.com/trojanspike/qbian/tree/dev/c9/injects/qbian-c9)

_Add the cli into your bin_
```bash
$ git clone -b {release} {url}
$ ln -f /path/to/qbain/package/bin/qbain ~/bin/qbain
```

#### _Quick example_

---
```bash
$ qbain --create-default # creates a default image, uses the injects/default folder as injects
$ qbian --run-img default 5522 # run the default image, uses port 5522 to ssh
# After you create and the default image you can login using
$ ssh root@127.0.0.1 -p 5522 # OR if you have ssh configed to only allow ssh
$ qbain --ssh "root@127.0.0.1 -p 5522"
# At root home directory there'll be a Provision file to run
$ ./Provision.sh # all done halt image
# create a new image based on the default updated img
$ qbian --create-img updated "-redir tcp:8080::8080" 1G default # create new images using the default img, Injects/updated folder required
$ qbian --list # list the images
# Use an already configured provion i.e "example" one I've created
$ qbian --create-img example "-redir tcp:1374::1374 -redir tcp:8080::8080" 1G
# The example provision script will take a little while to complete. Add a user & password perdefined. add nvm & iojs with forever to run node. Add a quick express server & runs this at start up.
# Push to sd card - fdisk -l :: /dev/sdc < sd card >
$ qbian --export example /dev/sdc
# Now you can run on your device
```

![Running on qemu](/../images/run-img.png?raw=true "Running on qemu")
![cli help](/../images/help.png?raw=true "cli help")

#### _cli commands_
* --help { 0 args } Show help
* --create-default { 0 args } Create the default image
* --run-img { 2 args } [ image-name , ssh-port ] Run an image in qemu
* --run-sd { 2 arg } [ sd-path, ssh-port ] Run an sd image in qemu
* --skel { 1 arg } [ skel-name ] Create a new empty skel with necessary files
* --list { 0 args } List available images
* --remove { 2 arg } [ image-name, remove-skel{bool,optional} ] Remove an image
* --clear { 0 args } Remove all images
* --export { 2 args } [ image-name , path{ sd-card , image-path } ] Export an image
* --import { 2 args } [ path{ sd-card , image-path } , image-name ] Import an image
* --ssh { 1 arg } [ ssh-options ] Use ssh key.

note :
  To use the provision image I made you just need to edit file /Provision/minibian/BASE_IMAGE_TAR_URL,
  take note that the format needs to be tar.gz & image inside called 2015-02-18-wheezy-minibian.img

---

#### Possible Environments : TODO
* qbian-base : base for image for env's
* qbian-c9   : cloud9 IDE
* qbian-kodi : Kodi player with user auto login to kodi
* qbian-lightdm	:	debian display manager

#### Known issues
* When kpartx is ran it might auto mount which will cause the cli to exit on an error.

#### TODO:

- [ ] Output stdout to log file /imageName/output.log
- [ ] Output stderr to log file /imageName/error.log # hopefully none
- [ ] Quiet down with minibian-qemu.sh script , clear , echo info to user & put to log file
- [ ] Checks folder and files are avail , else either create or error out
- [ ] Error Checks in /bin/qbain
- [ ] Make tar minibian file configurable with a config file
