#!/bin/bash
#下载核心程序
apt-get -y update
apt-get install -y screen
rm -rf /v2ray
mkdir /v2ray
cd /v2ray
rm -f /v2ray/v2ray
wget --no-check-certificate https://github.com/feidian8352/goorm-v2ray/blob/master/v2ray
#设置运行权限
chmod +x /v2ray/v2ray
rm -f /v2ray/v2ctl
wget --no-check-certificate https://github.com/feidian8352/goorm-v2ray/blob/master/v2ctl
chmod +x /v2ray/v2ctl
rm -f /v2ray/config.json
wget --no-check-certificate https://github.com/feidian8352/goorm-v2ray/blob/master/config.json


#修改系统为北京时间
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

screen -S v2 /v2ray/v2ray -config=/v2ray/config.json
# 开始后台运行
nohup /v2ray/v2ray -config=/v2ray/config.json >out.txt 2>&1 &
