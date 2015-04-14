#
# Cookbook Name:: textsecure
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'git'

git "pushserver" do
  destination node['pushserver']['git_dir']
  repository node['pushserver']['git_repository']
  revision node['pushserver']['git_revision']
  action :sync
end

diff_file = nil

if !!node['pushserver']['disable_apn'] and !!node['pushserver']['disable_gcm']
  diff_file = "disable-apn-gcm.diff"
elsif !!node['pushserver']['disable_apn']
  diff_file = "disable-apn.diff"
elsif !!node['pushserver']['disable_gcm']
  diff_file = "disable-gcm.diff"
end

if !!diff_file
  diff_filepath = "#{Chef::Config['file_cache_path']}/#{diff_file}"

  cookbook_file diff_file do
    path diff_filepath
  end

  execute "reverting-git-changes" do
    cwd node['pushserver']['git_dir']
    command "git checkout -- ."
  end

  execute "patching-to-disable-push-service" do
    cwd node['pushserver']['git_dir']
    command "patch --strip=0 < #{diff_filepath}"
  end
end

file "#{node['pushserver']['git_dir']}/local.yml" do
  content node['pushserver']['config'].to_hash.to_yaml
end

include_recipe "maven"

execute "mvn package" do
  cwd node['pushserver']['git_dir']
end
