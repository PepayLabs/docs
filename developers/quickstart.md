---
icon: bullseye-arrow
---

# Pepay SDK

> **Welcome to the official Pepay SDK Documentation!**\
> This guide explains how to install, configure, and integrate the Pepay SDK into your Node.js/TypeScript applications for seamless cryptocurrency payment processing.

***

### 1. Introduction

#### Overview

The **Pepay SDK** is a TypeScript/Node.js library that integrates seamlessly with the Pepay API. It enables merchants and developers to create invoices, manage payments, and set up webhooks for real-time notifications—while supporting features like multi-chain transactions, non-custodial wallets, and time-bound invoices.

#### Who Should Use This SDK?

* **Developers** building AI agent frameworks or merchant apps needing a crypto payment gateway.
* **Teams** seeking an easy-to-use integration that handles invoice creation, listing, and management via the Pepay platform.

### 2. Installation

#### NPM/Yarn

```bash
npm install @pepay/sdk
# or
yarn add @pepay/sdk
```

#### Requirements

* **Node.js** v14+
* **TypeScript** (optional but recommended)
* A valid **Pepay API key** (generated in the Pepay dashboard)

### 3. Quick Start

```typescript
import { PepaySDK } from '@pepay/sdk';

(async () => {
  // 1. Initialize SDK
  const pepay = new PepaySDK('YOUR_API_KEY');

  // 2. Create an invoice
  const invoice = await pepay.createInvoice({
    amount_usd: 99.99,
    description: 'Premium Subscription',
    customer_id: 'cust_123',
  });

  console.log('Invoice Created:', invoice);
})();
```

**Key Steps**

1. Install the SDK
2. Import `PepaySDK` into your application
3. Instantiate the SDK with your API key
4. Create and manage invoices as needed

### 4. Core Concepts

#### Invoices

* **Purpose**: Request and collect crypto payments from customers.
* **Attributes**: Each invoice has a unique ID, amount in USD, description, and expiration time.
* **Payment URLs**: A secure link is generated for customers to complete their payment in various cryptocurrencies.

#### Authentication

* **API Key**: All requests to the Pepay API must include a valid key.
* **Key Rotation**: API keys can be regenerated in the Pepay dashboard. They should be kept confidential and secured.

#### Idempotency

* **Usage**: Employ a unique idempotency key for each write operation (e.g., UUIDv4).
* **Benefit**: Prevents duplicate invoice creation and ensures reliable retries in case of network issues.

### 5. API Reference

#### 5.1 `createInvoice()`

Creates a new invoice for a specified USD amount.

```typescript
const invoice = await pepay.createInvoice({
  amount_usd: 100.00,         // Required
  description: 'Order #1234', // Optional
  customer_id: 'cust_123',    // Optional
  metadata: {                 // Optional
    order_id: '1234',
    product_id: 'prod_456'
  },
  expires_in: 3600000         // Optional, in ms
});
```

**Parameters**

* `amount_usd: number` – Invoice amount in USD
* `description: string` – Optional description of the invoice
* `customer_id: string` – Optional customer identifier
* `metadata: object` – Optional additional data
* `expires_in: number` – Optional custom expiration duration (in milliseconds)

**Returns**

* `Promise<Invoice>` – The created invoice object

***

#### 5.2 `listInvoices()`

Retrieves a paginated list of invoices based on specified criteria.

```typescript
typescriptCopyEditconst invoices = await pepay.listInvoices({
  page: 1,
  status: 'unpaid' // 'paid' | 'unpaid' | 'expired' | 'all'
});
```

**Parameters**

* `page: number` – Page number for pagination
* `status: string` – Invoice status filter (`paid`, `unpaid`, `expired`, or `all`)

**Returns**

* `Promise<Invoice[]>` – Array of invoices matching the filter

***

#### 5.3 `getCustomerInvoices()`

Lists all invoices associated with a specific customer.

```typescript
typescriptCopyEditconst customerInvoices = await pepay.getCustomerInvoices('cust_123');
```

**Parameters**

* `customer_id: string` – Unique identifier for the customer

**Returns**

* `Promise<Invoice[]>` – Array of invoices for the given customer

***

#### 5.4 `getInvoiceTotals()`

Retrieves a summary of total amounts and invoice counts for your Pepay account.

```typescript
const totals = await pepay.getInvoiceTotals();
/*
{
  total_amount_usd: 1000.00,
  total_paid_usd: 750.00,
  total_unpaid_usd: 250.00,
  total_expired_usd: 0.00,
  invoice_count: {
    total: 10,
    paid: 7,
    unpaid: 3,
    expired: 0
  }
}
*/
```

**Returns**

* `Promise<Totals>` – An object with aggregated invoice data

### 6. Webhook Integration

#### Overview

Pepay sends **webhook** events to notify your application about invoice status changes in real-time (e.g., when an invoice is paid, expires, or is partially paid). Handling these events ensures your system stays in sync with the latest payment state.

#### 6.1 Setting Up Webhooks

1. Configure your **webhook URL** in the Pepay dashboard.
2. Store your **webhook secret** securely—used for verifying request signatures.
3. Implement an endpoint in your application that can parse raw JSON bodies.

#### 6.2 Webhook Events

* `invoice.paid`
* `invoice.expired`
* `invoice.partial_payment`
* `invoice.overpaid`

#### 6.3 Sample Webhook Handler

```typescript
import express from 'express';
import crypto from 'crypto';

const app = express();

app.post('/webhooks/pepay', express.raw({ type: 'application/json' }), async (req, res) => {
  const signature = req.headers['x-pepay-signature'] as string;
  const timestamp = req.headers['x-pepay-timestamp'] as string;

  const isValid = verifyWebhookSignature(
    req.body,
    signature,
    timestamp,
    process.env.WEBHOOK_SECRET!
  );

  if (!isValid) {
    return res.status(400).send('Invalid signature');
  }

  const event = JSON.parse(req.body.toString());

  switch (event.type) {
    case 'invoice.paid':
      await handlePaidInvoice(event.data);
      break;
    case 'invoice.expired':
      await handleExpiredInvoice(event.data);
      break;
    // ... handle other events
  }

  res.json({ received: true });
});

function verifyWebhookSignature(
  payload: Buffer,
  signature: string,
  timestamp: string,
  secret: string
): boolean {
  const signedPayload = `${timestamp}.${payload.toString()}`;
  const expectedSignature = crypto
    .createHmac('sha256', secret)
    .update(signedPayload)
    .digest('hex');
  
  return crypto.timingSafeEqual(
    Buffer.from(signature),
    Buffer.from(expectedSignature)
  );
}
```

### 7. Error Handling

All errors from the SDK are thrown as `PepayError`, which contains a `code` and a descriptive `message`.

```typescript
try {
  const invoice = await pepay.createInvoice({ amount_usd: 100 });
} catch (error) {
  if (error instanceof PepayError) {
    console.error(`Error ${error.code}: ${error.message}`);
  }
}
```

#### Common Error Codes

* `INVALID_AMOUNT_FORMAT`
* `INVALID_AMOUNT_RANGE`
* `IDEMPOTENCY_KEY_MISSING`
* `INVOICE_CREATE_FAILED`

### 8. Best Practices

1. **Idempotency**: Use a unique key (e.g., UUIDv4) for each write operation to handle retries safely.
2. **Error Handling**: Always catch and log `PepayError` to provide clear feedback in production.
3. **Webhook Integration**: Ensure real-time updates by subscribing to invoice events.
4. **Amount Validation**: Keep invoice amounts within `0.01–1,000,000.00 USD`.
5. **Expiration Times**: Configure durations that match your business needs, using the `expires_in` parameter.

### 9. Support & Resources

* **API & Docs**: [https://docs.pepay.io](https://docs.pepay.io)
* **Status Page**: [https://status.pepay.io](https://status.pepay.io)&#x20;
* **Support Email**: support@peperuney.pizza
* **GitHub**: [https://github.com/peperuney/pepay-sdk](https://github.com/peperuney/pepay-sdk)

### 10. Changelog & Versioning

* **v1.0.0**: Initial release, featuring invoice creation, listing, and webhook handling
* **v1.1.0**: Added partial payment functionality and improved logging

Stay updated by watching the [GitHub releases](https://github.com/peperuney/peperuney-sdk/releases).

***

**© 2025 Pepay. All rights reserved.**



