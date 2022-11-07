#!/bin/sh

while [ -n "$1" ]
do
case "$1" in
    -p) PORT="$2";;

    -b) BOARDNAME="$2";;

    --) shift
    break ;;

    *.ino) FILENAME=$1;;
     --) shift
     break ;;
     
    *) GENERAL=$1;;
esac
shift
done

count=1
for param in "$@"
do
echo "Parameter #$count: $param"
count=$(( $count + 1 ))
done

if [ -f "./sketch.json" ]; then
    BOARDNAME=$(jq .cpu sketch.json | jq .fqbn -r)
    PORT=$(jq .port -r sketch.json)
    FILENAME=$(jq .file -r sketch.json)
fi

if [ -z $FILENAME ]; then
    echo "Provide a filename to compile."
elif [ -z $PORT ]; then
    echo "Provide a port to upload."
elif [ -z $BOARDNAME ]; then
    echo "Provide a boardname to compile and upload"
else
    arduino-cli compile --fqbn $BOARDNAME $FILENAME 
    arduino-cli upload -b $BOARDNAME -p $PORT $FILENAME
fi
