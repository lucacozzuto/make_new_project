#!/bin/bash
#
# This script make the structure for the new project

# specify the name of the project
if [ x"$1" == x ]; then

        echo "please specify the name of the project: example RNAseq_mouse"

        exit 1

fi

if [ x"$2" == x ]; then

        echo "please add the name of the PI or the user name: example lcozzuto"

        exit 1

fi

if [ x"$3" == x ]; then

        echo "please add the name of the person that asked the analysis: example Luca_Cozzuto"

        exit 1

fi

if [ x"$4" == x ]; then

        echo "please specify the root of the folder structure"

        exit 1

fi

# Define a timestamp function
timestamp() {
  date  +"%Y-%m-%d"
}

stamp=`timestamp`
root=$4

group_path=$root"/"$2
upath=$group_path"/"$3

	if [ -d $upath"/"$stamp"-"$1 ]; then 
		echo "ERROR!! Folder $upath"/"$stamp"-"$1 already found!!!"
		exit
	fi
	if [ ! -d $group_path ]; then
		echo "ERROR!! No folder "$group_path " found!!! Please create it"
		exit
	fi
	if [ ! -d $upath ]; then
		echo "Missing member $3 of the group $2 that is requesting the analysis. Please create $upath!"
		exit;
	fi


mkdir $upath"/"$stamp"-"$1
mkdir $upath"/"$stamp"-"$1"/data"
mkdir $upath"/"$stamp"-"$1"/results"
mkdir $upath"/"$stamp"-"$1"/analysis"
mkdir $upath"/"$stamp"-"$1"/docs"
touch $upath"/"$stamp"-"$1"/docs/README.txt"
mkdir $upath"/"$stamp"-"$1"/src"

echo "### Please add here some description about the project "$1 >> $upath"/"$stamp"-"$1"/docs/README.txt"

abs_path=`readlink -f $upath"/"$stamp"-"$1`


echo "*** Please add this path to your LIMS in order to keep track: $abs_path ***"

chmod 775 -R $upath"/"$stamp"-"$1
