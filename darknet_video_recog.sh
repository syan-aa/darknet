#! /bin/bash

if [ "$#" -eq 1 ]; then
    videopath=$1
else
	echo 'Please give mp4 video full path:'
	exit 1
fi

./darknet detector demo cfg/coco.data cfg/yolo.cfg models/yolo.weights $videopath
ffmpeg -i test_dnn_out.avi -c:a aac -b:a 128k -c:v libx264 -crf 23 ./results/output.mp4
