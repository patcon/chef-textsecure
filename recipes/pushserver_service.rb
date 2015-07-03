dropwizard 'pushserver' do
  path node['pushserver']['install_dir']
  user node['textsecure']['user']
  group node['textsecure']['user']
  jar_file "#{node['pushserver']['install_dir']}/Push-Server.jar"
  arguments 'server config.yml'
end
