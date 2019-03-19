"""
DataManagement.py collects data from some analog input pins defined in this file
Intended use is for CSM comfort sensing robot team.

Recomend to include the following line in other python files to use the functions defined here:
import DataManagement as DM

then to use the functions defined here use
DM.connect_labjack()
DM.AnyFunctionThatIsNotMain~


***WHEN EDDITING THIS FILE***
take_measurements() is hardcoded, which isnt ideal but is fine for our uses, same with display_measurements().
If adding more sensors or removing sensors (or any change in input location on the labjack) all changes should
be reflected in this file to ensure proper operation.

the labjack ljm libray [for the T7] can be found from their website (the python wrapper is also needed)
https://labjack.com/support/software/installers/ljm
https://labjack.com/support/software/examples/ljm/python
"""
#Things to do: clean up imports
#math on light on sound (30MAR2018 - made an attemt to do this, not tested yet)
#math on anything else that is not working as expected(30MAR2018 - made an attemt to do this, not tested yet)

import random
import sys
import json
import time
import argparse
import thread
import threading
import traceback
import math

# from time import sleep #also useless?
from labjack import ljm
#from cmd import Cmd #useless?

rad_temp_pin = "AIN12"
air_temp_pin = "AIN13"
humidity_pin = "AIN1"
airv0_pin = "AIN2"
airv1_pin = "AIN3"
light_pin = "AIN7"
sound_pin = "AIN5"

handle = 0              #Holder for a labjack ID handle
R1=98.56                #update with exact value
Vs=4.915                #maybe should be 5? check with multimeter
STD_TEMP=25             #unknown?
mps_conversion = 5.08   # meters per second conversion
fpm_conversion = 1000   # feet per minute conversion
output_range = 5        # anemometer gives up to 5V output

def connect_labjack():
    # Open first found LabJack
    global handle
    handle = ljm.open(ljm.constants.dtANY, ljm.constants.ctANY, "ANY")
    #handle = ljm.openS("ANY", "ANY", "ANY")
def disconnect_labjack():
    global handle
    # Close handle
    ljm.close(handle)
def display_labjack_info():
    global handle
    # Prints info about connected labjack device
    info = ljm.getHandleInfo(handle)
    print("Opened a LabJack with Device type: %i, Connection type: %i,\n" \
        "Serial number: %i, IP address: %s, Port: %i,\nMax bytes per MB: %i" % \
        (info[0], info[1], info[2], ljm.numberToIP(info[3]), info[4], info[5]))


def take_measurements():
    global handle
    # will need to add light and temp
    # Setup and call eReadName to read from a AIN on the LabJack.
    data=[]
    rad_temp_voltage = ljm.eReadName(handle, rad_temp_pin)
    humidity_voltage = ljm.eReadName(handle, humidity_pin)
    air_temp_voltage = ljm.eReadName(handle, air_temp_pin)
    airv0_voltage = ljm.eReadName(handle, airv0_pin)
    airv1_voltage = ljm.eReadName(handle, airv1_pin)
    light_voltage = ljm.eReadName(handle, light_pin)
    sound_voltage = ljm.eReadName(handle, sound_pin)

    # radiant temp voltage range of output
    rad_temp = float(50/19.4*((98.65*rad_temp_voltage)/(Vs - rad_temp_voltage)-100))
    data.append(rad_temp)


    #  humidity voltage range of output
    humid = (100*humidity_voltage)/Vs
    data.append(humid)


    #  air temp voltage range of output
    air_temp = 100*(air_temp_voltage-.5) #in centigrade
    data.append(air_temp)


    #  anemometer number 0: Setup and call eReadName to read from a AIN on the LabJack.
    # voltage range of output
    air0 = (mps_conversion*airv0_voltage)/output_range
    data.append(air0)


    #  anemometer number 1: Setup and call eReadName to read from a AIN on the LabJack.
    # voltage range of output
    air1 = (mps_conversion*airv1_voltage)/output_range
    data.append(air1)
    #light
    lig=light_voltage*2*100 #convert signal voltage to lux from TEMT6000 datasheet
    data.append(lig)
    #sound
    soun = 20*math.log10(sound_voltage) #possibly in dB, should test
    data.append(soun)
    return data

def display_measurements(data):
    print("%s\tRadiant temp:     %f deg C" % (rad_temp_pin, data[0]))
    print("%s\tHumidity:         %f %%" % (humidity_pin, data[1]))
    print("%s\tAmbient temp:     %f deg C " % (air_temp_pin, data[2]))
    print("%s\tairv0:            %f m/s" % (airv0_pin, data[3]))
    print("%s\tairv1:            %f m/s" % (airv1_pin, data[4]))
    print("%s\tLight:            %f lux?" % (airv0_pin, data[5]))
    print("%s\tSound:            %f Db?" % (airv1_pin, data[6]))
    print("--------------------------------\n")


if __name__ == '__main__':
    connect_labjack()
    display_labjack_info()
    data = take_measurements()
    display_measurements(data)
    disconnect_labjack()
