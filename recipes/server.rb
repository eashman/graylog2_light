include_recipe "graylog2_light::user"

download_filename = "#{node[:graylog2_light][:server][:download_filename]}#{node[:graylog2_light][:server][:version]}.tar.gz"
installation_dir = "#{node[:graylog2_light][:server][:installation_path]}/#{node[:graylog2_light][:server][:installation_dir]}"
pid_file = "#{node[:graylog2_light][:server][:pid_dir]}/graylog2_server.pid"

Chef::Log.warn("derp: #{node[:graylog2_light][:server][:download_url]}/#{download_filename}")

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
    chown -R #{node[:graylog2_light][:user]}:#{node[:graylog2_light][:user]} #{installation_dir}
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

["log_dir", "pid_dir"].each do |dir|
  directory node[:graylog2_light][:server][dir] do
    user node[:graylog2_light][:user]
    group node[:graylog2_light][:group]
  end
end

template "/home/#{node[:graylog2_light][:user]}/server_init_wrapper.sh" do
  source "server_init_wrapper.sh.erb"
  mode 0755
  variables(
    :jar => "#{node[:graylog2_light][:server][:installation_path]}/#{node[:graylog2_light][:server][:installation_dir]}/graylog2-server.jar",
    :pid_file => pid_file
  )
  user node[:graylog2_light][:user]
  group node[:graylog2_light][:group]
end

template "/etc/init.d/graylog2_server" do
  source "server_sysvinit.erb"
  mode 0755
  variables(
    :base_dir => "#{node[:graylog2_light][:server][:installation_path]}/#{node[:graylog2_light][:server][:installation_dir]}",
    :pid_file => pid_file
  )
end

service "graylog2_server" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :start ]
end