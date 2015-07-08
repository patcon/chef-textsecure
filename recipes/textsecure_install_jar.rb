filename = File.basename(node['textsecure']['jar_download_url'])
cached_download_path = File.join(Chef::Config['file_cache_path'], filename)

remote_file cached_download_path do
  source node['textsecure']['jar_download_url']
end

remote_file "#{node['textsecure']['install_dir']}/TextSecureServer.jar" do
  source "file://#{cached_download_path}"
  owner node['textsecure']['user']
  group node['textsecure']['user']
  mode "0664"
end
