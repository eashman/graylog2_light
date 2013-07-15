download_filename = "#{node[:graylog2_light][:server][:download_filename]}#{node[:graylog2_light][:server][:version]}.tar.gz"
installation_dir = "#{node[:graylog2_light][:server][:installation_path]}/#{node[:graylog2_light][:server][:installation_dir]}"

user node[:graylog2_light][:user] do
  comment "graylog2 server user"
  gid node[:graylog2_light][:group]
  system true
  action :create
end

remote_file "#{node[:graylog2_light][:tmp_dir]}/#{download_filename}" do
  source "#{node[:graylog2_light][:server][:download_url]}/#{download_filename}"
  mode "0644"
  not_if { ::File.exists?("#{node[:graylog2_light][:tmp_dir]}/#{download_filename}") }
end

execute "untar_graylog2" do
  cwd node[:graylog2_light][:tmp_dir]
  command <<-EOF
    tar -xzvf #{download_filename} -C #{node[:graylog2_light][:server][:installation_path]}
    cd #{node[:graylog2_light][:server][:installation_path]} && mv graylog2-server-* #{installation_dir}
    chown -R graylog2:graylog2 #{installation_dir}
    EOF
  not_if { ::File.exists?(installation_dir) }
  not_if {installation_dir == "/"}
end

template "/etc/graylog2.conf" do
  source "graylog2.conf.erb"
  user node[:graylog2_light][:user]
end

template "/etc/graylog2-elasticsearch.yml" do
  source "graylog2-elasticsearch.yml.erb"
  user node[:graylog2_light][:user]
end