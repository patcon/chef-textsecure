user node['textsecure']['user'] do
  supports :manage_home => true
  home "/home/#{node['textsecure']['user']}"
  shell "/bin/bash"
end

servers = ['textsecure', 'pushserver']

servers.each do |server|
  directory node[server]['install_dir'] do
    owner node['textsecure']['user']
    group node['textsecure']['user']
    recursive true
  end
end
