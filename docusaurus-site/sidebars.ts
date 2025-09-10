import type {SidebarsConfig} from '@docusaurus/plugin-content-docs';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

/**
 * Creating a sidebar enables you to:
 - create an ordered group of docs
 - render a sidebar for each doc of that group
 - provide next/previous navigation

 The sidebars can be generated from the filesystem, or explicitly defined here.

 Create as many sidebars as you want.
 */
const sidebars: SidebarsConfig = {
  gettingStartedSidebar: [
    'getting-started/index',
    'getting-started/key-features',
    'getting-started/use-cases',
    'getting-started/universal-payment-use-cases',
    'getting-started/business-use-cases',
    'getting-started/competitors',
    'getting-started/architecture-and-technical-design',
    'getting-started/product-workflow',
  ],

  developersSidebar: [
    'developers/pepay-api',
    'developers/pepay-sdk',
    'developers/pepay-n8n',
  ],

  furtherReadingSidebar: [
    'further-reading/articles',
  ],
};

export default sidebars;
