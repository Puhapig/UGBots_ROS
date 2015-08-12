/* Auto-generated by genmsg_cpp for file /home/andy/306ws/UGBots_ROS/ugbots_ros/msg/bin_status.msg */
#ifndef UGBOTS_ROS_MESSAGE_BIN_STATUS_H
#define UGBOTS_ROS_MESSAGE_BIN_STATUS_H
#include <string>
#include <vector>
#include <map>
#include <ostream>
#include "ros/serialization.h"
#include "ros/builtin_message_traits.h"
#include "ros/message_operations.h"
#include "ros/time.h"

#include "ros/macros.h"

#include "ros/assert.h"


namespace ugbots_ros
{
template <class ContainerAllocator>
struct bin_status_ {
  typedef bin_status_<ContainerAllocator> Type;

  bin_status_()
  : bin_x(0.0)
  , bin_y(0.0)
  , bin_stat()
  {
  }

  bin_status_(const ContainerAllocator& _alloc)
  : bin_x(0.0)
  , bin_y(0.0)
  , bin_stat(_alloc)
  {
  }

  typedef double _bin_x_type;
  double bin_x;

  typedef double _bin_y_type;
  double bin_y;

  typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _bin_stat_type;
  std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  bin_stat;


  typedef boost::shared_ptr< ::ugbots_ros::bin_status_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::ugbots_ros::bin_status_<ContainerAllocator>  const> ConstPtr;
}; // struct bin_status
typedef  ::ugbots_ros::bin_status_<std::allocator<void> > bin_status;

typedef boost::shared_ptr< ::ugbots_ros::bin_status> bin_statusPtr;
typedef boost::shared_ptr< ::ugbots_ros::bin_status const> bin_statusConstPtr;


template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const  ::ugbots_ros::bin_status_<ContainerAllocator> & v)
{
  ros::message_operations::Printer< ::ugbots_ros::bin_status_<ContainerAllocator> >::stream(s, "", v);
  return s;}

} // namespace ugbots_ros

namespace ros
{
namespace message_traits
{
template<class ContainerAllocator> struct IsMessage< ::ugbots_ros::bin_status_<ContainerAllocator> > : public TrueType {};
template<class ContainerAllocator> struct IsMessage< ::ugbots_ros::bin_status_<ContainerAllocator>  const> : public TrueType {};
template<class ContainerAllocator>
struct MD5Sum< ::ugbots_ros::bin_status_<ContainerAllocator> > {
  static const char* value() 
  {
    return "9e7ec5f3609eb98fb2e1f6b8f4b7b677";
  }

  static const char* value(const  ::ugbots_ros::bin_status_<ContainerAllocator> &) { return value(); } 
  static const uint64_t static_value1 = 0x9e7ec5f3609eb98fULL;
  static const uint64_t static_value2 = 0xb2e1f6b8f4b7b677ULL;
};

template<class ContainerAllocator>
struct DataType< ::ugbots_ros::bin_status_<ContainerAllocator> > {
  static const char* value() 
  {
    return "ugbots_ros/bin_status";
  }

  static const char* value(const  ::ugbots_ros::bin_status_<ContainerAllocator> &) { return value(); } 
};

template<class ContainerAllocator>
struct Definition< ::ugbots_ros::bin_status_<ContainerAllocator> > {
  static const char* value() 
  {
    return "float64 bin_x\n\
float64 bin_y\n\
string bin_stat\n\
";
  }

  static const char* value(const  ::ugbots_ros::bin_status_<ContainerAllocator> &) { return value(); } 
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

template<class ContainerAllocator> struct Serializer< ::ugbots_ros::bin_status_<ContainerAllocator> >
{
  template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
  {
    stream.next(m.bin_x);
    stream.next(m.bin_y);
    stream.next(m.bin_stat);
  }

  ROS_DECLARE_ALLINONE_SERIALIZER;
}; // struct bin_status_
} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::ugbots_ros::bin_status_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const  ::ugbots_ros::bin_status_<ContainerAllocator> & v) 
  {
    s << indent << "bin_x: ";
    Printer<double>::stream(s, indent + "  ", v.bin_x);
    s << indent << "bin_y: ";
    Printer<double>::stream(s, indent + "  ", v.bin_y);
    s << indent << "bin_stat: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.bin_stat);
  }
};


} // namespace message_operations
} // namespace ros

#endif // UGBOTS_ROS_MESSAGE_BIN_STATUS_H
