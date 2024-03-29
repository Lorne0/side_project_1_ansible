# ref: https://jimmylab.wordpress.com/2018/12/05/ssh-docker-container/
FROM ubuntu:16.04
  
RUN apt-get update && apt-get install -y openssh-server openssh-client vim
RUN mkdir /var/run/sshd
RUN echo 'root:ansible_node' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
  
# SSH login fix. Otherwise user is kicked off after login
# RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
# ENV NOTVISIBLE "in users profile"
# RUN echo "export VISIBLE=now" >> /etc/profile
  
EXPOSE 22
# CMD ["/bin/bash"]
CMD ["/usr/sbin/sshd", "-D"]