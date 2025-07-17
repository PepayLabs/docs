---
description: (Coming Soon)
icon: robot
---

# Pepay N8N

## PEPAY n8n Integration

Transform your n8n workflows with PEPAY's cryptocurrency payment processing capabilities. Automate payment collection, invoice management, and payment status tracking seamlessly within your n8n instance.

> ⚠️ **BETA NOTICE**: This integration is currently in beta. While fully functional, features and APIs may change. While available on github,developers must create their own N8N credentials at this time.&#x20;

### Features

#### Payment Processing

* Create cryptocurrency payment invoices programmatically
* Support for multiple cryptocurrencies
* Real-time payment status tracking
* Automatic exchange rate calculations

#### Invoice Management

* Create and manage invoices
* Track payment statuses
* Search and filter invoices
* Calculate payment totals

#### Webhook Integration

* Real-time payment notifications
* Secure webhook validation
* Multiple event types support
* Automatic retry mechanism

### Installation (Coming Soon)

```javascript
npm install n8n-nodes-pepay
```

### Node Types

#### 1. PEPAY Node

Regular node for invoice operations:

* Create Invoice
* Get Invoice Details
* List Invoices
* Calculate Totals

#### 2. PEPAY Trigger Node

Webhook trigger node for real-time events:

* Payment Received
* Invoice Expired
* Partial Payment
* Payment Overpaid

### Configuration

#### Credentials Setup

1. Navigate to n8n Credentials
2. Add new credential
3. Select "PEPAY API"
4. Configure:
   * API Key
   * Environment (Production/Testnet)
   * Webhook Secret (for triggers)

#### Basic Usage

1. **Creating an Invoice**

```typescript


```

2. **Setting up Webhooks**

```typescript
```

### Node Reference

#### PEPAY Node Operations

**Create Invoice**

* **Input Parameters:**
  * Amount (USD)
  * Description
  * Customer ID (optional)
  * Metadata (optional)
  * Expiration Time (optional)

**Get Invoice**

* **Search Options:**
  * By Invoice ID
  * By Customer ID

**List Invoices**

* **Filtering Options:**
  * Status (paid/unpaid/expired)
  * Date Range
  * Customer ID

#### PEPAY Trigger Node

**Supported Events**

* `invoice.paid`: Full payment received
* `invoice.expired`: Invoice expiration
* `invoice.partial_payment`: Partial payment received
* `invoice.overpaid`: Payment exceeds invoice amount

**Security**

* Automatic signature verification
* Timestamp validation
* Secure webhook secrets

### Examples

#### Basic Payment Flow

```typescript
```

#### Advanced Usage

```typescript
```

### Error Handling

The integration provides comprehensive error handling:

* API errors with detailed messages
* Webhook validation failures
* Network connectivity issues
* Rate limiting handling

### Best Practices

1. **Webhook Security**
   * Always use HTTPS endpoints
   * Validate webhook signatures
   * Store webhook secrets securely
2. **Error Handling**
   * Implement proper error catching
   * Use retry mechanisms for transient failures
   * Log failed webhook deliveries
3. **Performance**
   * Use pagination for large invoice lists
   * Process webhooks asynchronously
   * Implement proper timeout handling

### Support & Resources

* [https://github.com/peperuney/pepay-n8n](https://github.com/peperuney/pepay-n8n)
* [API Reference](pepay-api.md)
* [GitHub Issues](https://github.com/peperuney/pepay-n8n)
* Email: support@peperuney.pizza

### Coming Soon

* Advanced filtering options
* Batch operations
* Custom notification templates
* Enhanced reporting features
* Multi-currency support
* Advanced webhook configurations
