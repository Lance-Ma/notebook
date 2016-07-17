 
 当adb端口被占用无法正常启动：
 
 1、查看5307(默认)端口，输入如下命令：
 
 netstat -o -n -a | findstr 5037
 计算机列出相关信息，找到占用5037端口的PID
 
 TCP    127.0.0.1:5037         0.0.0.0:0              LISTENING       3408
 TCP    127.0.0.1:5037         127.0.0.1:50018        ESTABLISHED     3408
 TCP    127.0.0.1:5037         127.0.0.1:54507        ESTABLISHED     3408
 TCP    127.0.0.1:5037         127.0.0.1:63330        ESTABLISHED     3408
 TCP    127.0.0.1:5037         127.0.0.1:63332        ESTABLISHED     3408
 TCP    127.0.0.1:50018        127.0.0.1:5037         ESTABLISHED     1664
 TCP    127.0.0.1:54507        127.0.0.1:5037         ESTABLISHED     1664
 TCP    127.0.0.1:63330        127.0.0.1:5037         ESTABLISHED     1664
 TCP    127.0.0.1:63332        127.0.0.1:5037         ESTABLISHED     1664
 
 2、依据相关PID，杀死占用5037端口的进程如下命令：
 taskkill /F /PID 3408
 
 3、依次杀死/重启adb进程，如下命令：
 adb kill-server
 adb start-server
 
 4、查看相关连接的adb设备，
 adb devices
 
 如果adb服务正常启动，则出现以下设备信息：
 List of devices attached
 192.168.79.101:5555     device
