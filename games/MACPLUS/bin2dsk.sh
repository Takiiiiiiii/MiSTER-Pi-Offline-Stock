#!/bin/bash
set -euo pipefail

STUFF_IT_URL="http://web.archive.org/web/20060205025441/http://www.stuffit.com/downloads/files/stuffit520.611linux-i386.tar.gz"
DC2DSK_URL="http://www.bigmessowires.com/dc2dsk.c"

function echo_err {
  echo $@ 1>&2
}

# Check for input filename
if [[ $# -ne 1 ]] || [[ ! -f ${INPUT_FILE:=$1} ]]; then
  echo_err "Usage: $0 <INPUT_FILE>"
  exit 2
fi

# Check that input is a compatable type
if ! file $INPUT_FILE | grep "MacBinary II" >/dev/null; then
  echo_err "Input file is not MacBinary II. This process only works with MacBinary II formatted bin files"
  exit 2
fi

# Check for nesseary commands
if ! command -v ${UNSTUFF_CMD:=unstuff} >/dev/null; then
  echo_err "'unstuff' command is missing. Download it from $STUFF_IT_URL"
  echo_err "The 'unstuff' command can be set by exporting path as 'UNSTUFF_CMD'"
  exit 3
fi

if ! command -v ${UNAR_CMD:=unar} >/dev/null; then
  echo_err "'unar' command is missing."
  echo_err "The 'unar' command can be set by exporting path as 'UNAR_CMD'"
  exit 3
fi

if ! command -v ${DC2DSK_CMD:=dc2dsk} >/dev/null; then
  echo_err "'dc2dsk' command is missing."
  echo_err "Source can be downloaded from $DC2DSK_URL and compiled with 'gcc -o dc2dsk dc2dsk.c'"
  echo_err "The 'dc2dsk' command can be set by exporting path as 'DC2DSK_CMD'"
  exit 3
fi

# Do the work
mkdir ${TEMP_DIR:=$(pwd)/unstuffout-$RANDOM}
$UNSTUFF_CMD --destination=$TEMP_DIR $INPUT_FILE
$UNAR_CMD -o - $TEMP_DIR/*.data | $DC2DSK_CMD > ${INPUT_FILE:0:-4}.dsk
rm -rf $TEMP_DIR
