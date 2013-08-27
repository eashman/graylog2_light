
## Installation Options ##
server_version = "0.13.0-rc.1"
default[:graylog2_light][:server][:version]           = "graylog2-server-#{server_version}"
default[:graylog2_light][:server][:download_url]      = "https://github.com/Graylog2/graylog2-server/releases/download/#{server_version}"
default[:graylog2_light][:server][:download_filename] = ""
default[:graylog2_light][:server][:installation_path] = "/opt"
default[:graylog2_light][:server][:installation_dir]  = "graylog2"
default[:graylog2_light][:server][:pid_dir]           = "/var/run/graylog2"
default[:graylog2_light][:server][:log_dir]           = "/var/log/graylog2_server"
##


## Graylog2.conf Options ##
default[:graylog2_light][:server][:syslog_listen_port] = 514
default[:graylog2_light][:server][:syslog_protocol]    = "udp"
default[:graylog2_light][:server][:force_syslog_rdns] = false
default[:graylog2_light][:server][:allow_override_syslog_date] = false

default[:graylog2_light][:server][:mongodb_max_connections] = 100
default[:graylog2_light][:server][:mongodb_threads_allowed_to_block_multiplier] = 5

default[:graylog2_light][:server][:mq_batch_size] = 4000
default[:graylog2_light][:server][:mq_poll_freq] = 1
default[:graylog2_light][:server][:mq_max_size] = 0

default[:graylog2_light][:server][:use_gelf] = true
default[:graylog2_light][:server][:gelf_listen_address] = "0.0.0.0"
default[:graylog2_light][:server][:gelf_listen_port] = 12201

default[:graylog2_light][:server][:amqp_enabled] = false
default[:graylog2_light][:server][:amqp_subscribed_queues] = "somequeue1:gelf,somequeue2:gelf,somequeue3:syslog"
default[:graylog2_light][:server][:amqp_host] = "localhost"
default[:graylog2_light][:server][:amqp_port] = 5672
default[:graylog2_light][:server][:amqp_username] = "guest"
default[:graylog2_light][:server][:amqp_password] = "guest"
default[:graylog2_light][:server][:amqp_virtualhost] = "/"

default[:graylog2_light][:server][:forwarder_loggly_timeout] = 3
##


## Graylog2 Elasticsearch Proxy Options ##
default[:graylog2_light][:server][:elasticsearch][:discovery] = false
default[:graylog2_light][:server][:elasticsearch][:cluster_name] = "graylog2"

default[:graylog2_light][:server][:elasticsearch][:node_name] = "graylog2-proxy"
default[:graylog2_light][:server][:elasticsearch][:node_master] = false
default[:graylog2_light][:server][:elasticsearch][:node_data] = false
default[:graylog2_light][:server][:elasticsearch][:network_host] = "0.0.0.0"
default[:graylog2_light][:server][:elasticsearch][:transport_tcp_port] = 9350
default[:graylog2_light][:server][:elasticsearch][:http_enabled] = true

default[:graylog2_light][:server][:elasticsearch][:discovery_zen_ping_multicast_address] = "172.24.0.14"
default[:graylog2_light][:server][:elasticsearch][:discovery_zen_ping_multicast_group] = "224.0.0.1"
default[:graylog2_light][:server][:elasticsearch][:discovery_zen_minimum_master_nodes] = 1
default[:graylog2_light][:server][:elasticsearch][:discovery_zen_ping_timeout] = "3s"
default[:graylog2_light][:server][:elasticsearch][:discovery_zen_ping_unicast_hosts] = ["host1", "host2:port", "host3[portX-portY]"]

default[:graylog2_light][:server][:elasticsearch_shards]   = 5
default[:graylog2_light][:server][:elasticsearch_replicas] = 1


##