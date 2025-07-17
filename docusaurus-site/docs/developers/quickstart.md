---
sidebar_position: 2
title: Quickstart Guide
description: Get up and running with PEPAY in minutes
---

# Quickstart Guide

Get started with PEPAY's cryptocurrency payment gateway quickly and easily. This guide will walk you through the prerequisites, installation, and creating your first invoice.

## Prerequisites

Before getting started with PEPAY, ensure you have:

- **Node.js 16+** - [Download Node.js](https://nodejs.org/)
- **pnpm 9+** or npm - Install pnpm with `npm install -g pnpm`
- **Git for version control** - [Get Git](https://git-scm.com/)
- **A code editor** - We recommend [VS Code](https://code.visualstudio.com/)
- **PEPAY Account** - [Sign up for PEPAY](https://pepay.com/register)

## Installation

### Clone and Install

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/pepay/pepay.git
   ```

2. **Enter the Directory**:
   ```bash
   cd pepay
   ```

3. **Switch to Latest Tagged Release**:
   ```bash
   git checkout $(git describe --tags --abbrev=0)
   ```

4. **Install Dependencies**:
   ```bash
   pnpm install --no-frozen-lockfile
   ```

## Architecture Overview

PEPAY is a decentralized AI payment gateway system designed to streamline transactions between blockchain ecosystems, AI agents, and end-user applications.

### Key Components

#### 1. Input Sources
PEPAY integrates multiple blockchain ecosystems and AI libraries:

**Blockchain Networks**:
- Solana
- Polygon
- Binance Smart Chain (BSC)
- Avalanche
- Arbitrum

**AI Agent Frameworks**:
- Ai16z
- ZeroBro
- ARC
- Virtuals
- ElizaOS

**LLM Frameworks**:
- DeepSeek
- Anthropic
- Grok
- ChatGPT
- Gemini

#### 2. Core PEPAY Engine
The heart of the architecture includes:
- **AI Agent Libraries**: Tools for AI agents to process payment instructions
- **Non-Custodial Wallets**: Secure, decentralized storage and transfer
- **Customer Data**: User metadata for personalization
- **Inventory Data**: Asset stock level management

#### 3. AI Agent Use Cases
- **Trading Bots**: Automated trading with real-time blockchain access
- **Retail Purchases**: E-commerce and point-of-sale transactions
- **DeSci**: Decentralized funding for scientific research
- **Gaming**: In-game economies and micropayments

## Configuration

### Environment Variables

Copy the example `.env` file and customize it:

```bash
cp .env.example .env
```

Edit `.env` to include your keys:
```env
API_KEY=your_api_key_here
WEBHOOK_URL=https://yourdomain.com/webhook
```

## Choose Your Payment Model

PEPAY supports various payment models:

- **Hosted Payment Links**: Perfect for quick payment setups
- **Embeddable Iframes**: Seamlessly integrate with your website
- **API Integration**: Build custom payment flows with full flexibility

## Local Testing

Set up a local testing environment:

1. **Start the Local Server**:
   ```bash
   npm run start
   ```

2. **Access the Dashboard**: Open [http://localhost:3000](http://localhost:3000/) in your browser

3. **Simulate Payments**: Use the dashboard to create invoices and test payment flows

## Create Your First Invoice

### Using the Dashboard

1. **Log In**: Visit [PEPAY Login](https://pepay.com/login)
2. **Navigate to Invoices**: Go to the "Invoices" section
3. **Fill in Details**:
   - Enter the amount in USD
   - Select accepted cryptocurrencies
   - Add optional metadata (e.g., order ID)
4. **Generate Invoice**: Click "Create" to generate the payment link

### Using the API

```javascript
const response = await fetch('https://api.pepay.io/api/v1/invoices', {
  method: 'POST',
  headers: {
    'x-api-key': 'your_api_key',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    amount_usd: 100.00,
    description: 'Order #1234',
    customer_id: 'cust_123'
  })
});

const invoice = await response.json();
console.log('Payment URL:', invoice.payment_url);
```

## Platform Integrations

### Discord Bot Setup

1. **Create a Bot**:
   - Visit the [Discord Developer Portal](https://discord.com/developers/applications)
   - Create a new application and generate a bot token

2. **Configure PEPAY**:
   ```env
   DISCORD_BOT_TOKEN=your_discord_token_here
   ```

3. **Run the Bot**:
   ```bash
   npm run discord-bot
   ```

4. **Add to Server**: Use the OAuth2 URL to invite the bot

## Common Commands

### Chat Interface
```bash
npm run chat
```

### Build Project
```bash
npm run build
```

## Troubleshooting

### Node.js Version Error
Ensure Node.js 16+ is installed:
```bash
node -v
```

### Missing Dependencies
Run:
```bash
npm install
```

### Environment Variable Issues
Verify `.env` is correctly configured with all required values.

## Next Steps

Now that you're set up, explore:

- [**API Documentation**](./pepay-api) - Complete API reference
- [**SDK Documentation**](./pepay-sdk) - TypeScript/Node.js SDK guide
- [**Advanced Features**](https://pepay.com/docs/advanced) - Dive deeper into capabilities
- [**Join the Community**](https://pepay.com/community) - Connect with other developers

Ready to integrate PEPAY into your application? Check out our [API Documentation](./pepay-api) or [SDK Guide](./pepay-sdk)!