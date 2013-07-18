# Use this to install Apache + Passenger with rvm.

include_recipe "graylog2_light::web_interface"

packages = %w{apache2-mpm-worker apache2-threaded-dev libapr1-dev libaprutil1-dev}

packages.each do |pkg|
  package pkg
end

execute "passenger-install-apache2-module --auto" do
  not_if {File.exists?("#{node[:graylog2_light][:gem_path]}/gems/#{node[:graylog2_light][:web_rvm_apache][:passenger_version]}/buildout/apache2/mod_passenger.so")}
end

template "/etc/apache2/conf.d/passenger" do
  source "web_apache2_passenger.conf.erb"
end

template "/etc/apache2/sites-available/graylog2" do
  source "web_apache2_graylog2.conf.erb"
end

link "/etc/apache2/sites-enabled/graylog2" do
  to "/etc/apache2/sites-available/graylog2"
end

service "apache2" do
  supports :status => true, :restart => true, :reload => true
  action [ :enable, :restart ]
end