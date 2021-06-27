module.exports = {
    apps: [
        {
            name: "n8n",
            script: "n8n",
            env: {
                NODE_ENV: "production",
                N8N_CONFIG_FILES: "/home/n8n/config/n8n-config.json",
                N8N_USER_FOLDER: "/home/n8n/data/"
            }
        }
    ]
}
