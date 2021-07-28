#!/bin/bash

cd && mkdir libs && cd libs

apt-get -y install build-essential cmake unzip pkg-config checkinstall yasm git
apt-get -y install libxmu-dev libxi-dev libglu1-mesa libglu1-mesa-dev
apt-get -y install libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev
apt-get -y install libhdf5-serial-dev
apt-get -y install libavcodec-dev libavformat-dev libswscale-dev
apt-get -y install libv4l-dev libxine2-dev libxvidcore-dev libx264-dev
apt-get -y install libavresample-dev libva-dev liblapacke-dev libblas-dev libopenblas-dev liblapack-dev
apt-get -y install libtbb-dev libomp-dev
apt-get -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev
apt-get -y install libgtk-3-dev
apt-get -y install libatlas-base-dev gfortran
apt-get -y install python3-dev
apt-get -y install libfaac-dev libmp3lame-dev libtheora-dev
apt-get -y install libvorbis-dev
apt-get -y install libopencore-amrnb-dev libopencore-amrwb-dev
apt-get -y install x264 v4l-utils
apt-get -y install libgoogle-glog-dev libgflags-dev
apt-get -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen
apt-get -y install python3-dev python3-pip
apt-get -y install python3-tk python-imaging-tk
pip3 install numpy

git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
cd opencv && mkdir build && cd build
cmake -D CMAKE_BUILD_TYPE=Release \
	-D CMAKE_INSTALL_PREFIX=/usr/local \
	-D INSTALL_PYTHON_EXAMPLES=ON \
	-D INSTALL_C_EXAMPLES=ON \
	-D OPENCV_ENABLE_NONFREE=ON \
	-D WITH_TBB=ON \
	-D WITH_OPENMP=ON \
	-D WITH_V4L=ON \
	-D CV_ENABLE_INTRINSICS=ON \
    -D WITH_GSTREAMER=ON \
	-D WITH_OPENGL=ON \
	-D WITH_CUDA=ON \
	-D WITH_CUDNN=ON \
	-D WITH_EIGEN=ON \
	-D OPENCV_DNN_CUDA=ON \
	-D ENABLE_FAST_MATH=1 \
	-D CUDA_FAST_MATH=1 \
	-D CUDA_ARCH_BIN= \
	-D WITH_CUBLAS=1 \
	-D OPENCV_EXTRA_MODULES_PATH=~/libs/opencv_contrib/modules \
	-D HAVE_opencv_python3=ON \
	-D PYTHON_EXECUTABLE=/usr/bin/python3 \
	-D BUILD_EXAMPLES=OFF \
	-D BUILD_DOCS=OFF \
	-D OPENCV_GENERATE_PKGCONFIG=ON ..

make -j"$(nproc)"
make install
cd