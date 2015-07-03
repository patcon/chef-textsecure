user node['textsecure']['user'] do
  supports :manage_home => true
  home "/home/#{node['textsecure']['user']}"
  shell "/bin/bash"
end

directory node['pushserver']['install_dir'] do
  owner node['textsecure']['user']
  group node['textsecure']['user']
  recursive true
end

version = node['pushserver']['version']
cached_download = "#{Chef::Config['file_cache_path']}/Push-Server-#{version}-capsule-fat.jar"

remote_file cached_download do
  source "https://bintray.com/artifact/download/patcon/generic/Push-Server-#{version}-capsule-fat.jar"
end

remote_file "#{node['pushserver']['install_dir']}/Push-Server.jar" do
  source "file://#{cached_download}"
  owner node['textsecure']['user']
  group node['textsecure']['user']
  mode "0664"
end
