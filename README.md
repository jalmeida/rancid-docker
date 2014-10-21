rancid-docker
=============

Rancid Docker


git clone https://github.com/jalmeida/rancid-docker.git

sudo docker build -t=jalmeida/rancid:test .
sudo docker run -t -i jalmeida/rancid:test


sudo docker run -t -i -v /opt/docker-shared/rancid/etc:/home/rancid/etc -v /opt/docker-shared/rancid/var:/home/rancid/var jalmeida/rancid:test



WITH VIEWVC DOCKER 

sudo docker run -t -i -v /opt/docker-shared/rancid/etc:/home/rancid/etc -v /opt/docker-shared/rancid/var:/home/rancid/var jalmeida/rancid:test
sudo docker run -p 55581:80 -d -v /opt/docker-shared/rancid/var:/opt/cvs jalmeida/viewvc:test
