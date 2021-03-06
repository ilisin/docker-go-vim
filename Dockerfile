FROM centos:7
MAINTAINER ilisin gao <lisin.gao@gmail.com>

RUN yum update -y
RUN yum remove vi -y
RUN yum install -y passwd openssh-server initscripts
RUN yum install -y gcc make git
RUN yum install -y ruby ruby-devel lua lua-devel luajit luajit-devel ctags python \
  python-devel tcl-devel ncurses-devel

RUN echo 'root:root123' | chpasswd
RUN /usr/sbin/sshd-keygen

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

RUN echo "export GOROOT=/opt/go" >> /root/.bashrc
RUN echo "export GOARCH=amd64" >> /root/.bashrc
RUN echo "export GOOS=linux" >> /root/.bashrc
RUN echo "export GOPATH=/workplace/go" >> /root/.bashrc
RUN echo "export PATH=$PATH:$GOPATH/bin:$GOROOT/bin" >> /root/.bashrc

RUN /bin/sh /gobin-build.sh

VOLUME /workplace

EXPOSE 22 1000 1001 1002 1003 1004 1005 1006 1007 1008 1009 1010

CMD /usr/sbin/sshd -D
