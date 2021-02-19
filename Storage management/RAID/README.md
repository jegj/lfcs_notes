ww# RAID

* RAID 0 - Striped - No spare

  * `mdadm --create --verbose /dev/md0 --level=stripe --raid-devices=2 /dev/sdb1 /dev/sdc1`
* RAID 1 - Mirror

  * `mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdb1 /dev/sdc1`

* RAID 5 - (1 parity + 1 spare) Requires the use of at least 3 drives,
  * `mdadm --create --verbose /dev/md0 --level=5 --raid-devices=3 /dev/sdb1 /dev/sdc1`
    `/dev/sdd1 --spare-devices=1 /dev/sde1`
* RAID 6 - (2 parity + 1 spare) Requires at least 4 drive
  * `mdadm --create --verbose /dev/md0 --level=6 --raid-devices=4 /dev/sdb1 /dev/sdc1`
    `/dev/sdd1 /dev/sde --spare-devices=1 /dev/sdf1`

* RAID 10 - (Stripe + Mirror + 1 spare) Requires at least 4 drive

  * `mdadm --create --verbose /dev/md0 --level=10 --raid-devices=4 /dev/sd[b-e]1 --spare-devices=1 /dev/sdf1`

- https://www.alvarovf.com/seguridad/2020/10/01/configuracion-raid-5.html