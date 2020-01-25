#!/bin/bash
#
# input env vars:
# - AW_INSTALL_PATH
# - AW_DATASET_PATH
#
# please export the above vars in .profile and .bashrc
#

source ${AW_INSTALL_PATH}/setup.sh
current_dir=`pwd`

autoware_dataset_path=${AW_DATASET_PATH}
if [ -z "${autoware_dataset_path}" ];then
  echo "please set environment variable AW_DATASET_PATH"
elif [ ! -d ${autoware_dataset_path} ];then
  echo "cannot find ${autoware_dataset_path}"
else
  install_dir=`rospack find dataset_manager`
  if [ -e ${install_dir} ]; then
    cd ${install_dir}
    rm -rf link
    ln -s ${autoware_dataset_path} link
    echo "${autoware_dataset_path}"
    echo "success to install dataset!!!"
  fi
fi
cd ${current_dir}
unset current_dir
unset autoware_dataset_path
