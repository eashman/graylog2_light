include_recipe "graylog2_light::user"

download_filename = "#{node[:graylog2_light][:web_interface][:download_filename]}#{node[:graylog2_light][:web_interface][:version]}.tar.gz"
installation_dir = "#{node[:graylog2_light][:web_interface][:installation_path]}/#{node[:graylog2_light][:web_interface][:installation_dir]}"

remote_file "#{node[:graylog2_light][:tmp_dir]}/#{download_filename}" do
  source "#{node[:graylog2_light][:web_interface][:download_url]}/#{download_filename}"
  mode "0644"
  not_if { ::File.exists?("#{node[:graylog2_light][:tmp_dir]}/#{download_filename}") }
end

remote_file "#{node[:graylog2_light][:tmp_dir]}/#{download_filename}" do
  source "#{node[:graylog2_light][:server][:download_url]}/#{download_filename}"
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

["general", "mongoid", "indexer", "ldap"].each do |template|
    template "#{installation_dir}/config/#{template}.yml" do
        source "web_#{template}.yml.erb"
        user node[:graylog2_light][:user]
    end
end

template "#{installation_dir}/config/initializers/secret_token.rb" do
    source "web_secret_token.rb.erb"
    user node[:graylog2_light][:user]
end

["build-essential", "libcurl4-openssl-dev", "libssl-dev", "zlib1g-dev", "libpcre3-dev"].each do |pkg|
    package pkg
end

# Chef gem_package resource isn't working with Ruby 1.9.3.
# # @TODO: investigate further and make this less disgusting :)
execute "gem install bundler passenger --no-rdoc --no-ri"

execute "build_graylog2_web" do
    cwd installation_dir
    user node[:graylog2_light][:user]
    command "bundle install --without=development --path vendor/bundle"
end