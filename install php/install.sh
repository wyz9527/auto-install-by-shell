#!/bin/env bash
#先按照FreeType
cd  /usr/src
wget http://download.savannah.gnu.org/releases/freetype/freetype-2.4.0.tar.bz2
tar -jxf freetype-2.4.0.tar.bz2
cd reetype-2.4.0
# 安装到/usr/local/freetype
./configure --prefix=/usr/local/freetype
make
make install
#安装php
cd /usr/src
install_path="/usr/local/php"
tar -zxvf php-5.5.5.tar.gz
cd php-5.5.5
./configure --prefix=/usr/local/php --enable-fpm --enable-shared --with-libxml-dir --with-gd --with-openssl --enable-mbstring --with-mcrypt --with-mysqli="mysqlnd" --with-mysql --enable-opcache --enable-mysqlnd --enable-zip --with-zlib-dir --with-pdo-mysql --with-jpeg-dir --with-freetype-dir --with-curl --without-pdo-sqlite --without-sqlite3 --with-mcrypt --enable-mbstring --enable-pdo --disable-debug --disable-rpath --enable-inline-optimization --with-bz2 --with-zlib --enable-sockets --enable-sysvsem --enable-sysvshm --enable-pcntl --enable-mbregex --with-mhash --enable-zip --with-pcre-regex  --with-freetype-dir=/usr/local/freetype
make
make install
cp php.ini-production /usr/local/php/lib/php.ini
cd /usr/local/php
cp etc/php-fpm.conf.default etc/php-fpm.conf
#安装memcache扩展和redis扩展
cd /usr/src
wget http://pecl.php.net/get/memcache-2.2.7.tgz
tar zxvf memcache-2.2.7.tgz
cd memcache-2.2.7
/usr/local/php/bin/phpize
./configure --enable-memcache --with-php-config=/usr/local/php/bin/php-config --with-zlib-dir
make
make install
cd /usr/src
#wget https://github.com/nicolasff/phpredis/archive/phpredis-2.2.4.tar.gz
wget http://pecl.php.net/get/redis-2.2.4.tgz
tar zxvf redis-2.2.4.tgz
cd redis-2.2.4
/usr/local/php/bin/phpize
./configure --with-php-config=/usr/local/php/bin/php-config
make
make install
#vi /usr/local/php/lib/php.ini
#添加 extension=redis.so
#添加 extension=memcache.so
exit 1