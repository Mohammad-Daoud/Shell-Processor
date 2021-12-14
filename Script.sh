#!/bin/bash 

########################################################################
# Author: Motasem Aldiab, Fahed Jubair, Mohammad Daoud
# Version: v1.0.0
# Date: 2021-11-24
# Description: This script will do three main function by
#	write -- mdss [directory] [option] [information] 
#		the option will be as follow : 
# 	- ana : " which means analytics, 
#		then followed by the regex that you are going to count.
#
#	- del :  which mean delete, followed by the biggest file size. 
#		Files larger than that should be deleted.
#
#	- arr : which mean arrange,followd by the file 
#	 	type you are going to arrange in one new directory
#
# Usage: ./mdss.sh
########################################################################



# reading input form user
echo "Enter the follow pattern
[directory] [ana || del || arr ] [info file size, regex or file type ] for more help type --help"

read directory option information

if [[ "$directory" == "--help" ]] 
then
echo "[directory] [option] [information] the process will be as follow : 

[directory] : the directory need to work on.

[option] which take one of three arguments :
 	- ana : which means analytics, 
		then followed by the regex that you are going to count.

	- del :  which mean delete, followed by the biggest file size. 
		Files larger than that should be deleted.

	- arr : which mean arrange,followd by the file 
	 	type you are going to arrange in one new directory.

[information] will be either regex, file size to delete or, the file type. (only file type .i.e txt, sh,java ..etc) 

	.i.e Atypon ana f
	.i.e Atypon del 1M
	.i.e Atypon arr txt

"
exit
fi

dir_processor(){

# To go into user-directory
if [[ -d "$directory" ]];
then
	cd $directory
else
	 echo "DIRECTORY NOT FOUND !! re-run the process 
	for help type --help" 
	exit
fi

# the option part
#for analytics 
if [[ "$option" == "ana" ]]
then
	echo "The regex pattern ($information) has been detected, the result:"
	grep -o -i -r -a ${information} * |wc -l
 

# for delete files 
elif [[ "$option" == "del" ]]
then
	find -size +$information -delete
	echo "All file that more than $information, are deleted "
# for arrange 
elif [[ "$option" == "arr" ]]
then
echo "Enter the file name to move files of type $information to " 
read file_name
	mkdir $file_name
	mv *.$information $file_name
else 
echo "missing arguments for help enter --help"
fi	
}

dir_processor
