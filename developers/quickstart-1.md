---
hidden: true
icon: bullseye-arrow
---

# Quickstart Guide

```
git clone https://github.com/elizaos/eliza.git 
```

### Prerequisites 📋

Before getting started with PePay, ensure you have:

* **Node.js 23+** 🟢\
  [Download Node.js](https://nodejs.org/)
* **pnpm 9+** 📦\
  Install pnpm
* **Git for version control** 🔄\
  [Get Git](https://git-scm.com/)
* **A code editor (VS Code or VSCodium recommended)** 🖥️\
  [Download VS Code](https://code.visualstudio.com/)
* **CUDA Toolkit** (optional, for GPU acceleration) ⚡\
  [Install CUDA Toolkit](https://developer.nvidia.com/cuda-downloads)

### Installation 🔧

#### Clone and Install 🖇️

1.  **Clone the Repository**:

    ```bash
    bashCopyEditgit clone https://github.com/pepay/pepay.git
    ```
2.  **Enter the Directory**:

    ```bash
    bashCopyEditcd pepay
    ```
3.  **Switch to Latest Tagged Release**:

    ```bash
    bashCopyEditgit checkout $(git describe --tags --abbrev=0)
    ```
4.  **Install Dependencies** (for the initial run):

    ```bash
    bashCopyEditpnpm install --no-frozen-lockfile
    ```

    Learn more about pnpm installation

PEPAY is a decentralized AI payment gateway system designed to streamline transactions and interactions between blockchain ecosystems, AI agents, and end-user applications such as trading bots, retail purchases, DeSci, and gaming. It serves as a critical intermediary that leverages blockchain networks, AI libraries, and customer/inventory data to facilitate secure, efficient, and intelligent payment operations\
\
**Key Components**



## 1. Input Sources📥

PePay integrates multiple blockchain ecosystems and AI libraries to gather transactional data and enable seamless payment functionality.

**Blockchain Networks 🌐**

* Solana
* Polygon
* Binance Smart Chain (BSC)
* Avalanche
* Arbitrum

**AI Agent Frameworks 🤖**

* Ai16z
* ZeroBro
* ARC
* Virtuals
* ElizaOS

**LLM Frameworks 🧠**

* DeepSeek
* Anthropic
* Grok
* ChatGPT
* Gemini





## 2. Core Pepay Engine⚙️

The PePay engine is the heart of the architecture, comprising the following modules:

* **AI Agent Libraries**: Provide tools and frameworks for AI agents to process payment instructions and make intelligent decisions. 🧩
* **Non-Custodial Wallets**: Enable secure, decentralized storage and transfer of digital assets without intermediaries. 🔒
* **Customer Data**: A repository for user and client metadata to enhance personalization and transaction accuracy. 🗂️
* **Inventory Data**: Manages asset stock levels, ensuring reliable availability for AI-driven operations. 📦

## 2. **Core PEPAY Engine**

## 3. **AI Agents**&#x20;

AI Agents are the primary beneficiaries of PePay, utilizing the payment gateway’s tools to enable functionality in various domains:

**Use Cases 💡**

* **Trading Bots**: Execute automated trading strategies with real-time access to blockchain transactions and analytics. 📈
* **Retail Purchases**: Facilitate e-commerce and point-of-sale transactions. 🛍️
* **DeSci (Decentralized Science)**: Drive decentralized funding, collaboration, and payments for scientific research projects. 🔬
* **Gaming**: Support in-game economies, micropayments, and cross-platform transactions. 🎮



## Interactions & Overview🔄

Process Overview 🌀

### Scalability and Extensibility 🚀

## API Documentation 🔐

###



## Getting Started with PepePay 🚀💰🌟

### Prerequisites 🛠️✅📋

Before diving into PepePay, ensure you have the following ready:

* **Node.js 16+**: [Download Node.js](https://nodejs.org/). 🖥️✨
* **A PepePay Account**: [Sign up for PepePay](https://pepepay.com/register). 🖊️🔑
* **Git for Version Control**: [Install Git](https://git-scm.com/). 📂🔄
* **Code Editor**: [Download VS Code](https://code.visualstudio.com/). 🖌️📘

### Installation 🖥️📦✨

Follow these steps to set up PepePay on your local environment:

1.  **Clone the Repository** 🛠️:

    ```bash
    git clone https://github.com/pepepay/pepepay.git
    ```
2.  **Enter the Directory** 📂:

    ```bash
    cd pepepay
    ```
3.  **Install Dependencies** 📥:

    ```bash
    npm install
    ```
4.  **Build the Project** 🏗️:

    ```bash
    npm run build
    ```
5.  **Configure Environment Variables** 🔧: Copy the example `.env` file and customize it for your setup:

    ```bash
    cp .env.example .env
    ```

    Edit `.env` to include your keys:

    ```
    API_KEY=your_api_key_here
    WEBHOOK_URL=https://yourdomain.com/webhook
    ```

### Choose Your Payment Model 🔄💵💡

PepePay supports various payment models to suit your business needs:

* **Hosted Payment Links** 🌐: Perfect for quick payment setups.
* **Embeddable Iframes** 🖼️: Seamlessly integrate with your website.
* **API Integration** 🔑: Build custom payment flows with full flexibility.

Refer to the [PepePay API Documentation](https://pepepay.com/docs/api) for detailed setup instructions. 📚✨

### Local Testing & Inference 🧪⚙️🔍

Set up a local testing environment to simulate payments:

1.  **Start the Local Server** 🖥️:

    ```bash
    npm run start
    ```
2. **Access the Dashboard** 📊: Open [http://localhost:3000](http://localhost:3000/) in your browser. 🌐✨
3. **Simulate Payments** 💳: Use the dashboard to create invoices and test payment flows. 🔄💡

### Create Your First Invoice 🧾📥🎉

1. **Log In to Your Account** 🔐: Visit [PepePay Login](https://pepepay.com/login) and enter your credentials. 🔑✨
2. **Navigate to Invoices** 📂: Go to the "Invoices" section in the dashboard. 📊📘
3. **Fill in Details** 📝:
   * Enter the amount in USD.
   * Select accepted cryptocurrencies.
   * Add optional metadata (e.g., order ID). 💵🧾
4. **Generate Invoice** 🔄: Click "Create" to generate the payment link or iframe. 🌐✨

### Platform Integration 🌍🔗📜

PePay offers integrations with popular platforms:

#### Discord Bot Setup 🤖💬✨

1. **Create a Bot**:
   * Visit the [Discord Developer Portal](https://discord.com/developers/applications). 🔗
   * Create a new application and generate a bot token. 🔑
2. **Configure PepePay**:
   *   Add your bot token to `.env`:

       ```
       DISCORD_BOT_TOKEN=your_discord_token_here
       ```
3.  **Run the Bot**:

    ```bash
    npm run discord-bot
    ```
4. **Add to Server**: Use the OAuth2 URL to invite the bot to your Discord server. 💬✨

### Basic Usage Examples 🛠️📚🎯

#### Chat with PePay 💬💡

Start the chat interface to interact with PePay:

```bash
npm run chat
```

#### Create Multiple Invoices 📊📂

Use the dashboard or API to create and manage multiple invoices at once. 🚀🎉

### Common Issues & Solutions 🔧❓✅

1. **Node.js Version Error**:
   *   Ensure Node.js 16+ is installed. Use:

       ```bash
       node -v
       ```
2. **Missing Dependencies**:
   *   Run:

       ```bash
       npm install
       ```
3. **Environment Variable Issues**:
   * Verify `.env` is correctly configured. 🌟🔍

### Next Steps 🌟🚀📈

Now that you’re set up, explore:

* [**Advanced Features**](https://pepepay.com/docs/advanced): Dive deeper into PePay’s capabilities. 📘✨
* [**Join the Community**](https://pepepay.com/community): Connect with other users and developers. 💬🌟
* [**API Documentation**](https://pepepay.com/docs/api): Build custom integrations with our detailed API docs. 📚🔗
