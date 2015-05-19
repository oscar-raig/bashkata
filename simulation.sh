
narg=""
iarg=""


set -x

. getOutPutFile.sh

getopt_results=`getopt abi:n:g: $*`

if test $? != 0
then
    echo "unrecognized option"
    echo 
    exit 1
fi

COMMAND=/Users/oscarraigcolon/Arrel/git/rebuild-graph/data/threshold_accepting/rebuild_graph/rebuild_graph

echo "GET OPTION $getopt_results"
eval set -- "$getopt_results"
echo $1
 for i
           do
                   case "$i"
                   in
                           -a|-b)
                                   echo flag $i set; sflags="${i#-}$sflags";
                                   shift;;
                           -i)
                                   echo iarg is "'"$2"' Indicator"; iarg="$2"; shift;
                                   shift;;
                           -n)
                                    echo "Number of executions"; narg="$2";
                                    echo "$narg";shift;
                                    shift;;
                           -g)
                                    echo "Graph File Name"; garg="$2";
                                    echo "$garg";shift;
                                    shift;;
                           --)
                                   shift; break;;
                   esac
           done
           echo single-char flags: "'"$sflags"'"
          


if test "x$narg" == "x"
then
    echo "$0: missing n ( number of execution) parameter"
    exit 1
fi

if test "x$iarg" == "x"
then
    echo "$0: missing i ( Indicator) parameter"
    exit 1
fi

if test "x$garg" == "x"
then
    echo "$0: missing g ( Graph) parameter"
    exit 1
fi

echo "Number of executions $narg"

for i in `seq 1 $narg`;
        do
                echo $i
		x=$i
		y=$i
		z=$i
		indicator=$iarg
		nameOfOutputFile=""
		getOutPutFile $indicator $x $y $z nameOfOutputFile
		echo $nameOfOutputFile
		ARGS1="  --graphFile ${garg} --algorithm ${iarg} --k 0.95 --To 0.3 --TMin 0.00001 --nMax 200  --output-format-adjlist"
		ARGS2=" --seed_x  ${x}  --seed_y  ${y}  --seed_z ${z} --threshold-accepting --outputFileSufix $nameOfOutputFile"
		`$COMMAND $ARGS1 $ARGS2 $nameOfOutputFile`

	done    
exit 0
