FROM ros:noetic-ros-core

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-rosdep \
    python3-rosinstall \
    python3-rosinstall-generator \
    python3-wstool \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init && rosdep update

# Fetch the foxglove_bridge repo
RUN mkdir -p /ros_ws/src
WORKDIR /ros_ws/src
RUN git clone https://github.com/foxglove/ros-foxglove-bridge.git

# Install rosdep dependencies
RUN . /opt/ros/noetic/setup.sh && \
    apt-get update && rosdep install -y \
      --from-paths /ros_ws/src \
      --ignore-src \
    && rm -rf /var/lib/apt/lists/*

# Build the Catkin workspace
RUN . /opt/ros/noetic/setup.sh && \
  && cd /ros_ws \
  && catkin_make

# Source ROS environments in .bashrc
RUN echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
RUN echo "source /ros_ws/devel/setup.bash" >> ~/.bashrc

# Run foxglove_bridge node
CMD ["rosrun", "foxglove_bridge", "foxglove_bridge"]
