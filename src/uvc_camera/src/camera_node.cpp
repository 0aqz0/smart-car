#include <ros/ros.h>
#include <nodelet/loader.h>

#include "uvc_camera/camera.h"
#include "opencv2/opencv.hpp"

using namespace cv;

int main (int argc, char **argv) {
    ros::init(argc, argv, "uvc_camera");

    uvc_camera::Camera camera(ros::NodeHandle(), ros::NodeHandle("~"));
    
    ros::spin();
    return 0;
}

