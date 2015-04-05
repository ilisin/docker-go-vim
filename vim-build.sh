#!/bin/sh
cd /root/vim74/
./configure --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-luainterp --enable-gui=gtk2 --enable-cscope --with-tlib=ncurses --prefix=/usr
make && make install
cd ../
rm -rf vim74
