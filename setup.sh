#!/bin/bash

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" 
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd "$DIR/abcm2ps"
./configure && make
cd ..
mv abcm2ps/abcm2ps abc2ps && chmod +x abc2ps
cd abcmidi
./configure && make
cd ..
mv abcmidi/abc2abc . && chmod +x abc2abc
mv abcmidi/abc2midi . && chmod +x abc2midi
mv abcmidi/abcmatch . && chmod +x abcmatch
mv abcmidi/midi2abc . && chmod +x midi2abc
