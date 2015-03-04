#
# Cookbook Name:: textsecure
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

git "textsecure-server" do
  destination "/home/vagrant/textsecure-server"
  repository node['textsecure']['git_repository']
  revision node['textsecure']['git_revision']
  action :sync
end
