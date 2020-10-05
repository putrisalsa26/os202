#!/bin/bash

#files
LOG_FILE = "mylog.txt"
FILES="mylog.txt mypubkey.txt myrank.txt myscript.sh"
SHA="SHA256SUM"

#menu option
echo "Menu: "
echo "1) Add log"
echo "2) Sign files"
echo "Choose menu: "
read choose_menu

if [ $(($choose_menu)) -eq 1]
then
  #input
  echo "Week (ex: W01): "
  read week
  echo "Duration (minute): "
  read duration
  echo "Log code: "
  read log_code
  echo "Description: "
  read desc

  #append to a file
  printf "\nZCZC $week $duration $log_code $desc">> mylog.txt

  #open the file
  cat mylog.txt
  echo "Success"
  fi

elif [ $(($choose_menu)) -eq 2]
then
  rm -f $SHA $SHA.asc

  echo "sha256sum $FILES > $SHA"
  sha256sum $FILES > $SHA

  echo "sha256sum -c $SHA"
  sha256sum -c $SHA

  echo "gpg -o $SHA.asc -a -sb $SHA"
  gpg -o $SHA.asc -a -sb $SHA

  echo "gpg --verify $SHA.asc $SHA"
  gpg --verify $SHA.asc $SHA

  echo "Success"
  fi

else
  echo "Try again"
  fi

exit 0

# Mon Sep 28 21:05:04 WIB 2020
