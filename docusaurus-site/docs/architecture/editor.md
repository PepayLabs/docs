---
title: Editor
sidebar_position: 6
---

# Editor

:::info
This page contains architectural information about PePay. For the complete technical architecture documentation, please refer to [Technologies & Architecture of PePay](./technologies-and-architecture-of-pepay).
:::

## Overview

The editor component in PePay's architecture handles the configuration and management of payment interfaces, allowing merchants to customize their payment experiences.

## Key Features

- **Payment Interface Customization**: Modify the look and feel of payment forms
- **Token Configuration**: Select which cryptocurrencies to accept
- **Invoice Management**: Create and edit invoice templates
- **Webhook Configuration**: Set up real-time payment notifications

## Integration Points

The editor interfaces with several key components of PePay's architecture:

1. **Backend API**: For saving and retrieving configurations
2. **Database**: Storing merchant preferences and settings
3. **Frontend Dashboard**: Providing the user interface for configuration
4. **Payment Processing**: Applying configurations to live payment flows

For detailed information about the underlying technologies and architecture, see [Technologies & Architecture of PePay](./technologies-and-architecture-of-pepay).