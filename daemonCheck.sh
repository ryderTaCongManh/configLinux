#!/bin/sh
#
# This script will be executed *after* all the other init scripts.
# Please remember to synchronize time to the correct one

# start loop check time to reset board
while [ true ]
do
    let marlinPIDCnt=$(ps -ef |grep -v grep | grep -c '/home/stylFoodSearch')
    if [ "$marlinPIDCnt" -eq 0 ]; then
            echo -e "\033[31mRestart stylFoodSearch process\033[0m"
            /home/stylFoodSearch -qws &
    fi
	sleep 10
done







# Tue Jan 29 07:12:27 UTC 2019
# date -s 'Tue Jan 29 12:12:27 UTC 2019'



# YYYY-MM-DD hh:mm[:ss]
# date -s 12:12:27

# [YYYY].MM.DD-hh:mm[:ss]
# date -s 2019.01.29-14:18:00

# ps -ef | grep -c '/home/QrCodeDemo'
# ps -ef | grep -v grep | grep -c '/home/QrCodeDemo'
# Recognized TIME formats:
# 	hh:mm[:ss]
# 	[YYYY.]MM.DD-hh:mm[:ss]
# 	YYYY-MM-DD hh:mm[:ss]
# 	[[[[[YY]YY]MM]DD]hh]mm[.ss]
# 	'date TIME' form accepts MMDDhhmm[[YY]YY][.ss] instead

