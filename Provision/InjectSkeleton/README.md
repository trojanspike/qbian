# qbian-c9 : 


#### A place to give users info



### qbian cli instructions



```bash
$ qbian --create-default # let it be created
$ qbian --run-img default 5522 # log in & run the provision script , once complete halt the machine

$ qbian --skel qbian # create a skel called qbian , this can be edited by you for the auto provisioning and conf
# not that the qbain.conf params will be available in the root provision script.
$ qbain --create-img qbian "-redir tcp:8080::8080" 2G default # See cli commands for reference
# Note the proviison script should auto run if you've used the default image.

$ qbain --run-img qbian 5522 # launch the image in the qemu emulator and access through port:5522 as ssh port
$ qbian --ssh "root@127.0.0.1 -p 5522"
```


### Download preconfigured info
