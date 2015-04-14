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

file "#{node['pushserver']['git_dir']}/local.yml" do
  content node['pushserver']['config'].to_hash.to_yaml
end

include_recipe "maven"

execute "mvn package" do
  cwd node['pushserver']['git_dir']
end
