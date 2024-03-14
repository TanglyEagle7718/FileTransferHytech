#!/bin/bash

mkdir tmpFolder

tar -xf  finalDataPackage.tar -C ./tmpFolder

cd tmpFolder

checksum=$(head -n1 sha256Recordings.txt)
echo $checksum

archiveChecksum=$(sha256sum recordings.tar | awk '{print $1}')
echo $archiveChecksum

if [ "$checksum" = "$archiveChecksum" ];
then
	echo "great!" > dataTransferMessage.txt
	rsync -au dataTransferMessage.txt practiceubuntu@[IP address]:~/Documents
else
	echo "mismatch! resend data" > dataTransferMessage.txt
	rsync -au dataTransferMessage.txt practiceubuntu@[IP address]:~/Documents
fi


cd ..
