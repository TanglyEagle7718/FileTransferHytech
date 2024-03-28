#! /bin/bash

cd recordings
mkdir filesToBeSent
cd ..

if [ -f dataTransferMessage.txt ];
then
	i=1
else
	mv -v ./recordings/recordings/* ./recordings/filesToBeSent/
fi

tar -cf recordings.tar ./recordings/filesToBeSent/

sha256sum recordings.tar | awk '{print $1}'  > sha256Recordings.txt

ipAddress=$(hostname -I | awk '{print $1}')
echo $ipAddress >> sha256Recordings.txt

tar -cf finalDataPackage.tar recordings.tar sha256Recordings.txt

rsync -au finalDataPackage.tar practicefedora@[Pit wall IP Address]:~/carData
