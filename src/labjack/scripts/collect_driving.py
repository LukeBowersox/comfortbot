#Python 3.6.1 |Anaconda 4.4.0 (64-bit)| (default, May 11 2017, 13:25:24) [MSC v.1900 64 bit (AMD64)] on win32
#Type "copyright", "credits" or "license()" for more information.
#!/usr/bin/env python

'''
Copyright (c) 2015, Mark Silliman
All rights reserved.
Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
'''

# TurtleBot must have minimal.launch & amcl_demo.launch
# running prior to starting this script
# For simulation: launch gazebo world & amcl_demo prior to run this script

#import rosp
import sys
print(sys.path)
import actionlib
import random
import rospy
import math
import time
import os
import DataManagement as DM
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
#import actionlib
from actionlib_msgs.msg import *
from geometry_msgs.msg import Pose, Point, Quaternion



DM.connect_labjack()

# Enter corners of room, then how many points you want robot to move to (square)
x1 = -0.95
y1 = -0.7
x2 = 0.6
y2 = 1.35 
points = 4

totalRadTemp = 0
totalAirTemp = 0
totalHumidity = 0
totalXvel = 0
totalYvel = 0
totalLight = 0
totalSound = 0

root = math.sqrt(points)
while (int(root + 0.5) ** 2 != points):
    root = math.sqrt(points)
    points = round(points)
# Increment number of points until it is a perfect square
    points = points+1
    root = math.sqrt(points)
# Find next greatest perfect square
points2 = points + 1
root2 = math.sqrt(points2)
while (int(root2 + 0.5) ** 2 != points2):
    root2 = math.sqrt(points2)
# Increment number of points until it is a perfect square
    points2+=1
# Print side of square 
root = int(round(root))
print(root)
# Print next largest side of square (3x3 = 4)
root2 = int(round(math.sqrt(points2)))
print(root2)

#Continuously run
### The following loop makes the code run continuously for demo purposes. This is NOT necessary for data measuremet.
while True:
    
    integer = 0
    while os.path.exists("data%s.csv" % integer):
        integer += 1
    
    class GoToPose():
        def __init__(self):

            self.goal_sent = False

        # What to do if shut down (e.g. Ctrl-C or failure)
            rospy.on_shutdown(self.shutdown)

        # Tell the action client that we want to spin a thread by default
            self.move_base = actionlib.SimpleActionClient("move_base", MoveBaseAction)
            rospy.loginfo("Wait for the action server to come up")

        # Allow up to 5 seconds for the action server to come up
            self.move_base.wait_for_server(rospy.Duration(5))

        def goto(self, pos, quat):

        # Send a goal
            self.goal_sent = True
            goal = MoveBaseGoal()
            goal.target_pose.header.frame_id = 'map'
            goal.target_pose.header.stamp = rospy.Time.now()
            goal.target_pose.pose = Pose(Point(pos['x'], pos['y'], 0.000),
                             Quaternion(quat['r1'], quat['r2'], quat['r3'], quat['r4']))

        # Start moving
            self.move_base.send_goal(goal)

        # Allow TurtleBot up to 60 seconds to complete task
            success = self.move_base.wait_for_result(rospy.Duration(60)) 

            state = self.move_base.get_state()
            result = False

            if success and state == GoalStatus.SUCCEEDED:
        # We made it!
                result = True
            else:
                self.move_base.cancel_goal()

            self.goal_sent = False
            return result
        def moveAround(self,x1,y1,x2,y2,points):
            root = math.sqrt(points)
            while (int(root + 0.5) ** 2 == points):
                root = math.sqrt(points)
                points = round(points)
                points = points+1
        def shutdown(self):
            if self.goal_sent:
                self.move_base.cancel_goal()
                rospy.loginfo("Stop")
                rospy.sleep(1)

    if __name__ == '__main__':
        x = 0
        y = 0
        try:
            rospy.init_node('nav_test', anonymous=False)
            navigator = GoToPose()
    # Position coordinates customized based on user input

            for i in range (0,root):
                if i%2 == 0:
                    for j in range (0,root):
    ##                    I = x1+(x2-x1)/(root)*j
    ##                    J = x1+(x2-x1)/(root)*(j+1)
    ##                    L = y1+(y2-y1)/(root)*i
    ##                    M = y1+(y2-y1)/(root)*(i+1)
    ##                    x = (I+J)/2.0
    ##                    y = (L+M)/2.0
                        x = ((x2-x1)/root*j+x1+(x2-x1)/root*(j+1)+x1)/2
                        y = ((y2-y1)/root*i+y1+(y2-y1)/root*(i+1)+y1)/2
                        # Print coordinates
                        position = {'x': x, 'y' : y}
                        theta = 0.0;
                        #NOTE: If the following commands do not work outside the loop, comment them and uncomment the ones below.
                        quaternion = {'r1' : 0.000, 'r2' : 0.000, 'r3' : theta, 'r4' : 1.000}
                        rospy.loginfo("Go to (%s, %s) pose", position['x'], position['y'])
                        success = navigator.goto(position, quaternion)
    ##                    success = True
                        if success:
                            rospy.loginfo("Hooray, reached (%s, %s)",x,y)
                            try:
                                        data = DM.take_measurements()
                                        data_arr = []
                                        data_arr.append(i)
                                        data_arr.append(j)
                                        data_arr.append(data[0])
                                        data_arr.append(data[1])
                                        data_arr.append(data[2])
                                        data_arr.append(data[3])
                                        data_arr.append(data[4])
                                        data_arr.append(data[5])
                                        data_arr.append(data[6])

                                        totalRadTemp += data[0]
                                        totalHumidity += data[1]
                                        totalAirTemp += data[2]
                                        totalXvel += data[3]
                                        totalYvel += data[4]
                                        totalLight += data[5]
                                        totalSound += data[6]
                                        
                                        with open('data%s.csv' % integer, 'a') as f:
                                            for k in range (0, 8):
                                                f.write(str(data_arr[k]))
                                                f.write(', ')
                                            f.write(str(data_arr[8]))
                                            f.write('\n')
                                        #print f.readlines()
                                        DM.display_measurements(data)
                                        time.sleep(1)
                            except KeyboardInterrupt:
                                        print("no data, disconnecting")
                                        DM.disconnect_labjack()
                        else:
                            rospy.loginfo("The base failed to reach the desired pose (%s, %s)",x,y)

    # Sleep to give the last log messages time to be sent
                        rospy.sleep(2)

                else:
                    for j in range (root-1,-1,-1):
    ##                    I = x1+(x2-x1)/(float(root))*j
    ##                    J = x1+(x2-x1)/(float(root))*(j+1)
    ##                    L = y1+(y2-y1)/(float(root))*i
    ##                    M = y1+(y2-y1)/(float(root))*(i+1)
    ##                    x = (I+J)/2.0
    ##                    y = (L+M)/2.0
                        x = ((x2-x1)/root*j+x1+(x2-x1)/root*(j+1)+x1)/2
                        y = ((y2-y1)/root*i+y1+(y2-y1)/root*(i+1)+y1)/2
                        theta = 3.14
                        position = {'x': x, 'y' : y}
                        quaternion = {'r1' : 0.000, 'r2' : 0.000, 'r3' : theta, 'r4' : 1.000}
                        rospy.loginfo("Go to (%s, %s) pose", position['x'], position['y'])
                        success = navigator.goto(position, quaternion)
    ##                    success = True
                        if success:
                            rospy.loginfo("Hooray, reached (%s, %s)",x,y)
                            try:
                                        data = DM.take_measurements()
                                        data_arr = []
                                        data_arr.append(i)
                                        data_arr.append(j)
                                        data_arr.append(data[0])
                                        data_arr.append(data[1])
                                        data_arr.append(data[2])
                                        data_arr.append(data[3])
                                        data_arr.append(data[4])
                                        data_arr.append(data[5])
                                        data_arr.append(data[6])

                                        totalRadTemp += data[0]
                                        totalHumidity += data[1]
                                        totalAirTemp += data[2]
                                        totalXvel += data[3]
                                        totalYvel += data[4]
                                        totalLight += data[5]
                                        totalSound += data[6]
            
                                        with open('data%s.csv' % integer, 'a') as f:
                                            for k in range (0, 8):
                                                f.write(str(data_arr[k]))
                                                f.write(', ')
                                            f.write(str(data_arr[8]))
                                            f.write('\n')
                                        #print f.readlines()
                                        DM.display_measurements(data)
                                        time.sleep(1)
                            except KeyboardInterrupt:
                                        print("no data, disconnecting")
                                        DM.disconnect_labjack()
                        else:
                            rospy.loginfo("The base failed to reach the desired pose (%s, %s)",x,y)
    #            position = {'x': x, 'y' : y}
    #            quaternion = {'r1' : 0.000, 'r2' : 0.000, 'r3' : theta, 'r4' : 1.000}
    #            success = navigator.goto(position, quaternion)
    #            if success:
    #                rospy.loginfo("Hooray, reached (%s, %s)",xPos[i],yPos[i])
    #            else:
    #                rospy.loginfo("The base failed to reach the desired pose (%s, %s)",xPos[i],yPos[i])

    # Sleep to give the last log messages time to be sent
                rospy.sleep(2)
        
            points = float(points)

            totalRadTemp /= points
            totalHumidity /= points
            totalAirTemp /= points
            totalXvel /= points
            totalYvel /= points
            totalLight /= points
            totalSound /= points

            print("/home/hcr/helloworld/turtlebot/data%s.csv" % integer)
            print(totalRadTemp)	
            print(totalHumidity)	
            print(totalAirTemp)	
            print(totalXvel)	
            print(totalYvel)	
            print(totalLight)	
            print(totalSound)

            #Chill for a little until next loop
            time.sleep(2)
     
        except rospy.ROSInterruptException:
            rospy.loginfo("Ctrl-C caught. Quitting")
            DM.disconnect_labjack()

DM.disconnect_labjack()
