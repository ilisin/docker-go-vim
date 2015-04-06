#!/bin/sh
tar xvf ./go1.4.2.linux-amd64.tar.gz
tar xvf ./src.tar.gz
tar xvf ./vim74.tar.gz
tar xvf ./_vim.tar.gz
docker build -t centos-go-vim ./
docker run -d --name go-vim-d -p 222:22 centos-go-vim
#docker run -it --rm centos-go-vim
