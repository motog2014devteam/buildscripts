#!/bin/bash

rm -rf out/target

. build/envsetup.sh
export USE_CCACHE=1
export USE_PREBUILT_CHROMIUM=1

breakfast $1
time mka bacon
