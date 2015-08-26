// Bring in gtest
#include <gtest/gtest.h>

#include "ros/ros.h"
#include "std_msgs/String.h"
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/LaserScan.h>

#include <sstream>
#include <stdlib.h>

#include <node_defs/cat.h>

static Cat node;

void setup()
{
	// create a new instance of node
	node = Cat();
}

//######################### UNIT TESTS ##########################

TEST(UnitTest, testNodeInitialisedSpeed)
{
	EXPECT_EQ(node.speed.linear_x, 0.0);
	EXPECT_EQ(node.speed.angular_z, 0.0);
}

TEST(UnitTest, testNodeTopSpeed)
{
	EXPECT_EQ(node.speed.max_linear_x, 3.0);
}

TEST(UnitTest, testStartupState)
{
	EXPECT_EQ(node.state, Cat::IDLE); 
}

//###################### ACCEPTANCE TESTS ######################

TEST(AcceptanceTest, testTurnStop)
{
	setup();

	node.orientation.currently_turning = true;
	node.orientation.desired_angle = node.orientation.angle;

	node.checkTurningStatus();

	EXPECT_FALSE(node.orientation.currently_turning);
}

TEST(AcceptanceTest, testActionQueue)
{
	node.stopAfterPop();

	EXPECT_FALSE(node.action_queue.empty());
}

// Run all the tests that were declared with TEST()
int main(int argc, char **argv){
	//Create a node to test with
	ros::init(argc, argv, "CAT");
	ros::NodeHandle n;

	//Run the test suite
	testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}