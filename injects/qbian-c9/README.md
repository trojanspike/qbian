# qbian-c9 : Cloud9-ide


#### qbain cloud 9 IDE interface

I created this image to make it easier to develop on the device or qemu virtual machine. Includes the abality for collaboration.
Run on the device as soon as the code is complete instead of having to push | pull | ftp your code over to the device.

Once your code is as you want you can take advantage of the "qbain service" ~/init.sh and run your scripts when the system start/boots.

### qbian cli install
You can create your own using the qbain cli tools set :
Installs NVM (node version magager) with iojs as the default alias :
Package pre-installed : forever , node-gyp , bower
Python2.7 , minicom etc. Please view the Provision script for more info

```bash
& qbian --create-default # run the qemu provision & optional the device provision $ /root/Provision.sh
$ qbian --create-img qbian-c9 "-redir tcp:8080::8080 -redir tcp:1374::1374" 2G default
# this will create the image usable with the qbain cli - when complete
$ qbian --run-img qbian-c9 5522
# note that the image will run the provision script and installed whats needed
# Provisioning will auto run
# When launched you log in and install c9 sdk | ide
$ qbian --ssh "qbain@127.0.0.1 -p 5522"
$ ~/bin/c9-install
# note that this will take a while depending on internet speeds - or not because it is has a lot to do
# Finally enjoy 
## Installer other common software : docker , wifi drivers , pi-blaster : optionals
$ docker-install
$ piblaster-install
$ wifi-install
# Files to edit:
# /etc/network/interface.static : add your network info
# /etc/network/interface.wifi : add your network info
# /etc/wpa_supplicant/wpa_supplicant : add your network's wifi info
# Enable $ cat /etc/network/interface.wifi > /etc/network/interface && sudo service networking restart
# Or you can leave it as dynamic & use ethernet 

# To enable strict SSH access 
# $ sudo unlink /etc/ssh/sshd_config && sudo mv /etc/ssh/_sshd_config /etc/ssh/sshd_config && reboot
```


### Download the alread configure image 
* Download zip from from my aws bucket <https://s3-eu-west-1.amazonaws.com/qbain-images/qbian-cloud9.zip>
* extract files 
* dump the 2015-02-18-wheezy-minibian.img onto a 4GB+ sd card
* insert into your device and start
* Go to your devices IP addr and port 8080 : e.g 192.168.0.1:8080
* you now have access to the cloud 9 IDE. Your sudo permission etc
* enjoy :)

note - you might want to do an update on ~/Server. Just for some examples
```bash
$ cd ~/Server && git pull origin master
```

![Cloud 9 IDE](https://raw.githubusercontent.com/trojanspike/qbian/images/qbian-c9ide.png?raw=true "C9 ide on qemu")
![Node running task](https://raw.githubusercontent.com/trojanspike/qbian/images/qbian-noderun.png?raw=true "node tasks")
