user node[:graylog2_light][:user] do
  comment "graylog2 server user"
  gid node[:graylog2_light][:group]
  action :create
  supports :manage_home => true
  shell "/bin/bash"
  home "/home/#{node[:graylog2_light][:user]}"
end