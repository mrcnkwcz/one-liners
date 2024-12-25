# Show kernel modules
lsmod | cut -d " " -f 1 | tail +2 | sort
find /lib/modules/$(uname -r) -type f -name "*.ko*" | sed 's:.*/::' | sed 's:\.ko.*::' | sort
