include_recipe "graylog2_light::user"

download_filename = "#{node[:graylog2_light][:web_interface][:download_filename]}-#{node[:graylog2_light][:web_interface][:version]}.tgz"
installation_dir = "#{node[:graylog2_light][:web_interface][:installation_path]}/#{node[:graylog2_light][:web_interface][:installation_dir]}"
download_path = "#{node[:graylog2_light][:web_interface][:download_url]}/#{node[:graylog2_light][:web_interface][:version]}/#{download_filename}"

log("Attempting to download Graylog2 web interface: #{download_path}")

remote_file "#{node[:graylog2_light][:tmp_dir]}/#{download_filename}" do
  source download_path
  mode "0644"
  not_if { ::File.exists?("#{node[:graylog2_light][:tmp_dir]}/#{download_filename}") }
end

execute "untar_graylog2_web" do
  cwd node[:graylog2_light][:tmp_dir]
  command <<-EOF
    tar -xzvf #{download_filename} -C #{node[:graylog2_light][:web_interface][:installation_path]}
    cd #{node[:graylog2_light][:web_interface][:installation_path]} && mv graylog2-web-interface-* #{installation_dir}
    chown -R #{node[:graylog2_light][:user]}:#{node[:graylog2_light][:user]} #{installation_dir}
    EOF
  not_if { ::File.exists?(installation_dir) }
  not_if {installation_dir == "/"}
end

template "#{installation_dir}/conf/graylog2-web-interface.conf" do
    source "web.conf.erb"
    user node[:graylog2_light][:user]
end