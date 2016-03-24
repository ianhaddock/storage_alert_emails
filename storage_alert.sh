#!/bin/sh 
#Ian haddock August 19, 2014 
#This script is run by TypeIt4Me in my email client to generate the weekly file storage check email

#alert variables 

WARNFULL=85
MAXFULL=95
BARLENGTH=40

#storage devices

MEDIA=$(df -H | grep "WCMO_Media");
DELIVERY=$(df -H | grep WCMO_Delivery);

# TBD: check if drives are mounted, if not, mount drives

# start the email 

echo " " 
echo "Hello, weekly stats:"
echo "" 
echo "SAN Usage:"
echo ""
echo $DELIVERY | awk '{print $9" --- "$4" free of "$2"."}';
CURRENTFULL=$(df -H | grep WCMO_Delivery | awk '{print $5+0}');
~/Dropbox/Scripts/percentfull.sh $CURRENTFULL $BARLENGTH

if [ $CURRENTFULL -gt $WARNFULL ]
then
	echo "\n*WARNING* Free space below threshold. Please clear space.\n"
fi
if [ $CURRENTFULL -gt $MAXFULL ]
then
	echo "*\nCRITICAL* Free space below minimum. Please clear space. \n"
fi

echo "";

echo $MEDIA | awk '{print $9" --- "$4" free of "$2"."}';
CURRENTFULL=$(df -H | grep WCMO_Media | awk '{print $5+0}');
~/Dropbox/Scripts/percentfull.sh $CURRENTFULL $BARLENGTH
if [ $CURRENTFULL -gt $WARNFULL ]; then
	echo "*\nWARNING* Free space below threshold. Please clear space. *WARNING* \n"
fi;
if [ $CURRENTFULL -gt $MAXFULL ]; then
	echo "*\nCRITICAL* Free space below minimum. Please clear space *CRITICAL* \n"
fi;

echo "" 

# TBD: get access to DIVArchive API to pull storage report

echo "Front Porch:"
echo " * ENTER-VALUE-HERE Tb Free"
echo "" 
echo "Maintenance:"
echo "* CatDV Worker Node restarted"
echo "* WCMOMacCaption1 checked"
echo "* Brocade Fiber Switches checked"
echo ""
echo "Thanks,"
echo "Ian "
echo ""


