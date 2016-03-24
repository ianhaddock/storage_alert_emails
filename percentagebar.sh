#!/bin/sh 
# by Ian haddock August 23, 2014
# pass 2 variables - percent and length - and output a ASCII meter bar

## Input Variables 

PERCENT=$1
LENGTH=$2
i=0;
z=1000; 


# check variables were passed to script or return help

if [ $# != 2 ] 
then
   echo " "
   echo "Error: Please pass the percentage full and the desired length:"
   echo " " 
   echo "$ percentagebar 25 25"
   echo "[=======___________________] 25% Full"
   echo " " 
   exit 1;
fi


## Do some math to get around floating point 

FIXEDPERFULL=$(echo "scale = 1; (10*$PERCENT)" | bc );
PERBAR=$(echo "scale = 1; (100/$LENGTH)*10" | bc );
FIXEDPERBAR=${PERBAR%.*};

## Output the bar

printf "[";

while [ $i -le $z ]
do
	if [ $FIXEDPERFULL -ge $i ]; then
		printf "=";
		i=$(($i+$FIXEDPERBAR));
	else	
		printf "_";
		i=$(($i+$FIXEDPERBAR));
	fi;
done
printf "] ";

echo $PERCENT"% Full";

exit 0;


