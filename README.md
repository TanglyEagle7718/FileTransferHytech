This is a set of scripts that will help offload the MCAP files from the car -> pit wall/base station.

Scripts in car/ will be installed on the car's on-board computer
Scripts in pit\ wall/ will be installed on the pit wall/base station


In order to offload data:
1. On pit wall/base station, run the startReciever.sh script. This script will be started at the beginning of the base station's session and will be run in the background.
2. Whenever you want to send MCAP files, start the startMCAPTransfer.sh

How to start script on pit wall/base station:
command: ./startReciever.sh &
kill the process: ps -eaf | grep "/bin/bash ./startReciever.sh" | awk '{print $2}'| head -n1 | sudo xargs kill -9
