#!/bin/bash

docker stop container

docker rm container

docker pull cvetankapasinechka/cupinja:project  

docker run -d --name container -p 8080:8080 cvetankapasinechka/cupinja:project