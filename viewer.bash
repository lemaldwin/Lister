#!/bin/bash

LIST=`cat list.txt`

declare -a CUSTOMERARR=($LIST)

#determine number of columns
columns=4


#max number of characters alloted per customer
maxchar=12

echo -e "\nList of Customers:\n"
echo -n "	"
counter=0
for customer in ${CUSTOMERARR[*]}; do
	((counter++))
	echo -n $customer

	length=${#customer}
	if [ "$length" -lt "$maxchar" ]; then
		while [ "$length" -lt "$maxchar" ]; do
			echo -n " "
			((length++))
		done
	fi
	echo -n " "
	if [ "$counter" -eq "$columns" ]; then
		echo " "
		echo -n "	"
		counter=0
	fi
done
echo -e "\n\n"
#echo "hello"

exit 0
