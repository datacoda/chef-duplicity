#
# Cookbook Name:: duplicity
# Recipe:: backends-sftp
#
# Copyright (C) 2014 Nephila Graphic
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Note: Duplicity 0.6.18 (standard on Ubuntu 12.04) has problems with sftp.
# Install duplicity from source 0.6.19+ to get it working.

package 'python-paramiko' do
  action :install
end
