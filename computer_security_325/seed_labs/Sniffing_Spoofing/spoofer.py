#!/usr/bin/env python3
from scapy.all import IP, ICMP, send

# Target IP to send spoofed packet to
DST_IP = "10.9.0.5"          # hostA or hostB ip
# IP you want to spoof as the source
SPOOFED_SRC = "1.2.3.4"      # desired sender ip


# Create IP header with spoofed source
ip_pkt = IP(src=SPOOFED_SRC, dst=DST_IP)
# Create ICMP echo request
icmp_pkt = ICMP()
# Stack them together
pkt = ip_pkt / icmp_pkt

send(pkt, verbose=1)