#!/bin/bash

s=$(<"$1")
if [ $s -gt 0 ]; then
  let s=s-1
  echo $s > $1
else
  if [ -e "lock.dat" ]; then
    rm "lock.dat"
    sleep 0.1
  fi

  touch "lock.dat"
  while [ -e "lock.dat" ]; do
    sleep 0.1
  done
fi

