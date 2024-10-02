echo "algo=zstd" | save -f /sys/block/zram0/recomp_algorithm
echo "32G" | save -f /sys/block/zram0/disksize
mkswap /dev/zram0
swapon /dev/zram0

