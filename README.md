# CSPFileViewDownload
This is basically a CSP based application. You can view the file from the server and download the file from the server

http:// server:port/webapp/CSPFile.DownloadFile.cls?file=directoryandfilename 
ex: http://localhost:52773/csp/healthshare/learning/CSPFile.ViewFile.cls?file=C:\Users\download.pdf

View files

![image](https://github.com/AshokThangavel/CSPFileViewDownload/assets/58914152/d67af609-bc9b-4344-b509-68cd7654be9d)



## Installation with Docker

### Prerequisites
Make sure you have [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) and [Docker desktop](https://www.docker
.com/products/docker-desktop) installed.

## Installation
Clone/git pull the repo into any local directory

```
$ git clone https://github.com/AshokThangavel/CSPFileViewDownload
```

Open the terminal in this directory and run:

```
$ docker-compose build
```

Run the IRIS container with your project:

```
$ docker-compose up -d
```

And to view the protocol open in the browser:
http://localhost:52663/csp/user/CSPFile.ViewFile.cls?file=/usr/irissys/mgr/messages.log

Or download file from server
http://localhost:52663/csp/user/CSPFile.DownloadFile.cls?file=/usr/irissys/dev/python/intersystems_irispython-3.2.0-py3-none-any.whl