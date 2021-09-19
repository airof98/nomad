
log_level = "INFO"
datacenter = "dc1"
data_dir  = "/home/ec2-user/nomad/nomad.d"

consul {
  address = "127.0.0.1:8500"

  server_service_name = "nomad"
  client_service_name = "nomad-client"

  auto_advertise = true

  server_auto_join = true
  client_auto_join = true
}
