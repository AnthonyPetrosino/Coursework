#!/usr/bin/python3

import socket

IP = "127.0.0.1"
PORT = 5000
data = b'Hello, World! This is udp.'

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
sock.sendto(data, (IP, PORT))
sock.close()
print("Message sent")
