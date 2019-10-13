#!/bin/bash
# Author:  iphiderpro
# Operating System:  CentOS5×  centos6×
printf "
#######################################################################
#                         IpHiderPro                                  #
#             Determine the operating system 32 or 64                 #
#                       Please wait 5 s                               #
#######################################################################
"
ldconfig
if [ $(getconf WORD_BIT) = '32' ] && [ $(getconf LONG_BIT) = '64' ] ; then
printf "
#######################################################################
#                         IpHiderPro                                  #
#              begin to install iphiderpro services 64bit             #
#              create  glibc.i686 libstdc++.so.6                      #
#######################################################################
"
sleep 5s
yum update -y
yum install wget -y
yum install php-mcrypt*  -y
yum install subversion -y
yum install screen -y
yum install glibc.i686 -y
yum install libstdc++.so.6 -y
cp /root/dmpz/ipserver2.tar.gz /root
cp /root/dmpz/iphider.sh /root
tar -xzvf ipserver2.tar.gz
echo "chmod a+x /root/ipserver2/start.sh" > /etc/rc.local
echo "/root/ipserver2/start.sh" > /etc/rc.local
echo "/root/iphider.sh" > /etc/rc.d/rc.local
#下边是针对有的系统加载不起自动运行的命令，现在接触到的均为软连接问题,并且根据系统执行/etc/rc.d/init.d/下服务的速度进行配置，稍微等等系统自动加载自启命令。
ln -sf /etc/rc.d/rc.local /etc/rc.local
cd ipserver2
bash start.sh
iptables -F
echo "iptables -F finish"
screen -ls
sleep 2s
screen -ls

else
printf "
#######################################################################
#                         IpHiderPro                                  #
#              begin to install iphiderpro services 32bit             #
#######################################################################
"
sleep 5s
yum update -y
yum install wget -y
yum install php-mcrypt*  -y
yum install subversion -y
yum install screen -y
cp /root/dmpz/ipserver2.tar.gz /root
cp /root/dmpz/iphider.sh /root
tar -xzvf ipserver2.tar.gz
echo "chmod a+x /root/ipserver2/start.sh" > /etc/rc.local
echo "/root/ipserver2/start.sh" > /etc/rc.local
echo "/root/iphider.sh" > /etc/rc.d/rc.local
#下边是针对有的系统加载不起自动运行的命令，现在接触到的均为软连接问题,并且根据系统执行/etc/rc.d/init.d/下服务的速度进行配置，稍微等等系统自动加载自启命令。
ln -sf /etc/rc.d/rc.local /etc/rc.local
cd ipserver2
bash start.sh
iptables -F
echo "iptables -F finish"
screen -ls
sleep 2s
screen -ls
fi

