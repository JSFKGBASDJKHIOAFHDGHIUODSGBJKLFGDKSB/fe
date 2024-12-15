require('dotenv').config();  // Load environment variables
const { Client, GatewayIntentBits } = require('discord.js');

const botToken = process.env.BOT_TOKEN;  // Secure token storage
const client = new Client({ intents: [GatewayIntentBits.Guilds] });

// Replace this with your channel ID
const channelId = 'require('dotenv').config();  // Load environment variables
const { Client, GatewayIntentBits } = require('discord.js');

const botToken = process.env.MTMxNzgwNjMyOTc3MTA2NTQxNg.GPL78x.LL3I5HxG9HmRkxgbPauoPPSm-blbAQITfhV6Tk;  // Secure token storage
const client = new Client({ intents: [GatewayIntentBits.Guilds] });

// Channel ID you provided
const channelId = '1305096350203117570';

// Once the bot is logged in, create the invite and send it in the channel
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

        // Create the message with the invite link
        const message = `Here's your new Discord invite: ${invite.url}`;

        // Send the message in the channel
        channel.send(message);

        console.log('Invite created and sent successfully:', invite.url);
    } catch (error) {
        console.error('Error creating or sending invite:', error);
    }
});

// Log the bot in using the token
client.login(botToken);';

// Once the bot is logged in, create the invite and send it in the channel
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

        // Create the message with the invite link
        const message = `Here's your new Discord invite: ${invite.url}`;

        // Send the message in the channel
        channel.send(message);

        console.log('Invite created and sent successfully:', invite.url);
    } catch (error) {
        console.error('Error creating or sending invite:', error);
    }
});

// Log the bot in using the token
client.login(botToken);
