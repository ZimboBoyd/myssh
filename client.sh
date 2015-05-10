#!/bin/bash

echo "A $*"

while : ; do 
  sleep 30
  echo "B $*"
done

exec sleep infinity
