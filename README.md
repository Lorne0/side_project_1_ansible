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
	* docker-compose up --scale node=3 -d
		* this would create 3 nodes, and the name would be [dir]_node\_[123]
		* Since my dir name is "p1", the containers for me are p1\_node\_1, p1\_node\_2, p1\_node\_3  
		* Also the defect of docker-compose is that we can't decide each hostname of the containers 
	* Turn on the 3 terminals
	* ```docker exec -it p1_node_1 /bin/bash```
		* p1\_node\_2, p1\_node\_3 for other terminals
	* Find the IP Address of the container
		* ```docker inspect p1_node_2 | grep "IPAddress"```
		* In my computer it is ```172.18.0.3```
	* Connect from node1 to node2
		* (In n1 terminal) ```ssh root@172.18.0.3``` 
		* Type the password in the Dockerfile
	* (Optional) ssh from your host to the container
		* Use ```docker ps -a``` to see the corresponding port for the container
		* ```ssh -p 49001 root@localhost```
3. Add SSH Key to avoid connecting with password every time
	* Switch to node1 
	* ```ssh-keygen```
		* Type Enter until it's done 
	* ```ssh-keyscan -H 172.18.0.3 >> ~/.ssh/known_hosts```
		* In my case, 172.18.0.3 is the ip of node2, 172.18.0.2 is the one of node3
		* run this line to avoid the checking of add key
		* or you can skip this line and type yes XD
	* ```ssh-copy-id root@172.18.0.3``` 
		* then type the password
	* Repeat the last two steps for node3 with the corresponding IP
	* ```ssh root@172.18.0.3``` to check the connection  
4. ~






