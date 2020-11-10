#!/bin/sh

# prepare rssh.conf
echo "logfacility = LOG_USER" > /etc/rssh.conf
echo "allowscp" >> /etc/rssh.conf
echo "allowsftp" >> /etc/rssh.conf
echo "allowrsync" >> /etc/rssh.conf
echo "umask = 022" >> /etc/rssh.conf


# if no password given create random password
if [ -z "$password" ]; then
    password=`cat /dev/urandom | tr -dc A-Z-a-z-0-9 | head -c 10`
fi
    
# Add user with password
adduser -s /usr/bin/rssh -D $username
echo "$username:$password" | chpasswd

# Create hostkeys
ssh-keygen -A

cat << EOB
	SERVER SETTINGS
	---------------
	· User: $username
	· Password: $password
EOB

# start ssh daemon
exec /usr/sbin/sshd -D -e
