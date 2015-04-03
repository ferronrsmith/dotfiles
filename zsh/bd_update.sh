#!/bin/bash

_BANG_PATH=$(
  BIN_PATH="$0"
  (
    cd $(dirname "$BIN_PATH") > /dev/null
    echo -n "$PWD"
  )
)

me=`basename $0`

cd $_BANG_PATH

package="bdutil-latest.tar.gz"

RCol='\e[0m'    # Text Reset

# Regular
Bla='\e[0;30m';
Red='\e[0;31m';
Gre='\e[0;32m';
Yel='\e[0;33m';
Blu='\e[0;34m';
Pur='\e[0;35m';
Cya='\e[0;36m';
Whi='\e[0;37m';

echo -e "${Yel}removing existing bdutil"
find ! -name "${me}" -exec rm -rf {} \; 2> /dev/null


echo -e "downloading latest bdutil ${Pur}"
wget https://storage.googleapis.com/hadoop-tools/bdutil/"${package}"

echo "extracting latest bdutil"
tar vxf "${package}" --strip=1
rm -f "${package}"

echo -e "${Gre}bdutil version $(cat VERSION) installed"