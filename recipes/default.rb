#
# Cookbook Name:: textsecure
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

require 'yaml'

include_recipe 'git'

git "textsecure-server" do
  destination node['textsecure']['git_dir']
  repository node['textsecure']['git_repository']
  revision node['textsecure']['git_revision']
  action :sync
end

file "#{node['textsecure']['git_dir']}/local.yml" do
  content node['textsecure']['config'].to_hash.to_yaml
end

include_recipe "maven"

execute "mvn package" do
  cwd node['textsecure']['git_dir']
end
