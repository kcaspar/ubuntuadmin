#!/bin/bash
# from: http://karytech.blogspot.sg/2012/05/opencv-24-on-ubuntu-1204.html


sudo apt-get update

#install tools for dev, packagetracking, make, describing packages, low level assembler
sudo apt-get install build-essential
sudo apt-get install checkinstall
sudo apt-get install cmake
sudo apt-get install pkg-config
sudo apt-get install yasm

#install tools for image io.
sudo apt-get install libtiff4-dev
sudo apt-get install libjpeg-dev
sudo apt-get install libjasper-dev

#install coding/decoding/formating packages (for highgui)
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev libv4l-dev

#some python wrappers for compilation
sudo apt-get install python-dev python-numpy

#parallel library
sudo apt-get install libtbb-dev

#install gtk gui
sudo apt-get install libqt4-dev libgtk2.0-dev

#leave out other stuff for now
#sudo apt-get -y install libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev

#leave out ffmpeg stuff for now
#sudo apt-get -y install x264 v4l-utils ffmpeg

mkdir /usr/bin/opencv
cd /usr/bin/opencv
#wget  -O /home/omio/Desktop/ "http://thecanadiantestbox.x10.mx/CC.zip"
wget "http://sourceforge.net/projects/opencvlibrary/files/opencv-unix/2.4.9/opencv-2.4.9.zip"
unzip opencv-2.4.9.zip
cd opencv-2.4.9
mkdir build

#cmake -D WITH_QT=ON -D WITH_XINE=ON -D WITH_OPENGL=ON -D WITH_TBB=ON -D BUILD_EXAMPLES=ON ..
#cmake -D WITH_XINE=ON -D WITH_OPENGL=ON -D WITH_TBB=ON -D BUILD_EXAMPLES=ON ..
cmake WITH_V4L=ON ..

returned with errors:

error:
-- checking for module 'gtkglext-1.0'
--   package 'gtkglext-1.0' not found
solve:
sudo apt-get install libgtkglext1-dev

error:
-- Looking for linux/videodev.h - not found
there is a package search for ubuntu, searched for videodev (not videodev.h) and it came up with package libpjmedia-videodev2

apt-get build-dep opencv
installed a whole lot of shit... and it still doesn't find the above files.

dug out from above - not executed so far
sudo apt-get -y install libfaac-dev libmp3lame-dev libopencore-amrnb-dev libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev


