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
  revision node['textsecure']['git_revision'] || "v#{node['textsecure']['version']}"
  user node['textsecure']['user']
  group node['textsecure']['user']
  action :sync
end

config = node['textsecure']['config'].to_hash

file "#{node['textsecure']['git_dir']}/local.yml" do
  owner node['textsecure']['user']
  group node['textsecure']['user']
  content config.to_yaml
end

include_recipe "maven"

execute "mvn package" do
  environment ({ 'HOME' => "/home/#{node['textsecure']['user']}" })
  user node['textsecure']['user']
  group node['textsecure']['user']
  cwd node['textsecure']['git_dir']
end

version = node['textsecure']['version']
databases = ['accountdb', 'messagedb']

databases.each do |db|
  cmd_prefix = "java -jar target/TextSecureServer-#{version}.jar"
  execute "migrating-#{db}" do
    command "#{cmd_prefix} #{db} migrate local.yml"
    user node['textsecure']['user']
    group node['textsecure']['user']
    cwd node['textsecure']['git_dir']
  end

  check_db_cmd = "#{cmd_prefix} #{db} status local.yml | grep 'is up to date'"

  log "checking-migrations-#{db}" do
    message "There were problems migrating #{db} database!"
    level :fatal
    not_if check_db_cmd, cwd: node['textsecure']['git_dir']
  end
end
