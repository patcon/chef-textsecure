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

databases.each do |db|
  cmd_prefix = "java -jar TextSecureServer.jar"
  execute "migrating-#{db}" do
    command "#{cmd_prefix} #{db} migrate config.yml"
    user node['textsecure']['user']
    group node['textsecure']['user']
    cwd node['textsecure']['install_dir']
  end

  check_db_cmd = "#{cmd_prefix} #{db} status config.yml | grep 'is up to date'"

  log "checking-migrations-#{db}" do
    message "There were problems migrating #{db} database!"
    level :fatal
    not_if check_db_cmd, cwd: node['textsecure']['install_dir']
  end
end
