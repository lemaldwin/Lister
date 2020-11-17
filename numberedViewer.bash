#!/bin/bash



LIST=( `cat list.txt | tr "\n" " "` )


echo -e "This is a list of items:"
nl -s ") " <list.txt | pr -4 -t



#echo -n "Select an item on the list: "
read -p "Select an item: " CHOICE

(( CHOICE-- ))
case "$CHOICE" in
	0) 
		echo "This is the lore of ${LIST[$CHOICE]}."
		;;
	1)
		echo "This is the lore of ${LIST[$CHOICE]}."
		;;
	*)
		echo "This is the lore of "

esac

echo -e "\n\n\n"

