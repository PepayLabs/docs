---
icon: microchip
---

# Architecture & Technical Design

Pepay’s design philosophy revolves around **modularity**, **scalability**, and **observability**, ensuring a robust payment layer for AI agents across multiple blockchains. This section dives into how Pepay processes payments, integrates with AI frameworks, and scales to meet demand.

<figure><img src="../.gitbook/assets/telegram-cloud-photo-size-5-6082329236745605425-y (1).jpg" alt=""><figcaption></figcaption></figure>

***

## High-Level Overview

**Core Concept**\
At the center of Pepay is a **Payment Engine** that orchestrates transactions, records data (e.g., customer info, inventory), and communicates with multiple blockchain networks. AI agent plugins (e.g., ai16z, ARC, ZeroBird) interface directly with this engine to request or process payments in a trustless, non-custodial manner.

**Key Components**

* **Blockchain Connectors**: Each supported network (e.g., Solana, Base, Ethereum) has its own service module.
* **AI Agent Integrations**: Plugins for AI agent frameworks, powered by Pepay’s Core SDK.
* **Non-Custodial Wallets**: Each AI agent or merchant retains full control of their private keys.
* **Data Layer**: Tracks transactions, inventory, and customer info across multiple networks.

***

## Payment Engine

The **Payment Engine** is the heart of Pepay’s workflow. It receives payment requests (invoices, partial payments, etc.) from AI agents or merchant apps, then orchestrates the transaction flow across various blockchains.

* **Transaction Lifecycle**:
  1. **Invoice Generation**: AI agent or merchant requests an invoice, specifying amount, chain, and any time-bound or partial payment constraints.
  2. **Payment Validation**: The engine verifies chain compatibility, calculates gas/fees, and prepares the transaction details.
  3. **Wallet Interaction**: Since Pepay is non-custodial, the user or AI agent signs transactions locally via wallet solutions (e.g., Phantom, MetaMask).
  4. **Settlement & Recording**: Once the transaction is confirmed on-chain, the engine logs the payment status and updates inventory/customer records.
  5. **Client Notification:** After settlement, merchants are notified via webhook or rpc base on preference
* **Service-Oriented Workflow**:
  * Each network connector (e.g., SolanaService, BaseService) is implemented as a **service class**.
  * The engine routes requests to the appropriate service based on chain selection.
  * Facilitates parallel or sequential processing for complex multi-chain tasks.

***

## Modular, Service-Oriented Design

**Why Modularity?**\
Blockchains evolve fast. Pepay embraces a **router pattern** where each blockchain network is encapsulated in its own service module. This means adding or upgrading a chain’s connector is as simple as plugging in (or unplugging) a new class.

* **Easy Addition of New Networks**: Each service conforms to a standard interface (e.g., `createInvoice()`, `checkCustomerId()`).
* **Independent Updates**: Hotfix or upgrade a single connector without overhauling the entire system.
* **Dynamic Registration**: Pepay automatically registers any newly added service based on configuration.

***

## Scalable, Resilient Infrastructure

#### Kubernetes-Based Deployment

Pepay is cloud-native, leveraging **Kubernetes** for container orchestration:

* **Horizontal Scaling**: Spin up additional instances of the Payment Engine on demand.
* **Connection Pooling & Rate Limiting**: Maintain stable throughput during traffic spikes.
* **Health Monitoring**: Automated probes and rolling updates minimize downtime.

#### Resilience & Fault Tolerance

* **Retry Mechanisms**: In the event of network or API failures, Pepay retries transactions following exponential back-off rules.
* **Graceful Degradation**: If one chain’s service goes offline, requests for that chain are halted without affecting other services.
* **System Status Alerts**: Real-time monitoring and alerting on transaction errors, CPU usage, or memory constraints.

***

## Observability & Logging

Pepay’s **Observable Framework** ensures full visibility across the payment flow:

* **Comprehensive Logs**: Detailed logs for transaction requests, confirmations, and errors.
* **Health Checks**: Periodic checks on each chain connector and the core Payment Engine.
* **Monitoring Dashboards**: Metrics on transactions per minute, average confirmation time, and success/fail rates.

This unified observability helps developers pinpoint issues quickly—critical for high-traffic scenarios and real-time AI agent interactions.

***

## AI Agent Integration

Pepay extends its capabilities to AI agents through **plugins** built on a Core SDK (written in TypeScript). These plugins serve as the bridge between AI frameworks (e.g., ai16z, ARC) and Pepay’s Payment Engine:

* **Core SDK**:
  * Exposes functions like `createInvoice()`, `checkBalance()`, `recordPayment()`.
  * Manages authentication, signing, and consistent data handling across multiple blockchains.
* **Plugin Ecosystem**:
  * Pre-built adapters for popular AI frameworks.
  * Customizable interfaces to tailor the user experience (partial invoices, time-bound payments, etc.).
* **Workflow**:
  1. AI Agent triggers a payment request via the plugin.
  2. The plugin calls the Pepay Payment Engine (through the Core SDK).
  3. The agent  or merchant receives a link or sdk embedded iframe
  4. Clients receive the link from the agent and pay the invoice
  5. the agent is notified of completion and find all data regarding the client

***

## Technical Stack

Pepay’s stack emphasizes **TypeScript** and proven web3 libraries, running on a robust containerized environment.

* **Languages & Frameworks**:
  * **Node.js** + **TypeScript** for backend services and the Core SDK.
  * **web3.js** and **ethers.js** for blockchain interactions.
* **Infrastructure**:
  * **Kubernetes** for container orchestration.
  * **Docker** images for each network connector and the Payment Engine.
* **Databases**:
  * Depending on your needs, Pepay can integrate with various databases (SQL or NoSQL) for transaction logging, user data, etc.
* **CI/CD**:
  * Automated tests and deployment pipelines ensure reliable upgrades and quick turnaround on new features.

###

