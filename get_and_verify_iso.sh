#!/bin/bash
#
# This gets HTOE iso and verifies hash of it 
# Src: https://nostarch.com/hackingCD
#
# Expected output:
# hacking-live-1.0.iso: OK
wget https://resources.oreilly.com/examples/9781593271442/-/raw/master/hacking-live-1.0.iso
md5sum -c md5.txt
