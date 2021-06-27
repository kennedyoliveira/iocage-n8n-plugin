#!/bin/sh

echo "creating users"
pw adduser n8n -c "n8n daemon" -d /home/n8n -s /sbin/nologin

chown -R n8n:nogroup /home/n8n

echo "installing pm2 globally"
npm i -g pm2

chmod 0755 /usr/local/bin/pm2_n8n

# start the app
su -m n8n -c 'pm2_n8n start /home/n8n/config/ecosystem.config.js'

# store the config
su -m n8n -c 'pm2_n8n save'

# kill the current running instances
su -m n8n -c 'pm2_n8n kill'

# creating the rc.d script folders
mkdir -p /usr/local/etc/rc.d

# create the startup scripts
pm2 startup -u n8n --hp /home/n8n

echo "starting the service"
service pm2_n8n start

cat /root/PLUGIN_INFO
