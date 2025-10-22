#!/usr/bin/python3

import socket

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.bind(("localhost", 5000))
data, addr = sock.recvfrom(1024)
print(f"Received: {data.decode()} from {addr}")
sock.close()
