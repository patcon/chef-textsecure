config = node['textsecure']['config'].to_hash

file "#{node['textsecure']['install_dir']}/config.yml" do
  content config.to_yaml
  owner node['textsecure']['user']
  group node['textsecure']['user']
  mode '0644'
  subscribes :create, "dropwizard[textsecure]", :delayed
end
