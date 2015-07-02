directory node['textsecure']['install_dir'] do
  owner node['textsecure']['user']
  group node['textsecure']['user']
  recursive true
end

version = node['textsecure']['version']
cached_download = "#{Chef::Config['file_cache_path']}/TextSecureServer-#{version}.jar"

remote_file cached_download do
  source "https://bintray.com/artifact/download/patcon/generic/TextSecureServer-#{version}.jar"
end

remote_file "#{node['textsecure']['install_dir']}/TextSecureServer.jar" do
  source "file://#{cached_download}"
  owner node['textsecure']['user']
  group node['textsecure']['user']
  mode "0664"
end
