
flash_erase /dev/mtd2 0 40
flash_erase /dev/mtd3 0 976

nandwrite -p /dev/mtd2 /root/uImage

ubiformat /dev/mtd3
ubiattach -p /dev/mtd3
ubimkvol /dev/ubi0 -N rootfs -s 117MiB
ubiupdatevol /dev/ubi0_0 /root/rootfs.ubifs
mount -t ubifs ubi0:rootfs /mnt/

chmod go-r /mnt/etc/ssh/ssh_host_dsa_key /mnt/etc/ssh/ssh_host_ecdsa_key /mnt/etc/ssh/ssh_host_ed25519_key /mnt/etc/ssh/ssh_host_key /mnt/etc/ssh/ssh_host_rsa_key

umount /mnt
ubidetach -p /dev/mtd3
