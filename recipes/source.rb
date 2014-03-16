#
# Cookbook Name:: duplicity
# Recipe:: source
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
# ====================================
# Performs an installation from source
# ====================================

# minimal compile set packages
# for backend protocols, see backends
%w{checkinstall python-lockfile python-dev librsync-dev}.each do |pkg|
  package pkg
end


src_filepath = "#{Chef::Config['file_cache_path'] || '/tmp'}/duplicity-#{node['duplicity']['source']['version']}.tar.gz"
src_url = node['duplicity']['source']['url']
src_dir_unpack = "#{Chef::Config['file_cache_path'] || '/tmp'}/duplicity-#{node['duplicity']['source']['version']}"

remote_file src_url do
  source    src_url
  path      src_filepath
  checksum  node['duplicity']['source']['checksum']
  backup    false
end

bash 'unarchive_source' do
  cwd ::File.dirname(src_filepath)
  code <<-EOH
    tar zxf #{::File.basename(src_filepath)} -C #{::File.dirname(src_filepath)}
  EOH
  not_if { ::File.directory?(src_dir_unpack) }
end

checkinstall_opts = []
checkinstall_opts << '-D'
checkinstall_opts << '-y'
checkinstall_opts << '--fstrans=no'
checkinstall_opts << '--nodoc'
checkinstall_opts << "--pkgname='duplicity#{node['duplicity']['source']['version']}'"
checkinstall_opts << "--pkgversion='#{node['duplicity']['source']['version']}'"
checkinstall_opts << "--provides='duplicity'"
checkinstall_opts << "--maintainer=ted@nephilagraphic.com"

bash 'compile_duplicity_source' do
  cwd  src_dir_unpack
  code "checkinstall #{checkinstall_opts.flatten.join ' '} python setup.py install"
  not_if "dpkg -l | grep duplicity#{node['duplicity']['source']['version']}"
end