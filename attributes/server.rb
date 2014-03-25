
## Installation Options
server_version = "0.20.1"
default[:graylog2_light][:server][:version]           = "graylog2-server-#{server_version}"
default[:graylog2_light][:server][:download_url]      = "https://github.com/Graylog2/graylog2-server/releases/download/#{server_version}"
default[:graylog2_light][:server][:installation_path] = "/opt"
default[:graylog2_light][:server][:installation_dir]  = "graylog2"
default[:graylog2_light][:server][:pid_dir]           = "/var/run/graylog2"
default[:graylog2_light][:server][:log_dir]           = "/var/log/graylog2_server"

## Elasticsearch
default[:graylog2_light][:server][:elasticsearch_shards] = 4
default[:graylog2_light][:server][:elasticsearch_replicas] = 3
default[:graylog2_light][:server][:elasticsearch_max_number_of_indices] = 20
default[:graylog2_light][:server][:elasticsearch_analyzer] = "standard"
default[:graylog2_light][:server][:elasticsearch_cluster_name] = "graylog2"
default[:graylog2_light][:server][:elasticsearch_unicast_hosts] = "127.0.0.1:9300,127.0.0.2:9300"
default[:graylog2_light][:server][:elasticsearch_max_docs_per_index] = "1000000"
default[:graylog2_light][:server][:elasticsearch_max_number_of_indices] = "10"
default[:graylog2_light][:server][:elasticsearch_retention_strategy] = "close"

## MongoDB
default[:graylog2_light][:server][:mongodb_useauth] = false
default[:graylog2_light][:server][:mongodb_host] = "127.0.0.1"
default[:graylog2_light][:server][:mongodb_database] = "graylog2"
default[:graylog2_light][:server][:mongodb_port] = 27017
default[:graylog2_light][:server][:mongodb_max_connections] = 100
default[:graylog2_light][:server][:mongodb_threads_allowed_to_block_multiplier] = 5

## Email
default[:graylog2_light][:server][:transport_email_enabled] = false
default[:graylog2_light][:server][:transport_email_hostname] = "mail.example.com"
default[:graylog2_light][:server][:transport_email_port] = 587
default[:graylog2_light][:server][:transport_email_use_auth] = true
default[:graylog2_light][:server][:transport_email_use_tls] = true
default[:graylog2_light][:server][:transport_email_use_ssl] = true
default[:graylog2_light][:server][:transport_email_auth_username] = "you@example.com"
default[:graylog2_light][:server][:transport_email_auth_password] = "secret"
default[:graylog2_light][:server][:transport_email_subject_prefix] = "[graylog2]"
default[:graylog2_light][:server][:transport_email_from_email] = "graylog2@example.com"

## Graylog Server
default[:graylog2_light][:server][:is_master] = true
default[:graylog2_light][:server][:node_id_file] = "/etc/graylog2-server-node-id"
default[:graylog2_light][:server][:root_password_sha2] = "SET ME"
default[:graylog2_light][:server][:password_secret] = "SET ME" #sha256 string
default[:graylog2_light][:server][:plugin_dir] = "plugin"
default[:graylog2_light][:server][:rest_listen_uri] = "http://0.0.0.0:12900/"
default[:graylog2_light][:server][:retention_strategy] = "delete"
default[:graylog2_light][:server][:allow_leading_wildcard_searches] = false
default[:graylog2_light][:server][:output_batch_size] = 5000
default[:graylog2_light][:server][:processbuffer_processors] = 5
default[:graylog2_light][:server][:outputbuffer_processors] = 5
default[:graylog2_light][:server][:processor_wait_strategy] = "blocking"
default[:graylog2_light][:server][:ring_size] = 1024
default[:graylog2_light][:server][:dead_letters_enabled] = false

default[:graylog2_light][:server][:extra_config] = {

}