
server {
  enabled          = true
  bootstrap_expect = 3

  server_join {
    retry_join = ["172.31.42.117:4648"]
  }
}