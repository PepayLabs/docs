---
hidden: true
icon: webhook
---

# API Documentation

### Overview

PEPAY provides a set of APIs for seamless integration with its AI-powered payment gateway system. These APIs enable developers to manage API keys, access invoice data, process payments, and customize settings for their use cases.

***

### Authentication

PEPAY uses API keys for authenticating API requests. Ensure that you include the API key in the headers of every request. Unauthorized requests will return a `401 Unauthorized` response.

***

### API Endpoints

#### **1. API Key Management**

**Create API Key**

* **Description**: Generate a new API key for authentication.
* **Method**: POST
* **Parameters**: None
* **Response**: Returns the newly created API key.

**Delete API Key**

* **Description**: Revoke an existing API key.
* **Method**: DELETE
* **Parameters**: API key to be deleted
* **Response**: Confirmation of deletion.

***

#### **2. Merchant APIs**

**GetInvoice by Customer ID**

* **Description**: Retrieve all invoices associated with a specific customer ID.
* **Method**: GET
* **Parameters**:
  * `customer_id`: The unique ID of the customer
* **Response**: List of invoices.

**GetInvoice by Payment Status**

* **Description**: Retrieve invoices filtered by payment status.
* **Method**: GET
* **Parameters**:
  * `status`: The payment status (e.g., `paid`, `pending`, `failed`)
* **Response**: List of invoices matching the specified status.

**Total Payment in USD**

* **Description**: Get the total value of payments made in USD.
* **Method**: GET
* **Parameters**: None
* **Response**: Total payment amount in USD.

**Select Supported Networks**

* **Description**: Choose which blockchain networks are supported for transactions.
* **Method**: POST
* **Parameters**:
  * `networks`: List of supported networks (e.g., Solana, Polygon, BSC)
* **Response**: Confirmation of selected networks.

**Get Total Invoice in USD**

* **Description**: Retrieve the total invoice amount in USD.
* **Method**: GET
* **Parameters**: None
* **Response**: Total invoice amount in USD.

***

#### **3. Invoice APIs**

**CreateInvoice**

* **Description**: Create a new invoice for a transaction.
* **Method**: POST
* **Parameters**:
  * `customer_id`: Unique ID of the customer
  * `additional_data`: Optional additional metadata
  * `questions`: Optional questions or prompts associated with the invoice
* **Response**: Confirmation of invoice creation.

***

#### **4. Configuration APIs**

**SetRPC**

* **Description**: Configure the Remote Procedure Call (RPC) endpoint for blockchain operations.
* **Method**: POST
* **Parameters**:
  * `rpc_url`: The URL of the RPC endpoint
* **Response**: Confirmation of RPC configuration.

**SetWebHook**

* **Description**: Configure a webhook for real-time notifications.
* **Method**: POST
* **Parameters**:
  * `webhook_url`: The URL of the webhook
* **Response**: Confirmation of webhook configuration.

***

### SDKs and Integrations

#### **SDK**

* **GitHub Link**: \[Insert Link Here]

#### **AI Integrations**

* **AI16z**: Coming Soon
* **ARC**: Coming Soon

***

### Notes

* Ensure proper handling of API keys to prevent unauthorized access.
* Use supported blockchain networks for transactions.
* For additional support, contact the PEPAY development team.

