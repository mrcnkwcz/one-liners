# Show kernel modules
# Active
lsmod | cut -d " " -f 1 | tail +2 | sort
# All
find /lib/modules/$(uname -r) -type f -name "*.ko*" | sed 's:.*/::' | sed 's:\.ko.*::' | sort

# Network
## MAC
ip -o -br l | column -t | awk '{print $1, $3}'
## IPv4
ip -o -br -4 a | column -t | awk '{print $1, $3}'
## IPv6
ip -o -br -6 a | column -t | awk '{print $1, $3}'
## DNS
nslookup -q=A $(hostname -f)
resolvectl query vm-ceph0{1..3}.domain.local

# CPU
lscpu | grep -E 'Socket|Core|Thread'
# Memory
lsmem --output STATE,SIZE,REMOVABLE --pairs | column -t
# Block devices
lsblk  --output NAME,SIZE,FSTYPE,UUID,MOUNTPOINT,SCHED  --sort SIZE --pairs | column -t
