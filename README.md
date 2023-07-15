# nomad

```
nomad agent -config=./nomad.d
consul agent -config-dir=./consul.d
fabio -proxy.addr=":9999;proto=http,:8888;proto=grpc"

```

## web
nomad: http://localhost:4646/ui/jobs  
consul: http://localhost:8500/ui/dc1/services  
fabio: http://localhost:9998/routes     

## fabio
http://localhost:9999/http-echo

## docs
https://www.nomadproject.io/guides/install/quickstart/index.html   


## ec2 install
```
sudo yum install git tmux

sudo yum install yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum install nomad
sudo yum -y install consul

wget https://go.dev/dl/go1.20.6.linux-amd64.tar.gz
tar xvzf go1.20.6.linux-amd64.tar.gz
# add gopath, go/bin gopath/bin
export GOPATH=/home/ec2-user/gopath
export PATH="$PATH:/home/ec2-user/go/bin:$GOPATH/bin"

go install github.com/fabiolb/fabio@latest

sudo yum install docker -y
docker -v
sudo service docker start
sudo usermod -aG docker ec2-user

git clone https://github.com/airof98/nomad.git
```

