#!/bin/sh
set -e

if [ -z $AWS_SECRET_ACCESS_KEY ]; then
  echo "No SECRET_KEY provided Using system default"
fi

if [ -z $AWS_ACCESS_KEY_ID ]; then
  echo "No KEY_ID provided Using system default"
fi

if [ -z $SOURCE_PATH ]; then
  echo "No Source path found exiting....."
  exit 1;
fi

if [ -z $BUCKET_PATH ]; then
  echo "No destination bucket path found exiting...."
  exit 1;
fi

while true
do
	if [ -z $USE_SYNC ]
	then
	  echo "Coping files to bucket"
	  aws s3 cp $SOURCE_PATH $BUCKET_PATH/$HOSTNAME
	else
	  echo "Sync files to bucket"
	  aws s3 sync $SOURCE_PATH $BUCKET_PATH/$HOSTNAME
	fi
	sleep $CRON_INTERVAL
done
