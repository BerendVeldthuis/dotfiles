#!/bin/bash

(/bin/cloudflared access tcp --hostname smb.broodjehamworst.net --url localhost:8445 &)
sleep 1
mount /media/berend/smb
