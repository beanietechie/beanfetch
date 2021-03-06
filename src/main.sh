#!/usr/bin/sh

username="$(whoami)"
hostname="$(uname -n)"
os="$(hostnamectl | grep "Operating System\: " | sed "s/.*: //")"
kernel="$(hostnamectl | grep "Kernel\: " | sed "s/.*: //")"
model="unknown"
# borrowed from dylanaraps/neofetch
if [[ -d /system/app/ && -d /system/priv-app ]]; then
    model="$(getprop ro.product.brand) $(getprop ro.product.model)"

elif [[ -f /sys/devices/virtual/dmi/id/product_name ||
    -f /sys/devices/virtual/dmi/id/product_version ]]; then
    model=$(< /sys/devices/virtual/dmi/id/product_name)
    model+=" $(< /sys/devices/virtual/dmi/id/product_version)"

elif [[ -f /sys/firmware/devicetree/base/model ]]; then
    model=$(< /sys/firmware/devicetree/base/model)

elif [[ -f /tmp/sysinfo/model ]]; then
    model=$(< /tmp/sysinfo/model)
fi
shell="$(echo $SHELL | sed "s/^.*\///g")"

echo "$username@$hostname"
echo ""
echo "Operating system: $os"
echo "Kernel and version: $kernel"
echo "Device model: $model"
echo "Command line shell: $shell"

echo ""
