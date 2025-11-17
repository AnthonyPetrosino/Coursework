#!/usr/bin/env python3
from scapy.all import *

DST_IP = "10.9.0.5"

pkt = IP(dst=DST_IP)/ICMP()/b"hello-there"
print("Sending packet:", pkt.summary())
send(pkt, verbose=True)