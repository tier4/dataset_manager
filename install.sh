#!/bin/bash

# Copyright 2019-2020 TierIV, inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

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
