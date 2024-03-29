#!/bin/bash

cd ~/carData
while true
do
	if [ -f finalDataPackage.tar ];
	then
		./confirmFiles.sh
		cd ~/carData/tmpFolder
		returnString=$(head -n1 dataTransferMessage.txt)
	       	if [[ "$returnString" = "mismatch! resend data" ]];
		then
			continue;	
		else
						
			tar -xf recordings.tar -C ../lastRunRecordings/

			mv ../lastRunRecordings/recordings/filesToBeSent/* ../lastRunRecordings

			cd ~/carData
			rm -rf tmpFolder
			rm finalDataPackage.tar
		fi	
	fi	

	sleep 1
done
