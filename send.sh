#!/bin/bash

PROFILE=$1
FROM=$2

for i in {1..100}
do 
    aws ses --region us-west-2 --profile $PROFILE send-email --from $FROM --destination file://destination.json --message file://message.json
done
