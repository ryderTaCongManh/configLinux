#!/bin/bash
#title           :deamon_update.sh
#description     :This script run as deamon to poll USB thumb drive and then run sript.sh in it.
#author		 	 :Logan
#date            :20190109
#version         :1.0
#==============================================================================

while [ 1 ]
do
	sleep 5
	sd=$(ls /dev/sd* 2> /dev/null)
	array=(${sd})
	for i in "${!array[@]}"
	do
		USB_DEVICE="${array[i]}"
		if [ -e "$USB_DEVICE" ]              
		then                                  
			mount $USB_DEVICE /mnt/floppy 2> /dev/null
			if [  $? == 0 ]
			then                       
				if [ -e "/mnt/floppy/script.sh" ]
				then
					cd /mnt/floppy             
					chmod +x /mnt/floppy/script.sh
					./script.sh                  
					cd /
					umount /mnt/floppy                
					# Wait for user unplug USB        
					echo "Wait for user unplug USB..."
					while [ 1 ]
					do
						if [ ! -e "$USB_DEVICE" ]
						then
							break
						fi                  
						sleep 1  
					done                     
					echo "USB unpluged.."  
				else
					echo "This partition does not have script.sh.."
					cd /
					umount /mnt/floppy 
				fi         
			fi
		fi
	done
done
