#!/bin/sh
tar xvf ./go1.4.2.linux-amd64.tar.gz
tar xvf ./src.tar.gz
tar xvf ./vim74.tar.gz
tar xvf ./_vim.tar.gz
docker build -t centos-golang-vim ./
exit 0
docker run -d --name go-vim-ilisin -p 2222:22 -p 20000:1000 \
  -p 20001:1001 \
  -p 20002:1002 \
  -p 20003:1003 \
  -p 20004:1004 \
  -p 20005:1005 \
  -p 20006:1006 \
  -p 20007:1007 \
  -p 20008:1008 \
  -p 20009:1009 \
  -p 20010:1010 \
  centos-golang-vim
#docker run -it --rm centos-go-vim
