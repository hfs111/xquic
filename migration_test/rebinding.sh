#!/bin/bash

IFACE="enp6s19"  # 你的网卡名（用 `ip addr` 查看）
IP1="192.168.1.126"
IP2="192.168.1.127"
NETMASK="/24"    # 根据你的网段调整
GATEWAY="192.168.1.1"  # 可选：用于默认网关切换（如需要）

INTERVAL=10  # 切换间隔秒数

# 退出时自动恢复
cleanup() {
    echo -e "\n🛑 退出程序，恢复 IP 为 $IP1"
    sudo ip addr flush dev $IFACE
    sudo ip addr add ${IP1}${NETMASK} dev $IFACE
    exit 0
}

# 捕获 Ctrl+C（SIGINT）
trap cleanup SIGINT

while true; do
    echo "[切换] 设置 IP 为 $IP1"
    sudo ip addr flush dev $IFACE
    sudo ip addr add ${IP1}${NETMASK} dev $IFACE
    # sudo ip route add default via $GATEWAY dev $IFACE  # 如果需要重新设网关
    sleep $INTERVAL

    echo "[切换] 设置 IP 为 $IP2"
    sudo ip addr flush dev $IFACE
    sudo ip addr add ${IP2}${NETMASK} dev $IFACE
    # sudo ip route add default via $GATEWAY dev $IFACE
    sleep $INTERVAL
done
