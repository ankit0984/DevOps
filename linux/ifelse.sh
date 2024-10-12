#!/bin/bash
# if [expressionn]
# then
#     command1
#     command2
#     ...
#     commandN
# else
#     command
# fi

a=10
b=20

if [ $a == $b ]
then
    echo "a is equal to b"
else
    echo "a is not equal to b"
fi
# iteration -> for

for i in {1..100}; do echo $i; done