@echo off
docker build -t my-demo-site .
docker run -d -t -p 81:80 --name my-demo-site-container my-demo-site
