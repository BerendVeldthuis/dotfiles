#!/usr/bin/env python3
import logging, sys

logging.basicConfig(stream=sys.stderr, level=logging.ERROR) # set the logging level.

from libqtile.command.client import InteractiveCommandClient
from time import sleep

c = InteractiveCommandClient()

while 'Steam Games List' not in c.group["tray"].info()["windows"]: # wait until steam exsists
    continue

logging.debug("Steam is open waiting to start")
sleep(5)

logging.debug("resizing the layout")

# reset the layout and make discord as big as possible
c.group["tray"].layout.reset()
c.group["tray"].layout.maximize() # maximize the manepane of the monadtall layout in the tray group