#!/bin/bash

mkdir tmpFolder

tar -xf  finalDataPackage.tar -C ./tmpFolder

cd tmpFolder

checksum=$(head -n1 sha256Recordings.txt)
ipAddress=$(tail -n1 sha256Recordings.txt)
echo $checksum
echo $ipAddress

archiveChecksum=$(sha256sum recordings.tar | awk '{print $1}')
echo $archiveChecksum

if [ "$checksum" = "$archiveChecksum" ];
then
	echo "great!" > dataTransferMessage.txt
else
	echo "mismatch! resend data" > dataTransferMessage.txt
fi


rsyncCommand="rsync -au dataTransferMessage.txt practiceubuntu@$ipAddress:~/Documents"
eval $rsyncCommand


cd ..
