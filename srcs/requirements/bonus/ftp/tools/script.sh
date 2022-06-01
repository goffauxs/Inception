mkdir -p /var/run/vsftpd/empty
groupadd ftp
useradd -d /ftp -s /bin/bash -m -g ftp sgoffaux
echo -e "123\n123" | passwd sgoffaux
chown -R sgoffaux:ftp /ftp

