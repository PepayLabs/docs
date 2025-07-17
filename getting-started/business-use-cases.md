---
icon: business-time
---

# Business Use Cases&#x20;

## 🏢 Business Use Cases

> **Promise to the enterprise:**\
> &#xNAN;_&#x55;niversal asset in, exact-fiat ou, audit trails, and sub-30-second finality._

***

### 1 · Cross-Border Supplier Payments & Treasury FX Netting

**Scenario**\
A US electronics brand owes ¥32 million to three Shenzhen suppliers. Instead of wiring USD → CNH through correspondent banks, the treasury desk settles in USDC, while each supplier auto-receives CNH-pegged stablecoins. Pepay:

* Merchants runs supplier **KYC / sanctions screening** on-chain.
* Executes atomic swaps on DEX liquidity, locking FX at time of send.
* Writes a hash-linked settlement record (ISO-20022 payload) for auditors.

**Why It Matters**

* **T+0 finality**, vs. 2-3 business-day wires.
* 50-80 bp cheaper than SWIFT FX margin.
* Immutable audit log → SOX & IFRS compliant.

***

### 2 · KYC-Enforced Global Payroll

**Scenario**\
A 1 200-person remote workforce spans 34 countries. Pepay’s payroll API:

* Accepts a single USD ledger from SAP SuccessFactors.
* Performs **geo-fenced KYC/AML** per employee.
* Multi-sends local-currency stables (BRL-c, GBP-g, PHP-p) in one batch.
* Returns a reconciled journal entry in USD1 for the ERP.

**Why It Matters**

* Eliminates 3rd-party pay agents and middle-office FX fees.
* Employees receive funds in minutes, not days.
* Company books a single fiat expense line for clean accounting.

***

### 3 · Chain-of-Custody Trade Finance & Invoice Factoring

**Scenario**\
A logistics firm tokenises $5 M of freight invoices as NFTs. Institutional buyers purchase the receivables in WBTC; Pepay:

1. **Escrows** buyer funds until IoT oracle confirms cargo arrival.
2. Executes swap → pays originator in USD1.
3. Logs a notarised PDF + tx hash into the ERP’s document store.

**Why It Matters**

* Cuts invoice discounting time from 30 d to < 24 h.
* Removes double-financing risk via on-chain provenance.
* Provides banks an immutable trail for Basel III compliance.

***

### 4 · Carbon-Credit Settlement & ESG Reporting

**Scenario**\
A Fortune 500 pledges net-zero. It buys tokenised carbon credits from five registries across three chains. Pepay:

* Screens sellers via **KYB & Verra certificate hashes**.
* Swaps the buyer’s treasury USDC into registry-specific tokens.
* Burns credits on-chain and exports a Form 8936-ready CSV.

**Why It Matters**

* One-click compliance with SEC Scope-3 disclosure rules.
* Eliminates brokerage middlemen and registry lock-in.
* Real-time dashboard proves retirement to shareholders.

***

### 5 · Rebate & Loyalty Settlement for Multinational Retail

**Scenario**\
Walmart issues **WalmartUSD** stable-coin rebates. A franchisee in Mexico wants pesos; a supplier in India wants USDT. Pepay routes every claim:

* Verifies **CIP/KYC** of claimant.
* Converts loyalty token → local-currency stable → claimant wallet.
* Pushes settlement data to Oracle NetSuite for tax reporting.

**Why It Matters**

* Global, instant redemption with no FX spread.
* Reduces loyalty liability on corporate balance sheet in real time.
* In-house finance teams keep GAAP-grade records automatically.

***

### 6 · High-Value B2B Escrow with Multi-Sig Governance

**Scenario**\
Two Fortune 100s execute a $75 M IP licensing deal. Terms require staged payments tied to patent-office milestones. Pepay:

* Creates a **multi-sig escrow** (双方 + neutral arbiter).
* Releases tranches automatically when Chainlink attests milestone IDs.
* Provides board-level PDF statements signed by a Big 4 audit plug-in.

**Why It Matters**

* Removes irrevocable letter-of-credit costs (\~1 % face value).
* Transparent milestone tracking lowers counterparty risk.
* Satisfies internal audit & SEC material-contract tracing.

***

> **Enterprise takeaway:**\
> With Pepay, any asset—future AmazonUSD, a regional CBDC, or today’s meme coin—can settle into the precise fiat figure your ledger demands, wrapped in KYC, AML, and audit layers your CFO and regulators will love.
