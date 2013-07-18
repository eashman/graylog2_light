## Environment Options ##
default[:graylog2_light][:user]    = "graylog2"
default[:graylog2_light][:group]   =  nil
default[:graylog2_light][:tmp_dir] = "/tmp"
default[:graylog2_light][:gem_path] = "/usr/local/rvm/gems/ruby-1.9.3-p448"
##


## Elasticsearch Connection Details ##
default[:graylog2_light][:elasticsearch_url] = "http://localhost:9200/"
default[:graylog2_light][:elasticsearch_index_name] = "graylog2"
##


## MongoDB Connection Details ##
default[:graylog2_light][:mongodb_host] = "localhost"
default[:graylog2_light][:mongodb_port] = 27017
default[:graylog2_light][:mongodb_database] = "graylog2"
default[:graylog2_light][:mongodb_useauth] = false
default[:graylog2_light][:mongodb_user] = ""
default[:graylog2_light][:mongodb_password] = ""
##