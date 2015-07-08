version = node['textsecure']['version']
cached_download = "#{Chef::Config['file_cache_path']}/TextSecureServer.jar"

remote_file cached_download do
  source node['textsecure']['jar_download_url']
  source ""
end

remote_file "#{node['textsecure']['install_dir']}/TextSecureServer.jar" do
  source "file://#{cached_download}"
  owner node['textsecure']['user']
  group node['textsecure']['user']
  mode "0664"
end
