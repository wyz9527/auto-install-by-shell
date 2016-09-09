#!/bin/env bash
#先按照luaJit
jit_path="/usr/local/luajit"
cd /usr/src
tar -zxvf LuaJIT-2.0.0-beta9.tar.gz
cd LuaJIT-2.0.0-beta9
make
make install PREFIX=${jit_path}
cd ${jit_path}"/bin"
ln -sf luajit-2.0.0-beta9 ${jit_path}"/bin/luajit"
ln -sf luajit-2.0.0-beta9 /usr/local/bin/luajit
#设置luajit环境变量
export LUAJIT_LIB=${jit_path}"/lib"
export LUAJIT_INC=${jit_path}"/include/luajit-2.0"
#安装 ngx_devel_kit (NDK) 模块
cd /usr/local
git clone https://github.com/simpl/ngx_devel_kit.git
#安装 lua-nginx-module 模块
cd /usr/local
git clone https://github.com/chaoslawful/lua-nginx-module.git
#nginx-http-concat 解压
cd /usr/src
cp -a nginx-http-concat.tar.gz /usr/local/src/nginx-http-concat.tar.gz
cd /usr/local/src
tar -zxvf nginx-http-concat.tar.gz
#安装nginx
cd /usr/src
tar -zxvf nginx-1.8.0.tar.gz
cd /usr/src/nginx-1.8.0
./configure --prefix=/usr/local/nginx --with-ld-opt="-Wl,-rpath,$LUAJIT_LIB"  --add-module=/usr/local/ngx_devel_kit --add-module=/usr/local/lua-nginx-module --add-module=/usr/local/src/nginx-http-concat
make -j2
make install
#启动nginx
#/usr/local/nginx/sbin/nginx -c /usr/local/nginx/conf/nginx.conf
exit 1