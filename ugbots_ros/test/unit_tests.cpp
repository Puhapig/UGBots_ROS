// Bring in gtest
#include <gtest/gtest.h>

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/LaserScan.h>

#include <sstream>
#include <stdlib.h>

#include <node_defs/carrier.h>

Carrier carrier;

void odom_callback(nav_msgs::Odometry msg)
{
	/*//This is the call back function to process odometry messages coming from Stage. 	
	pose.px = 5 + msg.pose.pose.position.x;
	pose.py = 10 + msg.pose.pose.position.y;
	ROS_INFO("Current x position is: %f", this->pose.px);
	ROS_INFO("Current y position is: %f", this->pose.py);*/
}

void laser_callback(sensor_msgs::LaserScan msg)
{
	//This is the callback function to process laser scan messages
	//you can access the range data from msg.ranges[i]. i = sample number	
}

TEST(UnitTest, testNodeInstantiation)
{
	double a = carrier.speed.max_linear_x;
	carrier.speed.linear_x = 10;
	EXPECT_EQ(a, 3.0);
}

TEST(TestSuite, testCase2)
{

	EXPECT_EQ(1,1);
}

// Run all the tests that were declared with TEST()
int main(int argc, char **argv){
	//Create a carrier node to test with
	ros::init(argc, argv, "CARRIER");
	ros::NodeHandle n;
	

	carrier.sub_list.node_stage_pub = n.advertise<geometry_msgs::Twist>("cmd_vel",1000);
	//carrier.sub_list.sub_odom = n.subscribe<nav_msgs::Odometry>("odom",1000, odom_callback);
	//carrier.sub_list.sub_laser = n.subscribe<sensor_msgs::LaserScan>("base_scan",1000,laser_callback);

	//Run the test suite
	testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}