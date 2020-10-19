#!/bin/sh

echo "pasv_max_port=$PASV_MAX" >> /etc/vsftpd/vsftpd.conf
echo "pasv_min_port=$PASV_MIN" >> /etc/vsftpd/vsftpd.conf
echo "pasv_address=$PASV_ADDRESS" >> /etc/vsftpd/vsftpd.conf


addgroup -g $FTP_GID -S $FTP_USER
adduser -u $FTP_UID -D -G $FTP_USER -h /home/$FTP_USER -s /bin/false  $FTP_USER

echo "$FTP_USER:$FTP_PASS" | /usr/sbin/chpasswd
chown $FTP_USER:$FTP_USER /home/$FTP_USER/ -R



/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf




