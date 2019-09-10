### Side Project 1: Ansible Practice

### Goal: Use Docker container to simulate multiple servers environment, then use Ansible to do config management. 

Setting

* Macbook Air
* Use [Docker Desktop for Mac](https://docs.docker.com/docker-for-mac/install/)

Steps:

1. Run ```docker build -t ubuntu:basic .```
	* If you didn't pull ubuntu:16.04, it would pull the image 
	* Change the password in Dockerfile
2. Start the container & test ssh connection
	* ```docker run --rm -it -p 49101:22 --name n1 ubuntu:basic```
		* Then run ```service ssh restart``` 
		* (I can't figure out how to add this line in Dockerfile and run automatically)
	* Turn on the other terminal
	* ```docker run --rm -it -p 49102:22 --name n2 ubuntu:basic```
		* Then run ```service ssh restart``` 
	* Turn on the other terminal
	* Find the IP Address of the container
		* ```docker inspect n2 | grep "IPAddress"```
		* In my computer it is ```172.17.0.3```
	* Connect from n1 to n2
		* (In n1 terminal) ```ssh root@172.17.0.3``` 
		* Type the password in the Dockerfile
	* (Optional) ssh from your host to the container
		* ```ssh -p 49154 root@localhost```
		* That's why I specify the port when starting the container

