#
# Cookbook Name:: textsecure
# Recipe:: database
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "postgresql::server"

include_recipe "build-essential"
include_recipe "database::postgresql"

user node['textsecure']['dbuser'] do
  supports :manage_home => true
  home "/home/#{node['textsecure']['dbuser']}"
  shell "/bin/bash"
end

db_info = {
  host: "localhost",
  username: 'postgres',
  password: node['postgresql']['password']['postgres'],
}

postgresql_database_user node['textsecure']['dbuser'] do
  connection db_info
  password node['textsecure']['dbpass']
  action :create
end

databases = ["accountdb", "messagedb"]

databases.each do |dbname|
  database dbname do
    provider Chef::Provider::Database::Postgresql
    connection db_info
    action :create
  end

  postgresql_database_user node['textsecure']['dbuser'] do
    connection db_info
    database_name dbname
    privileges [:all]
    action :grant
  end
end
