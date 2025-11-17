#!/usr/bin/env python3
from scapy.all import sniff, send, IP, ICMP, Raw

IFACE = "br-aeb110d848c9"

def handle(pkt):
    # Check if the packet has an IP layer and an ICMP layer
    # Also, check if it's an ICMP Echo Request (type 8)
    if pkt.haslayer(IP) and pkt.haslayer(ICMP) and pkt[ICMP].type == 8:
        # Build the ICMP Echo Reply packet
        reply = IP(src=pkt[IP].dst, dst=pkt[IP].src)/ICMP(
            type=0,               # ICMP Echo Reply
            id=pkt[ICMP].id,      # Copy ID from the request
            seq=pkt[ICMP].seq     # Copy sequence number
        )

        # If the original packet contains payload data, include it in the reply
        if pkt.haslayer(Raw):
            reply = reply / pkt[Raw].load

        # Send the reply without verbose output
        send(reply, verbose=0)
        print(f"Replied {pkt[IP].dst} -> {pkt[IP].src}")

# Start sniffing for ICMP packets
sniff(iface=IFACE, filter="icmp", prn=handle, store=False)