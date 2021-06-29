# CTFD Windesheim

Voor de opdracht Techniek in de praktijk D, is deze vulnarable docker image gemaakt.


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

