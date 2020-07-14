#!/bin/bash

viewCustomers()
{
	./viewer.bash
}

#name checkers
#1. Duplicates
#2. Existence
checkDups()
{
	duplcate= false
	checker=`echo $name|grep ^$name$`

	if [ "$checker" == "$name" ]; then
		duplicate= true
	fi
}
getName()
{
	echo -e "\n"
	echo -n "Enter customer name: "
	read name

	if [ "$name" == "" ]; then
		echo "Please enter a customer name."
		getName
	fi
}
fixFile()
{
	sed -i "/^$/d" list.txt
}
menu()
{
	echo -e "What to do?"
	echo -e "\t(1) View customers"
	echo -e "\t(2) Add a customer"
	echo -e "\t(3) Delete a customer"
	echo -e "\t(q) Quit"
	echo -ne "\tChoose the number: "
	read choice
	case "$choice" in
		1)
			clear
			viewCustomers
			#echo "Would you like to edit the list of customers?(y/n)[ ]"\b\b\c
			;;
		2)
			getName
			checkDups
			echo $duplicate
			if [ "$duplicate" ]; then
				echo "Customer already exists!"
			else
				#add a name
				echo $name >> list.txt
			fi

			clear
			viewCustomers
			;;
		3)
			viewCustomers
			getName

			#check if name exists
			nameChecker=`cat list.txt|grep ^$name$`
			if [ "$nameChecker" == "" ]; then
				echo "Customer name is not on the list."
			else
				#delete the name from the file
				sed -i "/^$name$/d" list.txt
			fi

			fixFile
			clear
			viewCustomers
			;;
		q|Q)
			exit 0
			;;
		*)
			echo "Invalid Choice"
			exit 1
			;;
	esac
}

repeat=1
while [ "$repeat" -eq 1 ]; do
	menu
done

