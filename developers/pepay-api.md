---
icon: webhook
---

# Pepay API

## PEPAY API Reference

Welcome to the PEPAY API documentation. This guide covers all API endpoints available through our REST API for cryptocurrency payment processing.

### Authentication

All API requests require authentication using an API key. Include your API key in the request headers:\


<pre class="language-javascript"><code class="lang-javascript"><strong>'x-api-key': 'your_api_key'
</strong></code></pre>

### Base URL

```
https://api.pepay.io
```

### Invoices

#### Create Invoice

Create a new payment invoice.

**POST** `/api/v1/invoices`

**Headers:**

```json
{
  "Content-Type": "application/json",
  "x-api-key": "your_api_key",
  "Idempotency-Key": "unique_request_id"
}
```

**Request Body:**

```json
{
  "amount_usd": 100.00,          // Required: Amount in USD (0.01-1,000,000)
  "description": "Order #1234",   // Optional: Invoice description
  "customer_id": "cust_123",     // Optional: Your customer identifier
  "metadata": {                  // Optional: Additional data
    "order_id": "1234",
    "product_id": "prod_456"
  },
  "expires_in": 3600000         // Optional: Expiration time in ms (default: 12h)
}
```

**Response:** `200 OK`

```json
{
  "id": "inv_abc123",
  "amount_usd": 100.00,
  "status": "unpaid",
  "payment_url": "https://pay.pepay.io/inv_abc123",
  "created_at": "2024-03-21T10:30:00Z",
  "expires_at": "2024-03-21T22:30:00Z",
  "customer_id": "cust_123",
  "metadata": {
    "order_id": "1234",
    "product_id": "prod_456"
  }
}
```

#### Get Invoice

Retrieve details of a specific invoice.

**GET** `/api/v1/invoices/{customer_id}`

**Headers:**

```json
{
  "x-api-key": "your_api_key"
}
```

**Response:** `200 OK`

```json
{
  "id": "inv_abc123",
  "amount_usd": 100.00,
  "status": "paid",
  "payment_url": "https://pay.pepay.io/inv_abc123",
  "created_at": "2024-03-21T10:30:00Z",
  "paid_at": "2024-03-21T10:35:00Z",
  "payment_details": {
    "network": "solana",
    "transaction_hash": "5KKsX...",
    "amount_paid": 100.00
  }
}
```

#### List Invoices

Get a paginated list of invoices.

**GET** `/api/v1/invoices`

**Query Parameters:**

* `page`: Page number (default: 1)
* `status`: Filter by status ('paid', 'unpaid', 'expired', 'all')
* `customer_id`: Filter by customer

**Headers:**

```json
{
  "x-api-key": "your_api_key"
}
```

**Response:** `200 OK`

```json
{
  "items": [...],
  "total": 50,
  "page": 1,
  "has_more": true
}
```

#### Get Invoice Totals

Get aggregated invoice statistics.

**GET** `/api/v1/invoices/totals`

**Headers:**

```json
{
  "x-api-key": "your_api_key"
}
```

**Response:** `200 OK`

```json
{
  "total_amount_usd": 1000.00,
  "total_paid_usd": 750.00,
  "total_unpaid_usd": 250.00,
  "total_expired_usd": 0.00,
  "invoice_count": {
    "total": 10,
    "paid": 7,
    "unpaid": 3,
    "expired": 0
  }
}
```

### Webhooks

#### Webhook Events

PEPAY sends webhook notifications for the following events:

| Event Type                | Description                     |
| ------------------------- | ------------------------------- |
| `invoice.paid`            | Full payment received           |
| `invoice.expired`         | Invoice expired without payment |
| `invoice.partial_payment` | Partial payment received        |
| `invoice.overpaid`        | Payment exceeds invoice amount  |

#### Webhook Payload

```json
{
  "id": "evt_123",
  "type": "invoice.paid",
  "created": 1679395200,
  "data": {
    "invoice_id": "inv_abc123",
    "status": "paid",
    "amount_paid": 100.00,
    "payment_network": "solana",
    "transaction_hash": "5KKsX..."
  }
}
```

#### Webhook Security

Verify webhook authenticity using the signature in headers:

* `x-pepay-signature`: HMAC SHA-256 signature
* `x-pepay-timestamp`: Unix timestamp of the request

### Error Handling

All API errors follow this format:

```json
{
  "error": "Error message",
  "code": "ERROR_CODE"
}
```

Common error codes:

* `INVALID_AMOUNT_FORMAT`: Invalid amount format
* `INVALID_AMOUNT_RANGE`: Amount outside allowed range
* `IDEMPOTENCY_KEY_MISSING`: Missing idempotency key
* `INVOICE_CREATE_FAILED`: Generic creation failure

### Rate Limits

* 100 requests per minute per API key
* Webhook retries: 3 attempts with exponential backoff
