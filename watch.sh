#!/bin/bash
WATCHDIR="/home/linux/sftp-watch/sftp/user1/IN /home/linux/sftp-watch/sftp/user2/IN"
inotifywait -m $WATCHDIR  -e create -e moved_to -e delete |
while read path action file; do
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] File '$file' $action in directory '$path'"
    echo "[$timestamp] File '$file' $action in directory '$path'" >> ./sftp_activity.log
done
