#!/bin/bash

viewList()
{
	./viewer.bash
}

#name checkers
#1. Duplicates - for add
#2. Existence - for delete
checkDups()
{
	duplicate=false
	checker=`grep ^$name$ list.txt`
	if [ "$checker" == "$name" ]; then
		duplicate=true
	fi
}
getName()
{
	echo -e "\n"
	echo -n "Enter name: "
	read name

	if [ "$name" == "" ]; then
		echo "Please enter the name."
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
	echo -e "\t(1) View List"
	echo -e "\t(2) Add an item"
	echo -e "\t(3) Delete an item"
	echo -e "\t(q) Quit"
	echo -ne "\tChoose the number: "
	read choice
	case "$choice" in
		1)
			clear
			viewList
			#echo "Would you like to edit the list?(y/n)[ ]"\b\b\c
			;;
		2)
			#Add Item
			getName
			checkDups
			if [ "$duplicate" == "true" ]; then
				echo "Item is already in list!"
			else
			{
				#add a name
				echo $name >> list.txt
			}
			fi
			clear
			viewList
			;;
		3)
			viewList
			getName

			#check if name exists
			nameChecker=`cat list.txt|grep ^$name$`
			if [ "$nameChecker" == "" ]; then
				echo "Item name is not on the list."
			else
			{
				#delete the name from the file
				sed -i "/^$name$/d" list.txt
			}
			fi

			fixFile
			clear
			viewList
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

