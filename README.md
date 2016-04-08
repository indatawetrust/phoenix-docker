# phoenix-docker
Phoenix Framework dockerfile

### clone phoenix-docker
git clone https://github.com/indatawetrust/phoenix-docker.git && cd phoenix-docker

### build image
sudo docker build -t phoenix-docker .

### run container
sudo docker run -it -p 4000:4000 --name server phoenix-docker

### start container
sudo docker start server

### container bash
sudo docker exec -it server bash

### start phoenix server
elixir --detached -S mix phoenix.server

![localhost:4000](http://i.hizliresim.com/nMo9ZV.png)
