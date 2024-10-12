#!/bin/bash
# logfile - find errord in the log file

curl https://github.com/iam-veeramalla/sandbox/blob/main/log/dummylog01122022.log | grep ERROR

# GET request to the api 
curl -X GET api.foo.com

# find any file in the system
sudo su - # switch to root
find / -name "filename" # use of find
