#!/bin/bash

while [ -e "buffer.txt" ]; do
  # wait(data)
  ./wait.sh data.txt

  # wait(free)
  ./wait.sh free.txt

  # get item from buffer
  if [ -e "buffer.txt" ]; then
    buffer=$(<"buffer.txt")
    if [ ${#buffer} -gt 0 ]; then
      echo "Item Consumed=$buffer"
      if [[ $buffer == *Z ]]; then
        rm buffer.txt
      else
        echo "" > buffer.txt
      fi
    fi
  fi

  # signal(free)
  ./signal.sh free.txt
  
  # signal(space)
  ./signal.sh space.txt
done

echo "Production completed!"

