#!/usr/bin/env python3
from scapy.all import *

SRC_IP = "10.9.0.1"

def filter_pkt(pkt):
    # Capture all ICMP packets
    if pkt.haslayer(ICMP):
        return True
    # Capture TCP packets from SRC_IP to destination port 23
    if pkt.haslayer(TCP) and pkt.haslayer(IP):
        if pkt[IP].src == SRC_IP and pkt[TCP].dport == 23:
            return True
    return False

def print_pkt(pkt):
    pkt.show()

pkt = sniff(iface='br-aeb110d848c9', lfilter=filter_pkt, prn=print_pkt)