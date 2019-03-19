#! /usr/bin/env python

## Connects to labjack and continuously publishes room stats
## in order radiant_temp,humidity,ambient_temp,air_velocity0,air_velocity1
##light,sound
## Import required Python code.

#import roslib
#roslib.load_manifest("collect_data")

#import sys

import DataManagement as DM
import time

from nav_msgs.msg import Odometry
from labjack.msg import room_stats


def collect():
    pubRoomStats = rospy.Publisher('Room_Statistics', room_stats_data,  queue_size=10)
    rospy.init_node('Room_Stat', anonymous=True)
    rate = rospy.Rate(1) # 1hz
    while not rospy.is_shutdown():
        data = DM.take_measurements()
        rospy.loginfo(data)
        pub.publish(data)
        rate.sleep()
    DM.disconnect_labjack()

if __name__ == '__main__':
    try:
        DM.connect_labjack()
        data = DM.take_measurements()
        collect()
    except rospy.ROSInterruptException:
        DM.disconnect_labjack()
        pass
