@echo off
@FOR /F "tokens=* USEBACKQ" %%F IN (`adb shell date +%%s`) do (set tt=%%F)
adb shell screencap /sdcard/%tt%.png
adb pull /sdcard/%tt%.png
adb shell rm /sdcard/%tt%.png
start %tt%.png