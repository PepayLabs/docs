---
sidebar_position: 1
title: Developers
description: Everything you need to integrate PEPAY into your applications
---

# Developer Documentation

Welcome to the PEPAY developer documentation! Here you'll find comprehensive guides, API references, and SDK documentation to help you integrate PEPAY's cryptocurrency payment gateway into your applications.

## Quick Links

### Getting Started
- [**Quickstart Guide**](./quickstart) - Get up and running with PEPAY in minutes
- [**PEPAY SDK**](./pepay-sdk) - Install and use our TypeScript/Node.js SDK

### API Documentation
- [**PEPAY API Reference**](./pepay-api) - Complete REST API documentation
- [**API Documentation Overview**](./api-documentation) - High-level API concepts and authentication

### Integrations
- [**N8N Integration**](./pepay-n8n) - Automate payments with n8n workflows
- [**ElizaOS Integration**](./pepay-elizaos) - AI agent framework integration (Coming Soon)

### Resources
- [**FAQ**](./faq) - Frequently asked questions

## What is PEPAY?

PEPAY is a secure, flexible, and user-friendly crypto payment gateway that allows businesses to accept and manage cryptocurrency payments seamlessly. It supports multiple tokens and chains, making it ideal for businesses of all sizes.

### Key Features

- **Non-custodial**: You retain full control over your private keys and funds
- **Multi-chain support**: Accept payments on Solana, Polygon, BSC, and more
- **AI-ready**: Built for integration with AI agents and automation frameworks
- **Developer-friendly**: Comprehensive APIs, SDKs, and webhook support
- **Real-time notifications**: Get instant updates on payment status changes

## Choose Your Integration Method

### 1. REST API
Direct API integration gives you full control over the payment flow. Perfect for custom implementations.

```javascript
// Example: Create an invoice
const response = await fetch('https://api.pepay.io/api/v1/invoices', {
  method: 'POST',
  headers: {
    'x-api-key': 'your_api_key',
    'Content-Type': 'application/json'
  },
  body: JSON.stringify({
    amount_usd: 100.00,
    description: 'Order #1234'
  })
});
```

[View API Documentation →](./pepay-api)

### 2. SDK Integration
Use our TypeScript/Node.js SDK for a more streamlined development experience.

```typescript
import { PepaySDK } from '@pepay/sdk';

const pepay = new PepaySDK('YOUR_API_KEY');
const invoice = await pepay.createInvoice({
  amount_usd: 99.99,
  description: 'Premium Subscription'
});
```

[View SDK Documentation →](./pepay-sdk)

### 3. No-Code Integrations
Connect PEPAY to your existing workflows without writing code.

- **n8n**: Visual workflow automation
- **ElizaOS**: AI agent framework (Coming Soon)
- **ARC**: Advanced reasoning capabilities (Coming Soon)

[View Integration Guides →](./pepay-n8n)

## Authentication

All API requests require authentication using an API key. You can generate API keys from your PEPAY dashboard.

```javascript
headers: {
  'x-api-key': 'your_api_key'
}
```

## Need Help?

- **GitHub**: [github.com/peperuney/pepay-sdk](https://github.com/peperuney/pepay-sdk)
- **Support**: support@peperuney.pizza
- **Community**: Join our Discord for developer discussions

Ready to start building? Check out our [Quickstart Guide](./quickstart) to create your first invoice in minutes!