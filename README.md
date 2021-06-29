# CTFD Windesheim
Voor de opdracht Techniek in de praktijk D, is deze vulnarable docker image gemaakt.

# Perpose of this docker container
The purpose of this container is to learn people hacking via ssh.
The container is hosting a very minimal php program wich let you ping and check if a domain or ip is "online".
First the student or player needs to nmap the host and discover that port 2222 and 8080 are open.
Port 8080 for the webapplication
Port 2222 for ssh

## Inject
One can inject a command after the domain or ip one wants to ping. For example:
```
google.com; ls -l
```
the first execution by php will ping google to check if its alive. After that it will execute the ls -l command.

# How To solve this container
Oke, oke, Dont mention to your students or players that your hosting our container, because the following information will let them solve this puzzle 
very quick....

There are 2 flags hidden.
```
google.com; ls -la /home #Will output the content of the /home dir
```
There you will find an user "kaas".
Go deeper in the home of kaas.
```
google.com; ls -la /home/kaas
```
One will find an hidden file called .oldPassFile.
This file contains two things:
1. a flag 
2. credentials to log in with ssh
```
ssh -p 222 kaas@"yourContainersHostIpAddress"
```
Your now in the system. 
In the .ssh folder, one can find a config wich will let you login straight to root on the same system.
There one can find the second flag in a file called youMadeIt

# Run this image
```
docker build -t windesheim-tidpD .
docker run -d -p 2222:22 -p 8080:80 --name ctf-container windesheim-tidpD
```

## Explained ports
|Port | Purpose | Desciption |
|--|--|--|
|8080 | exposed port for apache2 webApp | Application via web for check if site is reachable via ping commands |
|2222 | exposed port for ssh deamon | Ssh running in the container can be reached via this exposed port |

