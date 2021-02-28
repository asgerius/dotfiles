#!/usr/bin/python3
# sudo nano /usr/lib/systemd/system-sleep/pre-suspend.sh
# https://forum.manjaro.org/t/automatically-enable-touchpad-after-suspend/5812/8

from subprocess import Popen
from time import sleep
import os
os.mkdir("/home/asger/hej")
success = False
# while not success:
#     sleep(0.1)
os.system('xinput --enable "PNP0C50:00 06CB:CDB0 Touchpad"')
    # process = Popen(['xinput', '--enable', '"PNP0C50:00 06CB:CDB0 Touchpad"'])
    # success = process.wait() == 0
