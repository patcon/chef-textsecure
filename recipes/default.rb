include_recipe 'java'
include_recipe 'redisio::default'
include_recipe 'redisio::enable'

include_recipe "textsecure::pushserver_install_#{node['pushserver']['install_method']}"
include_recipe 'textsecure::pushserver_configuration'
include_recipe 'textsecure::pushserver_service'

include_recipe "textsecure::textsecure_install_#{node['textsecure']['install_method']}"
include_recipe 'textsecure::textsecure_configuration'
include_recipe 'textsecure::textsecure_database'
include_recipe 'textsecure::textsecure_service'
