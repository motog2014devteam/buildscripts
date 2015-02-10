. build/envsetup.sh
export USE_CCACHE=1
export USE_PREBUILT_CHROMIUM=1

lunch cm_"$1"-userdebug
time mka bacon
