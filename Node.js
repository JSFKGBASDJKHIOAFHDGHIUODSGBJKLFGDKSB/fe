const { Client, GatewayIntentBits } = require('discord.js');
const express = require('express');
const app = express();
const botToken = 'MTMxNzgwNjMyOTc3MTA2NTQxNg.GPL78x.LL3I5HxG9HmRkxgbPauoPPSm-blbAQITfhV6Tk'; // Replace with your actual bot token
const client = new Client({ intents: [GatewayIntentBits.Guilds] });

// Channel ID to create the invite in (your channel ID)
const channelId = '1305096350203117570'; // Replace with your actual channel ID

// Set up your server route to create a Discord invite
app.get('/createinvite', (req, res) => {
    client.once('ready', async () => {
        try {
            // Fetch the desired channel
            const channel = await client.channels.fetch(channelId);
            if (!channel) {
                console.error('Channel not found');
                return;
            }

            // Create an invite with expiration and usage limits
            const invite = await channel.createInvite({
                maxAge: 3600,  // 1 hour expiration time
                maxUses: 10,   // Limit of 10 uses
            });

            // Send the invite URL as JSON response
            res.json({ inviteUrl: invite.url });
        } catch (error) {
            console.error('Error creating invite:', error);
            res.status(500).send('Error creating invite');
        }
    });

    client.login(botToken);
});

// Start the server
app.listen(3000, () => {
    console.log('Server running on port 3000');
});
