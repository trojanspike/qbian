#!/usr/bin/env bash
# Others
# >> /boot/config.txt, /boot/cmdline.txt

NAME=$1
INJECT=$2
RESIZE=0M
if [ ! -z $3 ]; then
	RESIZE=$3
fi

if [ -z "$BASE_IMAGE" ]; then
	# QBIAN_DISK_DIR = QBIAN_MINIBIAN_DIR
	BASE_IMAGE=$QBIAN_DISK_DIR/2015-02-18-wheezy-minibian.img
fi

if [ "$(whoami)" != "root" ]; then
	echo ""
	# echo "Please run as root/sudo"
	# exit 1
fi

if [ -d $QBIAN_DISK_DIR/$NAME/root_mount ]; then
	sudo rm -Rf $QBIAN_DISK_DIR/$NAME/root_mount
fi
if [ -d $QBIAN_DISK_DIR/$NAME/root ]; then
	sudo rm -Rf $QBIAN_DISK_DIR/$NAME/root
fi

function sleep3(){
	sleep 3
}
function getMinibian(){
	# curl -L $( cat $QBIAN_MINIBIAN_DIR/BASE_IMAGE_TAR_URL | sed -n 1p ) -o $QBIAN_MINIBIAN_DIR/minibian.gz.tar && \
	# Use image defined in the qbian.conf file
	curl -L $minibain_img_url -o $QBIAN_DISK_DIR/minibian.gz.tar && \
	tar -zxvf $QBIAN_DISK_DIR/minibian.gz.tar -C $QBIAN_DISK_DIR && unlink $QBIAN_DISK_DIR/minibian.gz.tar
}

function ensureUmount(){
# TODO -> mount | grep {for mapper/loop* & umount if found
mount | grep "/dev/mapper/loop0p1 on" > /dev/null
if [ $? -eq 0 ]
then
	sudo umount /dev/mapper/loop0p1
fi

mount | grep "/dev/mapper/loop0p2 on" > /dev/null
if [ $? -eq 0 ]
then
	sudo umount /dev/mapper/loop0p2
fi
}
function finish(){
	echo -e "FINISHED :: ";
}


function doProvision(){
	cd $QBIAN_DISK_DIR/$NAME && \
	# tar -zxvf $QBIAN_MINIBIAN_DIR/minibian.gz.tar -C $QBIAN_DISK_DIR/$NAME && \
	rsync -avz $BASE_IMAGE $QBIAN_DISK_DIR/$NAME && \
	# unlink $QBIAN_MINIBIAN_DIR/minibian.gz.tar && \
	## >>>>>>>>>>>>>>>>> $2 ?
 # Need to be within the directory for kpartx to mount and umount without errors
	qemu-img resize $QBIAN_DISK_DIR/$NAME/2015-02-18-wheezy-minibian.img +$RESIZE && ensureUmount && sudo sync && \
	## kpartx1
	sudo kpartx -va ./2015-02-18-wheezy-minibian.img && sleep3 && \
	##################
	# Mount root
	mkdir -p $QBIAN_DISK_DIR/$NAME/{root_mount,root} && \
## @ sudo mount /dev/mapper/loop0p1 $QBIAN_DISK_DIR/$NAME/root_mount/etc/boot/ && -> mount boot /root_mount/etc/boot/ ??
	sudo mount /dev/mapper/loop0p2 $QBIAN_DISK_DIR/$NAME/root_mount && sleep3 && \
	# Skel
	sudo echo "$NAME" > $INJECT/root/release && \
	sudo rsync -avz $INJECT/* $QBIAN_DISK_DIR/$NAME/root_mount/ && \
	## No need to inject the ssh keys	
	# sudo rsync -avz $SSH/* $QBIAN_DISK_DIR/$NAME/root_mount/etc/skel/.ssh/ && \
	# sudo rsync -avz $SSH/* $QBIAN_DISK_DIR/$NAME/root_mount/root/.ssh/ && \
	##########	
	# Clear out the new image ssh keys , this might be an import from a previously created image
	# i.e $ qbian --create-img docker "-redir tcp:1374::1374" ~/path/to/inject/ 400M default
	sudo chown -R root:root $QBIAN_DISK_DIR/$NAME/root_mount/* && \
	# Provision executable
	sudo chmod +x $QBIAN_DISK_DIR/$NAME/root_mount/root/Provision.sh &&  \
	#
	sudo rsync -avz $QBIAN_DISK_DIR/$NAME/root_mount/* $QBIAN_DISK_DIR/$NAME/root/ && \
	sudo umount $QBIAN_DISK_DIR/$NAME/root_mount/ && sleep3 \
	# kpartx2
	sudo kpartx -vd ./2015-02-18-wheezy-minibian.img && ensureUmount && sudo sync && \
	# Wait
fdisk $QBIAN_DISK_DIR/$NAME/2015-02-18-wheezy-minibian.img <<EFO
d

n




w

EFO
	# kpartx1
	sudo kpartx -va ./2015-02-18-wheezy-minibian.img && sleep3 && \
	# Wait
	sudo mkfs.ext4 /dev/mapper/loop0p2 && \
	sudo mount /dev/mapper/loop0p2 $QBIAN_DISK_DIR/$NAME/root_mount && sleep3 && \
	sudo rsync -avz $QBIAN_DISK_DIR/$NAME/root/* $QBIAN_DISK_DIR/$NAME/root_mount/ && \
	sudo umount $QBIAN_DISK_DIR/$NAME/root_mount && sleep3 && \
	# kpartx2
	sudo kpartx -vd ./2015-02-18-wheezy-minibian.img && ensureUmount && sudo sync && sudo rm -Rf $QBIAN_DISK_DIR/$NAME/{root_mount,root} && finish
}
# Start
if [ -f "$QBIAN_DISK_DIR/2015-02-18-wheezy-minibian.img" ]; then
	doProvision && finish
else
	# cp , minibian.img > /$2
	getMinibian && doProvision && finish
fi

#############################################################################################
# fallocate -l 2.7G minibian-disk.img &&
# Provision = user / root home ??
exit 0
