#!/bin/bash

# Run as
# ./test.sh "./a.out" "./out/"
# Where a.out is the compiled binary and ./out/ is the output directory.
# Makes a bunch of files for you to enjoy

# CDs to the current directory of the file
DIR=`echo $0 | sed -E 's/\/[^\/]+$/\//'`
if [ "X$0" != "X$DIR" ]; then
	cd "$DIR"
fi

runIt() {
	EXECUTABLE=$1
	INPUT_FILE=$2
	OUTPUT_DIR=$3
	INDEX=$4
	BLOCK_SIZE=$5
	ASSOC=$6
	BRANCH_TAKEN=$7

	INPUT=$(printf "\n%d %d %d\n%d" $INDEX $BLOCK_SIZE $ASSOC $BRANCH_TAKEN)
	INPUT="$INPUT_FILE$INPUT"
	if [ $BRANCH_TAKEN -eq 1 ]; then
		OUTPUT=$(printf "taken-%d-%d-%d.out.txt" $INDEX $BLOCK_SIZE $ASSOC)
		OUTPUT="$OUTPUT_DIR$OUTPUT"
	else
		OUTPUT=$(printf "nottaken-%d-%d-%d.out.txt" $INDEX $BLOCK_SIZE $ASSOC)
		OUTPUT="$OUTPUT_DIR$OUTPUT"
	fi
	echo $INPUT | "$EXECUTABLE" > "$OUTPUT"
}

runIt "$1" "instruction-trace.txt" "$2" 6 1 1 0
runIt "$1" "instruction-trace.txt" "$2" 6 2 1 0
runIt "$1" "instruction-trace.txt" "$2" 6 4 1 0
runIt "$1" "instruction-trace.txt" "$2" 6 1 2 0
runIt "$1" "instruction-trace.txt" "$2" 6 2 2 0
runIt "$1" "instruction-trace.txt" "$2" 6 4 2 0
runIt "$1" "instruction-trace.txt" "$2" 6 1 4 0
runIt "$1" "instruction-trace.txt" "$2" 6 2 4 0
runIt "$1" "instruction-trace.txt" "$2" 6 4 4 0
runIt "$1" "instruction-trace.txt" "$2" 6 1 1 1
runIt "$1" "instruction-trace.txt" "$2" 6 2 1 1
runIt "$1" "instruction-trace.txt" "$2" 6 4 1 1
runIt "$1" "instruction-trace.txt" "$2" 6 1 2 1
runIt "$1" "instruction-trace.txt" "$2" 6 2 2 1
runIt "$1" "instruction-trace.txt" "$2" 6 4 2 1
runIt "$1" "instruction-trace.txt" "$2" 6 1 4 1
runIt "$1" "instruction-trace.txt" "$2" 6 2 4 1
runIt "$1" "instruction-trace.txt" "$2" 6 4 4 1
