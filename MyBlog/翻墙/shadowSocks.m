

1、hostUS  "https://my.hostus.us/"

2、SSH互信
	1) 生成公钥
	首先检查本机公钥：
	$ cd ~/.ssh
	如果提示：No such file or directory 说明你是第一次使用git。如果不是第一次使用，请执行下面的操作,清理原有ssh密钥。
	$ mkdir key_backup$ cp id_rsa* key_backup$ rm id_rsa*
	生成新的密钥：
	$ ssh-keygen -t rsa -C “您的邮箱地址”
	在回车中会提示你输入一个密码，这个密码会在你提交项目时使用，如果为空的话提交项目时则不用输入。
	您可以在你本机系统盘下，您的用户文件夹里发现一个.ssh文件，其中的id_rsa.pub文件里储存的即为刚刚生成的ssh密钥。

	2)复制公共钥到网站

3、 ssh root @ ip ssh登录

4、head -n 1 /etc/issue         #查看系统消息

5、安装Shadowsockets

	Install

	1> Debian / Ubuntu:
	apt-get install python-pip
pip install shadowsocks
	2> CentOS:
	yum install python-setuptools && easy_install pip
  pip install shadowsocks
	3>Windows:
	See Install Server on Windows: "https://github.com/shadowsocks/shadowsocks/wiki/Install-Shadowsocks-Server-on-Windows"

	Usage

	ssserver -p 443 -k password -m aes-256-cfb

	To run in the background:
	sudo ssserver -p 443 -k password -m aes-256-cfb --user nobody -d start

	To stop:
	sudo ssserver -d stop
	
	To check the log:
	sudo less /var/log/shadowsocks.log
	Check all the options via -h. You can also use a Configuration file instead.
