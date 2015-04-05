FROM centos:7
MAINTAINER ilisin gao <lisin.gao@gmail.com>

RUN yum update -y
RUN yum remove vi -y
RUN yum install -y gcc make git
RUN yum install -y ruby ruby-devel lua lua-devel luajit luajit-devel ctags python \
  python-devel tcl-devel ncurses-devel

COPY go /opt/go
COPY vim74 /root/vim74
ADD vim-build.sh /
ADD gobin-build.sh /
ADD _vimrc /root/

COPY src /workplace/go/src
#RUN mkdir -p /workplace/go/src

RUN /bin/sh /vim-build.sh
RUN mv /root/_vimrc /root/.vimrc
COPY _vim /root/.vim

ENV GOROOT /opt/go
ENV GOARCH amd64
ENV GOOS linux
ENV GOPATH /workplace/go
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

RUN /bin/sh /gobin-build.sh

CMD ["/bin/bash"]
