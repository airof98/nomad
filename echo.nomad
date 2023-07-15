job "http-echo" {
    
  datacenters = ["dc1"]

  type = "service"

  group "echo" {
    
    count = 3

    restart {
      attempts = 2
      delay    = "60s"
    }

    update {
      canary       = 1
      max_parallel = 1
      health_check = "checks"
      auto_revert  = true
      auto_promote = true
    }

    network {
      port "api" {
        to      = 8080
      }
    }

    service {
      name = "http-echo"
      tags = ["urlprefix-/http-echo"]
      port = "api"

      check {
        type     = "http"
        path     = "/health"
        interval = "2s"
        timeout  = "2s"
      }
    }

    task "api" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo:latest"
        args  = [
          "-listen", ":8080",
          "-text", "Hello World!",
        ]
        ports = ["api"]
      }

      resources {
      }
    }
  }
}