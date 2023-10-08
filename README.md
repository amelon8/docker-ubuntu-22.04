### Notes
This Docker setup creates an Ubuntu 22.04 (jammy) image. On macOS, install [Docker Desktop](https://docs.docker.com/desktop/install/mac-install/, then follow the instructions below.

### Setup

* Switch to the project directory, then build the image.

    % cd docker-ubuntu-22.04
    % docker-compose build

### Usage

* Start up container

    % docker-compose up -d

* Check container status

    % docker-compose ps

* Shut down container

    % docker-compose down

* Start an interactive Bash session on the container. Note that the working directory is `/code` which maps to `code` in the project directory. You can edit files in the host environment (macOS) and then execute them in the container.

    % docker-compose exec ubu bash

    root@6e4a16fb9f14:/code# ls -la
    total 24
    drwxr-xr-x 6 root root  192 Oct  8 04:59 .
    drwxr-xr-x 1 root root 4096 Oct  7 23:19 ..
    -rw-r--r-- 1 root root    0 Oct  7 22:30 .gitignore
    -rwxr-xr-x 1 root root 9336 Oct  8 04:59 hello
    -rw-r--r-- 1 root root   84 Oct  8 04:59 hello.cc
    -rw-r--r-- 1 root root   24 Oct  7 23:26 hello.py

    root@6e4a16fb9f14:/code# rm hello

    root@6e4a16fb9f14:/code# ls -la
    total 12
    drwxr-xr-x 5 root root  160 Oct  8 05:00 .
    drwxr-xr-x 1 root root 4096 Oct  7 23:19 ..
    -rw-r--r-- 1 root root    0 Oct  7 22:30 .gitignore
    -rw-r--r-- 1 root root   84 Oct  8 04:59 hello.cc
    -rw-r--r-- 1 root root   24 Oct  7 23:26 hello.py

    root@6e4a16fb9f14:/code# cat hello.py
    print("Hello, Python!")

    root@6e4a16fb9f14:/code# python --version
    Python 3.10.12

    root@6e4a16fb9f14:/code# python hello.py
    Hello, Python!

    root@6e4a16fb9f14:/code# cat hello.cc
    #include <iostream>
    
    int main() {
        std::cout << "Hello, C++!\n";
        return 0;
    }

    root@6e4a16fb9f14:/code# g++ -o hello hello.cc

    root@6e4a16fb9f14:/code# ls -la hello
    -rwxr-xr-x 1 root root 9336 Oct  8 05:01 hello

    root@6e4a16fb9f14:/code# ./hello
    Hello, C++!
    
### Issues
* None

