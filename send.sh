#!/bin/bash

PROFILE=$1 # which AWS profile
NUMBER=$2 # how many to send
FROM=$3 # who we sending from
TO=$4 # who we sending to

x=1
sed -i "s/REPLACE_WITH_SENDER/$TO/g" destination.json
echo "Sending $NUMBER messages to $TO from $FROM"
for i in $(seq 1 $NUMBER)
do 
    sed -i "s/$x /$i /g" message.json
    x=$i
    aws ses --region us-west-2 --profile $PROFILE send-email --from $FROM --destination file://destination.json --message file://message.json
done

sed -i "s/$TO/REPLACE_WITH_SENDER/g" destination.json
sed -i "s/$x /1 /g" message.json
