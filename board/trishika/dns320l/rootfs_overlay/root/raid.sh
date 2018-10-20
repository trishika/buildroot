
# Only is reusing disk
#mdadm --zero-superblock /dev/sda
#mdadm --zero-superblock /dev/sdb

sgdisk -n 1:2048:5858485101 /dev/sda
sgdisk -n 1:2048:5858485101 /dev/sdb

mdadm --create /dev/md0 --level=1 --assume-clean --raid-devices=2 /dev/sda1 /dev/sdb1
cat /proc/mdstat
mdadm --detail --scan >> /etc/mdadm.conf
cat /etc/mdadm.conf
mdadm --assemble --scan
