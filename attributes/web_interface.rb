default[:graylog2_light][:web_interface][:ruby_version]      = "1.9.3p448"

## Installation Options ##
default[:graylog2_light][:web_interface][:version]           = "0.20.1"
default[:graylog2_light][:web_interface][:download_url]      = "https://github.com/Graylog2/graylog2-web-interface/releases/download"
default[:graylog2_light][:web_interface][:download_filename] = "graylog2-web-interface"
default[:graylog2_light][:web_interface][:installation_path] = "/opt"
default[:graylog2_light][:web_interface][:installation_dir]  = "graylog2-web_interface"
default[:graylog2_light][:web_interface][:pid_dir]           = "/var/run/graylog2_web"
default[:graylog2_light][:web_interface][:log_dir]           = "/var/log/graylog2_web"
##

## General Options ##
default[:graylog2_light][:web_interface][:server_uris]        = "127.0.0.1:9300,127.0.0.2:9300"
default[:graylog2_light][:web_interface][:application_secret] = "CHANGEME"
##