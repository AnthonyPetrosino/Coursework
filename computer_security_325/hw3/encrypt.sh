#!/usr/bin/env bash

openssl enc -aes-128-ofb -K "$KEY" -iv "$IV" -in p1.bin -out c1.bin
openssl enc -aes-128-ofb -K "$KEY" -iv "$IV" -in p2.bin -out c2.bin
