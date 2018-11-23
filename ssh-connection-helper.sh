#!/bin/bash
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

ls Scripte/bookmarks/ | sed -E -e 's/[[:blank:]]+/\n/g' >> $SCRIPTPATH/tmp2
file2=$SCRIPTPATH/tmp2
counter2=1
while read d
do
			echo "Number: "$counter2 "Name: "$d >> $SCRIPTPATH/tmp3
			let counter2++
done < $file2
cat $SCRIPTPATH/tmp3
echo
read -p "Customer Number : " chosen
echo
list="$(cat $SCRIPTPATH/tmp3 | grep " $chosen " | awk -F ':' '{print $3}' | sed -e 's/ //g')"
rm -rf $SCRIPTPATH/tmp*



file=$SCRIPTPATH/bookmarks/$list
counter=1
while read p
	do
			echo "Number: "$counter "Name: "$p >> $SCRIPTPATH/bookmarks/tmp
			let counter++
	done < $file
cat $SCRIPTPATH/bookmarks/tmp
echo
read -p "Server Number : " ssh
echo
read -e -p "Username : " -i "root" user
echo $user



ssh20="$(cat "$SCRIPTPATH"/bookmarks/tmp | grep " ${ssh} " | awk -F ':' '{print $3}' | sed -e 's/ //g')"
echo $ssh20
rm $SCRIPTPATH/bookmarks/tmp
ssh -l $user -i ~/.ssh/id_rsa $ssh20
