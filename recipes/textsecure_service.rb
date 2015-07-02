dropwizard 'textsecure' do
  path node['textsecure']['install_dir']
  user node['textsecure']['user']
  group node['textsecure']['user']
  jar_file "#{node['textsecure']['install_dir']}/TextSecureServer.jar"
  arguments 'server local.yml'
end
