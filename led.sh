#!/bin/bash

# # # # # # # # # # # # # #
# by xinfor
# 有很多可以改善的地方
#
# 生成键盘灯状态文件并提取设置键盘灯
# 0 : 未打开键盘灯
# 1 : 已打开键盘灯
#
# # # # # # # # # # # # # #

statusfile=$(cd "$(dirname "$0")"; pwd)/led.status		# 获取键盘灯状态文件路径
if [ -f $statusfile ]; then						# 判断文件是否存在
	status=`cat $statusfile`								# 获取状态
	if [ "0" = $status ]; then							# 判断
		echo 1 > $statusfile;							# 设置当前状态并打开键盘灯
		xset led;
	else
		echo 0 > $statusfile;							# 设置当前状态并关闭键盘灯
		xset -led;
	fi
else
	echo 1 > $statusfile;								# 若文件不存在，生成状态文件并打开键盘灯
	xset led;
fi;
