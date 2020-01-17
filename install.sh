#!/bin/bash

# please set environmental variable "AW_DATASET_PATH" in ~/.bashrc
source ~/.bashrc

if [ -z $AW_DATASET_PATH ];then
  echo "please set environment variable AW_DATASET_PATH"
elif [ ! -d $AW_DATASET_PATH ];then
  echo "cannot find $AW_DATASET_PATH"
else
  roscd dataset_manager || {
    echo "failed to change directory"
    return
  }
  rm -rf link
  ln -s $AW_DATASET_PATH link
  echo "$AW_DATASET_PATH"
  echo "success to install dataset!!!"
fi
