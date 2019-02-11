#!/bin/bash

if [ "$1" = "-h" -o "$1" = "--help" ]; then
	echo "This is script for adding text at the rigth corner"
	echo "Usage: ./addtext.sh <input_directory> <text> <output_directory>"
	exit 0
fi

if ! [ "$1" ] || ! [ "$2" ] || ! [ "$3" ]; then
	echo "Error: expected parameters"
	exit 1
fi

if ! [ -d "$1" ]; then
	echo "Expected directory at first parameter"
	exit 1
fi

if ! [ -d "$3" ]; then
	mkdir "$3"
	if [ $? -ne 0 ]; then
		echo Cannot create a directory "$3"
		exit 1
	fi
fi

for file in "$1"/*
do
	if ! [ ${file: -4} == ".jpg" ]; then
		continue
	fi

	echo $file

	without_extension=$(basename "${file}" .jpg)
	name="${without_extension}_annotated.jpg"

	convert "$file" -font DejaVu-Sans -pointsize 50 -gravity Southeast -annotate +0+0 "$2" "$3/$name" 2>/dev/null
	
	if [ $? -ne 0 ]; then
		echo Cannot convert file $name
		exit 1
	fi
done