class Robot

{
public:
	void publish()
	{
		//messages to stage
		node_cmdvel.linear.x = linear_x;
		node_cmdvel.angular.z = angular_z;
        
		//publish the message
		node_stage_pub.publish(node_cmdvel);

		ros::spinOnce();
	}

	virtual void moveTo(int x, int y) {}
	virtual void stop(int time) {}

	//pose of the robot
	double px;
	double py;
	double theta;

	//velocity of the robot
	double linear_x;
	double angular_z;

	//NodeHandle for the node
	ros::NodeHandle n;

	//Velocity of the robot
	geometry_msgs::Twist node_cmdvel;

	//Odometry subscriber
	ros::Subscriber sub_odom;
	//Laser subscriber
	ros::Subscriber sub_laser;
	//Publisher for publishing to stage
	ros::Publisher node_stage_pub;
};