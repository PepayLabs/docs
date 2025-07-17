---
title: "Quickstart Guide"
description: "Get started with Pepay in minutes. Simple setup guide for developers to integrate crypto payments into their applications."
keywords: ["pepay quickstart", "crypto payment setup", "developer guide", "integration tutorial", "API setup"]
image: "/img/pepay-social-card.jpg"
---

# Quickstart Guide

Get up and running with Pepay in just a few minutes.

## Prerequisites

- Node.js 16+ or Python 3.8+
- Basic knowledge of APIs and webhooks
- A Pepay account (sign up at [pepay.io](https://pepay.io))

## Quick Setup

### 1. Get Your API Keys

1. Sign up at [pepay.io](https://pepay.io)
2. Navigate to your dashboard
3. Generate your API keys (testnet and mainnet)
4. Save your keys securely

### 2. Install the SDK

```bash
npm install @pepay/sdk
```

### 3. Basic Implementation

```javascript
import { Pepay } from '@pepay/sdk';

const pepay = new Pepay({
  apiKey: 'your-api-key',
  environment: 'testnet' // or 'mainnet'
});

// Create an invoice
const invoice = await pepay.createInvoice({
  amount: 100, // in USD cents
  currency: 'USDC',
  description: 'Test payment'
});

console.log('Payment URL:', invoice.paymentUrl);
```

### 4. Handle Webhooks

```javascript
// Express.js example
app.post('/webhook', (req, res) => {
  const signature = req.headers['x-pepay-signature'];
  const payload = req.body;
  
  if (pepay.verifyWebhook(payload, signature)) {
    // Process the payment event
    console.log('Payment status:', payload.status);
  }
  
  res.status(200).send('OK');
});
```

## Next Steps

- [Complete API Documentation](./api-documentation)
- [SDK Reference](./pepay-sdk)
- [Integration Examples](./pepay-api)

## Need Help?

- Check our [FAQ](./faq)
- Join our [Discord](https://discord.gg/pepay)
- Email us at support@pepay.io