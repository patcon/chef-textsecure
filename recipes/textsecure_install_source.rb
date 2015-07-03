#
# Cookbook Name:: textsecure
# Recipe:: textsecure
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
  user node['textsecure']['user']
  group node['textsecure']['user']
  action :sync
end

include_recipe "maven"

execute "mvn package -DskipTests=true" do
  environment ({ 'HOME' => "/home/#{node['textsecure']['user']}" })
  user node['textsecure']['user']
  group node['textsecure']['user']
  cwd node['textsecure']['git_dir']
end

link "#{node['textsecure']['install_dir']}/TextSecureServer.jar" do
  to "#{node['textsecure']['git_dir']}/target/TextSecureServer-#{node['textsecure']['version']}.jar"
end
