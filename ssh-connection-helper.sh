#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
#echo $SCRIPTPATH/tmp
file=$SCRIPTPATH/list
counter=1
while read p
        do
                        echo "Number: "$counter "Name: "$p >> $SCRIPTPATH/tmp
                        let counter++
        done < $file
cat $SCRIPTPATH/tmp
echo
echo "Which Server do you want to connect to?"
read ssh
echo "Which User do you want to use?"
read user
ssh20="$(cat "$SCRIPTPATH"/tmp | grep " ${ssh} " | awk -F ':' '{print $3}' | sed -e 's/ //g')"
rm $SCRIPTPATH/tmp
#echo $ssh20
ssh -l $user -i ~/.ssh/id_rsa $ssh20
