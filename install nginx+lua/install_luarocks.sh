#!/bin/env bash

cd /usr/src
tar -zxvf luarocks-2.2.2.tar.gz
cd luarocks-2.2.2
./configure --with-lua="/usr/local/luajit" --lua-suffix="jit"  --with-lua-include="/usr/local/luajit/include/luajit-2.0"  --rocks-tree=/usr/local/luajit --sysconfdir=/usr/local/etc/luarocks
make build
make install
exit 1