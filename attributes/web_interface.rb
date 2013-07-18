default[:graylog2_light][:web_interface][:ruby_version]      = "1.9.3p448"

## Installation Options ##
default[:graylog2_light][:web_interface][:version]           = "0.12.0"
default[:graylog2_light][:web_interface][:download_url]      = "https://github.com/Graylog2/graylog2-web-interface/archive"
default[:graylog2_light][:web_interface][:download_filename] = ""
default[:graylog2_light][:web_interface][:installation_path] = "/opt"
default[:graylog2_light][:web_interface][:installation_dir]  = "graylog2-web_interface"
default[:graylog2_light][:web_interface][:pid_dir]           = "/var/run/graylog2_web"
default[:graylog2_light][:web_interface][:log_dir]           = "/var/log/graylog2_web"
##


## General Options ##
default[:graylog2_light][:web_interface][:external_hostname]   = "your-graylog2.example.org"
default[:graylog2_light][:web_interface][:date_format]         = "%d.%m.%Y - %H:%M:%S"
default[:graylog2_light][:web_interface][:allow_version_check] = true
default[:graylog2_light][:web_interface][:secret_token]        = "CHANGE ME"
##


## Indexer Options ##
default[:graylog2_light][:web_interface][:indexer_url]    = "http://localhost:9200/"
default[:graylog2_light][:web_interface][:indexer_prefix] = "graylog2"
##