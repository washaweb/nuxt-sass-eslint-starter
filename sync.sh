#!/bin/bash

publish() {
  USERNAME=<EDITHERE>
  HOST=<EDITHERE>
  DIR=/<ROOT>/<OF>/YOUR>/<SERVER>/<FOLDER>
  
  echo "transfert build folder to preprod server"
  
  # must use a proxy index.cjs for pegasus phusion passenger to work with esm
  cp server/index.cjs .output/server/index.cjs
  
  
  
  #rsync OPTION SourceDirectory_or_filePath user@serverIP_or_name:Target

  rsync -vcae "ssh -p 22" --delete .output/public/ $USERNAME@$HOST:$DIR/public
  rsync -vcae "ssh -p 22" --delete .output/server/ $USERNAME@$HOST:$DIR/server

  echo "publish to preprod server ended - OK"
}

$*
