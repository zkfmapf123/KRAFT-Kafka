#!/bin/bash

# sudo sysctl -w net.ipv4.ip_forward=1

## 영구적으로 적용
# /etc/sysctl.conf
# net.ipv4.ip_forward = 1 <= 적용

iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 3305 -j DNAT --to 172.20.0.5:3306