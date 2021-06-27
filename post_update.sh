#!/bin/sh

npm config set user root

echo "updating n8n..."
npm install -g n8n@latest

echo "updating pm2..."
npm install -g pm2@latest

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

# start the app
su -m n8n -c 'pm2_n8n start n8n'
