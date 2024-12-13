#!/bin/bash

read VERSION < ~/versionCode/AndroidVersionCode;
echo current version $VERSION;
((VERSION++));
echo new version $VERSION;
sed -i  "s/versionCode [0-9]*/versionCode $VERSION/g" "NewsWidget/NewsWidget/build.gradle";
echo $VERSION > ~/versionCode/AndroidVersionCode;
