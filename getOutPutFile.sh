#!/bin/bash

testgetOutPutFile=1
. getIndicatorName.sh 
function getOutPutFile() {

	indicator=$1
	x_seed=$2
	y_seed=$3
	z_seed=$4
	echo $indicator 
	echo $x_seed
	echo $y_seed
	echo $z_seed

	indicatorName=""
        getIndicatorName $indicator indicatorName

	echo $indicatorName

	eval "$5='output_${indicatorName}_${x_seed}_${y_seed}_${z_seed}'"
} 

if [ $testgetOutPutFile = "1" ]; then 

	echo "We are testing"
	x=1
	y=2
	z=3
	indicator=2
	getOutPutFile $indicator $x $y $z nameOfOutputFile
	echo $nameOfOutputFile
fi


