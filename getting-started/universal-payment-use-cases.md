---
icon: earth-americas
---

# Universal Payment Use Cases

### 1 · E-commerce Checkout Widget

**Elevator Pitch**\
Drop-in plugin (WordPress, WooCommerce, Wix, PrestaShop) that lets any store accept _any_ token on _any_ chain and settle to the merchant’s preferred stablecoin—100 % non-custodially.

**How It Works**

1. Merchant installs the Pepay plugin.
2. Cart subtotal → fiat-equivalent in shopper’s token of choice (e.g., $49.99 → 37 DOGE).
3. **MCP/SDK bundle** (`amount + token + chain + slippageGuard`) sent as a single JSON.
4. Shopper pays; Pepay routes the swap on the lowest-slippage DEX (< 30 s).
5. **1 % fee auto-burns $RUNEY**; net funds land directly in merchant wallet.

**Why It Matters**

* Avoid 4% Mastercard or Visa processing fees
* Unlocks meme-coin buyers without price-risk.
* No chargebacks, no CEX settlement delays, no PCI scope.
* One plugin ≈ _Coinbase Commerce + Alchemy Pay_—but non-custodial.

***

### 2 · Subscription & SaaS Billing

**Elevator Pitch**\
Recurring-payment API for SaaS teams who want crypto subs with stable-fiat predictability.

**How It Works**

* User approves a **pull-payment smart contract** (no cards).
* Each cycle, Pepay swaps → settles to USD1/USDC → fires webhook.
* Failed swaps auto-retry across fallback tokens/chains.

**Why It Matters**

* Predictable MRR in fiat, flexible pay-in for users.
* Zero PCI overhead; merchant never touches keys.
* Ideal for VPNs, dev tools, newsletters, game passes.

***

### 3 · Freelance Escrow & Marketplace Payouts

**Elevator Pitch**\
Lightweight escrow layer that drops marketplace rake from 20 % to \~1 %.

**How It Works**

1. Client creates escrow via Pepay SDK, funding with any asset.
2. Funds lock until `POST /release` signed by both parties or arbiter.
3. Pepay swaps to freelancer’s chosen coin; settles instantly.
4. **Fee split:** 0.7 % burned, 0.3 % rebated to marketplace.

**Why It Matters**

* Global talent paid same-day, minus pennies in gas.
* Marketplaces earn _without_ custody, KYC headache, or FX spread.
* Goodbye Upwork/PayPal hold periods.

***

### 4 · In-Game Micro-Transactions

**Elevator Pitch**\
Unity/Godot SDK for on-chain IAP—skins, loot boxes, DLC—priced in stables, payable in gamers’ meme holdings.

**How It Works**

* Player picks token; SDK  handles swap + dev treasury settlement.
* NFT asset mints & delivers in one tx.

**Why It Matters**

* Avoids Apple/Steam 30 % cut.
* Directly works within gaming frameworks rather than building chain centric games&#x20;
* Build token-centric game ecosystem efficiently.&#x20;
* “Any-token onboarding” slashes friction for degen gamers.
* Gas abstraction hides blockchain UX from casual users.

***

### 5 · Point-of-Sale (POS) for Brick-and-Mortar

> **Key Promise**\
> If the price tag says **$4.50**, _exactly_ $4.50 lands in the merchant’s wallet—every time.

**Elevator Pitch**\
Tablet/phone POS for cafés, events, pop-ups—tap to pay with any token, instant stablecoin settlement.

**How It Works**

1. Cashier types amount → QR with MCP bundle appears.
2. Customer scans & pays.
3. Pepay webhook confirms payment; receipt prints.
4. Works offline—QRs queue until connection resumes.

**Why It Matters**

* Instant finality, zero FX fees, no hardware swap.
* “Pennies to Teslas” scalability—any ticket size, same UX.
* Every sale burns a bit of $RUNEY: built-in loyalty story for crypto crowds.

***

### 6 · Crowdfunding & Pre-Sale Platforms

**Elevator Pitch**\
Kickstarter-style campaigns that accept any token while tracking progress in fiat.

**How It Works**

* Creator sets goal & accepted tokens.
* Backers pledge; Pepay swaps in-flight to campaign treasury.
* Real-time USD dashboard; milestone-based vesting.

**Why It Matters**

* Eliminates volatility for project owners.
* Backers pledge with on-hand coins—no off-ramp friction.
* Built-in escrow / vesting = higher trust, less fraud.

***

### 7 · Payroll & Mass Payouts

**Elevator Pitch**\
Bulk-payment wizard for DAOs, esports teams, global startups.

**How It Works**

1. HR uploads CSV (`address, amountUSD`).
2. Pepay batches swaps, nets gas, executes multi-send across chains.
3. Ledger returns fiat-exact receipt per employee.

**Why It Matters**

* One-click weekly payroll, no manual swaps.
* Contributors choose token; company books clean USD expense.
* Beats Wise/Payoneer fees for emerging-market talent.

***

### 8 · Real-World Asset (RWA) Settlement Rail

**Elevator Pitch**\
Pepay serves as the compliant settlement layer for tokenized invoices, real-estate shares, carbon credits.

**How It Works**

1. Buyer pays with any token; funds escrow until off-chain asset transfer.
2. Seller receives stablecoin immediately upon oracle confirmation.
3. Hash-linked audit trail logged on-chain.

**Why It Matters**

* Replaces slow, expensive banking rails.
* Non-custodial flow meets “no-commingling” rules.
* Precise fiat parity keeps auditors and regulators happy.

***

> **Bill Walsh, Jeff Bezos, Walt Disney—same principle:**\
> &#xNAN;_&#x45;xecute flawlessly on what you control; the score (and revenue) takes care of itself._

**Pepay** gives builders that control—outside the AI-agent niche—unlocking fee-generating volume across **commerce, gaming, finance, and the physical world.**
