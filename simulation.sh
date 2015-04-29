narg=""
iarg=""

getopt_results=`getopt abi:n:g: $*`

if test $? != 0
then
    echo "unrecognized option"
    echo 
    exit 1
fi

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

exit 0
