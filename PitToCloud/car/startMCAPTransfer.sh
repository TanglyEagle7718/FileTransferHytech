#!/bin/bash


./fromCarToPanda.sh

while true
do
	if [ -f dataTransferMessage.txt ]; then
		message=$(cat dataTransferMessage.txt | head -n1)	

		if [[ $message = "great!" ]]; then
			echo message has been sent
			break
		else 
			./fromCarToPanda.sh
		fi
	fi
	sleep 1
done

rm -rf ./recordings/filesToBeSent/
rm dataTransferMessage.txt
rm recordings.tar
rm finalDataPackage.tar
rm sha256Recordings.txt
