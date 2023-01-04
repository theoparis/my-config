#!/bin/sh

uptime_formatted=$(uptime | cut -d ',' -f1  | cut -d ' ' -f4,5)

date_formatted=$(date "+%a %F %r")

linux_version=$(uname -r | cut -d '-' -f1)

battery_status=$(cat /sys/class/power_supply/BAT0/status)

echo $uptime_formatted ↑ $linux_version 🐧 $battery_status 🔋 $date_formatted
