#!/bin/bash


helpFunction()
{
   echo "Usage: Creating .nes files [ -d Directory ] [ -C ConfigWithPath ] [ -c Config ] [ -o OutputFile ] [ -r ] [ -a ] [ -h ] 

This script creates an \".o\" output file, compiling a whole NES game project

Usage:
-d		With these parameter you specify a directory, in which all the source files are located 
		( Usually it is a /src folder ). 
			E.g: -d some_project/src		OR		-d some_project/src/
		Handles both styles
-c		Here you cpecify a configuration file for NES ( Usually nes.cfg )
		Uses directory, that is one layer above -d Directory that was specified 
			E.g: -c example.cfg				OR		-c example
		!!! 
		NOTE:
		IF you are using -c key, you have to pay atteintion, that the script will search for a specified .cfg gile in the directory, that is one layer above the last one, specified with -d key
		Example: -f some_dir/nes_projects/example_project/src -c example.cfg
			In this case the script will be searched in the \"example_project folder\"
		!!!
-C		Here is a full path to a configuration file, using if .cfg file is specified elswhere
			E.g: -C path/to/file/example.cfg
-o		a name of output .nes file, can be specified both with ot without path, depends on needs
			E.g: -o path/to/file/output		OR		-o output.nes
-r		Specify, if want to remove all created .o files ( usually not in use, made just in case )
-a		To see, what commands are runned ( echoing them )
-h		For help"

   exit 1 # Exit script after printing help
}


# get all parameters
removeOFiles=0
showCommands=0
while getopts "d:c:C:o:rah" opt
do
	case "$opt" in
		d ) asmDirectory="$OPTARG" ;;
		c ) configFileName="$OPTARG" ;;
		C ) configPathFileName="$OPTARG" ;;
		o ) outputFileName="$OPTARG" ;;
		r ) removeOFiles=1 ;;
		a ) showCommands=1 ;;
		h ) helpFunction ;;
		? ) helpFunction ;; # Print helpFunction in case parameter is non-existent
	esac
done

# Print helpFunction in case parameters are empty
if [ -z "$asmDirectory" ] || [ -z "$configFileName" ] && [ -z "$configPathFileName" ] || [ -z "$outputFileName" ] ; then
	echo "Some of the required parameters are missing. use \"nes_o.sh -h\" to see help"
	exit 2
fi


# cut the last '/' character if present
lengthWithoutSlash=$((${#asmDirectory}-1))
if [ "${asmDirectory:lengthWithoutSlash}" == "/" ] ; then
	asmDirectory=${asmDirectory::-1}
fi

# specifying config file name with path to it
config=""
if [ -z "$configPathFileName" ] ; then
	config=${asmDirectory%/*}/$configFileName
	echo $config
else
	config=$configPathFileName
fi

# add .cfg if necessary
lengthWithoutDot=$((${#config}-4))
if [ "${config:lengthWithoutDot}" != ".cfg" ] ; then
	config=$config.cfg
fi

# add .nes if necessary
lengthWithoutDot=$((${#outputFileName}-4))
if [ "${configFileName:lengthWithoutDot}" != ".nes" ] ; then
	outputFileName=$outputFileName.nes
fi

# Begin script in case all parameters are correct
echo "Creating a NES file..."

startDirectory=$(pwd)
cd $asmDirectory

filesString=""
asmFiles=$(find -name "*.asm")

for file in $asmFiles ; do
	fileName=${file:1:-4}.o
	filesString="$filesString$asmDirectory$fileName "

	ca65 $file
	if [ $showCommands == 1 ] ; then 
		echo ca65 $file
	fi 
done

cd $startDirectory

ld65 $filesString -C $config -o $outputFileName
nesCreated=$?
if [ $showCommands == 1 ] ; then
	echo ld65 $filesString -C $config -o $outputFileName
fi 

if [ $nesCreated == 0 ]
then
	echo	[+] .nes file successfully created
else
	echo	[-] an error occured, while creating a .nes file
fi

if [ $removeOFiles == 1 ] ; then
	for file in $asmFiles ; do
		rm "$asmDirectory${file:1:-4}.o"
		if [ showCommands == 1 ] ; then 
			echo rm $asmDirectory${file:1:-4}.o
		fi 
	done
	echo "[+] .o files are deleted"
fi
