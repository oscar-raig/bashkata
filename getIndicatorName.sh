#!/bin/bash   

#set -x

test="11"

function getIndicatorName() {
	indicator="$1"
	case "$1" in
	"1")
    	eval "$2='CC'"
	;;
	"2")
    	eval "$2='BC'"
	;;
	"3")
	eval "$2='CBC'"
    	;;
	*)
	eval "$2='ERROR'"
	;;
esac
} 


if [ $test = "1" ]; then
	echo "Test"
	indicatorName=""
	indicator="1"
	getIndicatorName $indicator indicatorName
	echo $indicatorName 
        indicator="2"
	getIndicatorName $indicator indicatorName
        echo $indicatorName
        indicator="3"
	getIndicatorName $indicator indicatorName
        echo $indicatorName
	indicator="4"
        getIndicatorName $indicator indicatorName
fi

