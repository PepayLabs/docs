---
slug: protocol-roadmap
title: Pepay Protocol Roadmap - The Path to Full MainNet and Beyond
authors: [pepay]
tags: [roadmap, development, future, mainnet, sdk]
date: 2024-12-20
---

# Pepay Protocol Roadmap

As the protocol reaches full production readiness, the following roadmap outlines the immediate next steps toward scaling adoption, ensuring system robustness, and expanding multi-chain coverage.

<!-- truncate -->

## Phase: Transition to Full MainNet Availability

**Status: In Progress ✅**

The core payment infrastructure is live and operational across supported networks. The next focus is ensuring long-term reliability, secure settlement pipelines, and developer tooling for broader adoption.

### MainNet Transition Milestones

* ✅ **Testnet/Mainnet Parity Achieved** — Unified RPC layer for cross-environment consistency
* 🚧 **99.9% Uptime SLA** — Moving toward enterprise-grade availability targets
* ◻️ **Increasing Settlement Robustness** - Making sure on failure cases automation in place to handle especially in dynamic swaps
* ✅ **Auditable Settlement Pipeline** — Verifiable logs and dispute resolution architecture
* ◻️ **Mainnet Usage Analytics** — Volume, error rate, uptime, transaction speed monitoring

## Phase: Agent SDK & Decentralized Marketplace 🚀

**Focus: Enable open discovery, self-service onboarding, and verifiable performance**

### Core Agent Layer (Planned)

* ◻️ **Agent SDK** — UI components & backend wrappers for agent integration
* ◻️ **Agent Discovery Protocol** — Public marketplace to browse by category, service, rating
* ◻️ **Agent service search** — Agent discovery. Agent availability, pricing, and verified performance metrics
* ◻️ **Performance Analytics** — Built-in dashboards for agents to track growth and reputation

This layer formalizes the **trustless agent economy** on top of your composable service/payment rails.

## Phase: Ecosystem Hardening & Chain Expansion (Gen1 🔜)

**Focus: Infrastructure resilience and developer scalability**

### Network Stability

* 🚧 **Multi-Network Support in RPC Layer** — Current testnet/mainnet shared architecture
* ◻️ **Gas Fee Optimization Engine** — Estimate & auto-adjust gas costs across chains
* ◻️ **Fiat Equivalent Stables optimization** — Estimate & auto-adjust gas costs across chains

### New Chains & Protocols

* 🚧 **Avalanche (AVAX) Testnet Integration**
* ◻️ **Cross-Chain Transfer Routes** — Generalized asset routing logic
* ✅ **Token Expansion Framework** — Easily onboard new tokens with on-chain config, Built for solana, bnb, base, any evm
  * add SUI APTO AND XRP

### Developer Tooling

* ✅ **User Onboarding Flow (Internal)**
* ◻️ **Python SDK**
* ◻️ **Admin Inventory Management Tools**
* ◻️ **Farcaster Frames Integration**
* 🚧 **Pydantic-Based Type Enforcement (Backend Stability)**
* ◻️ **Virtuals Integration for AI Agent Compatibility**

## Gen2 – Yield & Protocol-Owned Liquidity (R&D)

**Focus: Ecosystem value capture and decentralized capital flows**

Planned modules:

* ◻️ **Yield Layer for $USD1** — Protocol-native stablecoin yield strategy
* ◻️ **Liquidity Routing Vaults** — Custom routing for LP-backed yield products
* ◻️ **Settlement Buffer Contracts** — Hold-and-distribute contracts to absorb volatility
* ◻️ **On-Chain Fee Streams** — Trackable, redeemable protocol revenue in real time

## E-Commerce Integrations

**Focus: Embedded crypto checkout across major site builders & open-source commerce platforms**

Your protocol is becoming plug-and-play across the most widely used CMS and commerce platforms. The goal: make it effortless for creators, merchants, and nonprofits to accept crypto payments on their own sites — no coding required.

### Completed

* **WordPress Plugin** — Full Pepay integration via shortcode or widget
  * Drag-and-drop embed
  * Admin UI for connecting wallets & supported tokens
  * Auto-generation of invoices via WooCommerce hooks (optional)

### In Progress

* **Wix Plugin**
  * Web-based iframe drop-in
  * OAuth-based creator login with keyless connection
* **PrestaShop Integration**
  * Open-source module
  * Full crypto payment flow for merchants with zero custody

### Planned (Q3)

* **OpenCart**
* **Magento**
* **Ghost CMS**
* **Drupal Commerce**

These integrations will follow the same model:

* Non-custodial wallet setup (with optional escrow)
* Configurable tokens/networks per store
* Payment status webhooks and invoice tracking

### Not Currently Supported

* **Shopify**
  * Due to API limitations on custom payment providers
  * Under evaluation pending future partnership/Shopify Plus support

**Why it matters:**  
This layer unlocks _massive real-world utility_—turning basic websites into crypto-native storefronts and donation portals with 5-minute installs. From WordPress bloggers to PrestaShop retailers, your protocol meets users where they are.

## Ongoing Infrastructure Upgrades

* ◻️ **Continued Network Hardening** — Monitoring, rate limiting, cache isolation
* ◻️ **Settlement Failure Simulation** — Internal tooling to test protocol-wide settlement failure conditions
* ◻️ **Security Reviews** — Recurring internal + external audits (Q3 onwards)
* ◻️ **Token Whitelisting Portal** — Permissionless but verifiable token addition mechanism
* ◻️ **Multi-Region Redundancy** — Geo-distributed RPC + webhook system resilience

## Summary

Next step: unlock developer velocity and liquidity loopbacks.

* ◻️ Unified Assets System
* ◻️ Multiple Off-Ramp APIs

## Future Improvements 🔮

| Category           | Initiatives                          | Status           |
| ------------------ | ------------------------------------ | ---------------- |
| **Chain Support**  | Polygon ◻️, TON ◻️, Near Protocol ◻️ | In consideration |
| **Dev Experience** | Python SDK 🚧                        | Q2 target        |
| **Security**       | Third-party audits ✅                 | 🚧 In Progress   |
| **Community**      | Ambassador program 🚧                | Onboarded 100+   |

**Key**:  
✅ = Completed | 🚧 = In Progress | ◻️ = Not Started

> _"Shipping beats perfection"_ - Updated weekly in our development sprints