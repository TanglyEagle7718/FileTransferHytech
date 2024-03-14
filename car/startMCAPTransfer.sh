#!/bin/bash


./test.sh

while true
do
	if [ -f dataTransferMessage.txt ]; then
		message=$(cat dataTransferMessage.txt | head -n1)	

		if [[ $message = "great!" ]]; then
			echo message has been sent
			break
		else 
			./test.sh
		fi
	fi
done

rm -rf ./recordings/filesToBeSent/
rm dataTransferMessage.txt
rm recordings.tar
rm finalDataPackage.tar
rm sha256Recordings.txt
