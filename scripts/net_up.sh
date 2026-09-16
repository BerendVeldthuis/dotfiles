#!/bin/bash

# while internet is down wait
while ip link show | grep -q "state DOWN"; do
  echo "down"
  sleep 2
done

mount /media/qbyte/smb
