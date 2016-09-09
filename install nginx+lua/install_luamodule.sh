#!/bin/env bash
#按照需要的扩展模块
luarocks install luasocket
luarocks install lua-cjson
luarocks install luacurl
luarocks install lua-resty-memcached
luarocks install json2lua
luarocks install lua2json
cp -a /usr/src/upload.lua /usr/local/luajit/share/lua/5.1/upload.lua