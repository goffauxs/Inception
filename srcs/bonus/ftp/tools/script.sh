#!/bin/bash
mkdir -p /var/run/vsftpd/empty
useradd -d /ftp -s /bin/bash -m -u 4321 $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
groupadd ftpgroup
usermod -G ftpgroup $FTP_USER
chown -R $FTP_USER:ftpgroup /ftp
chmod 777 /ftp
echo "$FTP_USER" | tee -a /etc/vsftpd.userlist
exec vsftpd
