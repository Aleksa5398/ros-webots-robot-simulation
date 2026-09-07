# ROS Webots Robot Simulation

This project was developed using ROS and Webots for simulating robot movement and processing information from the robot camera.

Webots is used as the simulation environment, while ROS handles communication between the different parts of the system. The project also includes camera processing with OpenCV in order to recognize different elements in the simulated environment.

## Camera processing

The `camera_filter` ROS node subscribes to the image published by the Webots camera.

The received ROS image is converted using `cv_bridge` and then processed with OpenCV.

HSV color filtering is used to separate different elements in the environment, including:

- obstacles
- target areas
- robot position
- object position

After processing the image, the environment is represented as a matrix.

This matrix is then reduced to a smaller `31 x 46` grid which can be used for further processing related to robot movement and route planning.

## Processing flow

```text
Webots simulation
        |
        v
Robot camera
        |
        v
ROS Image topic
        |
        v
cv_bridge
        |
        v
OpenCV / HSV filtering
        |
        v
Environment matrix
        |
        v
31 x 46 grid
