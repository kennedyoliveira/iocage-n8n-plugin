module.exports = {
    apps: [
        {
            name: "n8n",
            script: "n8n",
            env: {
                NODE_ENV: "production",
                N8N_CONFIG_FILES: "/home/n8n/config/n8n-config.json"
            }
        }    
    ]
}