#!/usr/bin/env python3
# tracer_and_spoof.py
from scapy.all import IP, ICMP, sr1, send
import sys
import time

# --- user config ---
DST_IP = "10.9.0.5"       # target for traceroute and spoofed ping
SPOOFED_SRC = "1.2.3.4"   # spoofed source IP to use after traceroute
MAX_TTL = 20
TIMEOUT = 2
# --------------------

def traceroute(dst, max_ttl=30, timeout=2):
    print(f"[+] traceroute to {dst} max_ttl={max_ttl}")
    for ttl in range(1, max_ttl + 1):
        pkt = IP(dst=dst, ttl=ttl) / ICMP()
        reply = sr1(pkt, timeout=timeout, verbose=0)
        if reply is None:
            print(f"TTL={ttl}: no reply")
            continue

        # reply may be an ICMP Time Exceeded (type 11) from router
        icmp_layer = reply.getlayer(ICMP)
        if icmp_layer:
            if icmp_layer.type == 11:
                print(f"TTL={ttl}: {reply.src} (time exceeded)")
            elif icmp_layer.type == 0:
                # reached destination (ICMP echo-reply)
                print(f"TTL={ttl}: {reply.src} (destination reached)")
                return True
            else:
                print(f"TTL={ttl}: {reply.src} (ICMP type {icmp_layer.type})")
        else:
            print(f"TTL={ttl}: {reply.src} (non-ICMP reply)")

    print("[!] traceroute finished without reaching destination")
    return False

def spoof_icmp(src, dst, count=1, delay=0.5):
    print(f"[+] sending {count} spoofed ICMP echo-request(s) from {src} -> {dst}")
    ip_pkt = IP(src=src, dst=dst)
    icmp_pkt = ICMP(type=8)  # echo-request
    pkt = ip_pkt / icmp_pkt
    for i in range(count):
        send(pkt, verbose=1)
        if i < count - 1:
            time.sleep(delay)

if __name__ == "__main__":
    # quick CLI overrides
    if len(sys.argv) >= 2:
        DST_IP = sys.argv[1]
    if len(sys.argv) >= 3:
        SPOOFED_SRC = sys.argv[2]

    # must be root to send spoofed packets and use sr1 properly
    try:
        reached = traceroute(DST_IP, max_ttl=MAX_TTL, timeout=TIMEOUT)
    except PermissionError:
        print("Permission denied. Run with sudo/root.")
        sys.exit(1)
    except KeyboardInterrupt:
        print("\nStopped by user.")
        sys.exit(0)

    # send a spoofed ICMP after traceroute
    try:
        spoof_icmp(SPOOFED_SRC, DST_IP, count=1)
    except PermissionError:
        print("Permission denied. Run with sudo/root.")
        sys.exit(1)