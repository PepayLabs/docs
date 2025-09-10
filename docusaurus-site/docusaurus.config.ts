import {themes as prismThemes} from 'prism-react-renderer';
import type {Config} from '@docusaurus/types';
import type * as Preset from '@docusaurus/preset-classic';

// This runs in Node.js - Don't use client-side code here (browser APIs, JSX...)

const config: Config = {
  title: 'Pepay Documentation',
  tagline: 'The Payment Layer for Autonomous Agents',
  favicon: 'img/favicon.ico',

  // Future flags, see https://docusaurus.io/docs/api/docusaurus-config#future
  future: {
    v4: true, // Improve compatibility with the upcoming Docusaurus v4
  },

  // ---- Hosting (GitHub Pages project site) ----
  // Site will be served at: https://pepaylabs.github.io/docs/
  url: 'https://pepaylabs.github.io',
  baseUrl: '/docs/',

  // GitHub Pages deployment config.
  organizationName: 'PepayLabs', // GitHub org/user
  projectName: 'docs',           // Repo name

  // SEO and metadata
  trailingSlash: false,
  noIndex: false,
  staticDirectories: ['static'],
  customFields: {
    description:
      'Pepay is the first protocol enabling AI agents to own their economy with self-custody wallets, multi-chain support, and autonomous invoicing.',
    keywords:
      'pepay, AI agents, cryptocurrency, payment gateway, blockchain, autonomous agents, crypto payments, multi-chain, self-custody, invoicing',
  },

  onBrokenLinks: 'warn',
  onBrokenMarkdownLinks: 'warn',

  // Even if you don't use internationalization, you can use this field to set
  // useful metadata like html lang.
  i18n: {
    defaultLocale: 'en',
    locales: ['en'],
  },

  presets: [
    [
      'classic',
      {
        docs: {
          sidebarPath: './sidebars.ts',
          // Edit links point to the site folder inside the repo
          editUrl:
            'https://github.com/PepayLabs/docs/tree/main/docusaurus-site/',
          showLastUpdateTime: true,
          showLastUpdateAuthor: true,
          breadcrumbs: true,
        },
        blog: {
          showReadingTime: true,
          feedOptions: {
            type: ['rss', 'atom'],
            xslt: true,
            title: 'Pepay Blog',
            description:
              'Latest updates, roadmap, and announcements from the Pepay team',
            copyright: `Copyright © ${new Date().getFullYear()} Pepay.`,
            language: 'en',
          },
          editUrl:
            'https://github.com/PepayLabs/docs/tree/main/docusaurus-site/',
          onInlineTags: 'warn',
          onInlineAuthors: 'warn',
          onUntruncatedBlogPosts: 'warn',
          blogTitle: 'Pepay Blog',
          blogDescription:
            'Latest updates, roadmap, and announcements from the Pepay team',
          blogSidebarTitle: 'Recent posts',
          blogSidebarCount: 10,
          postsPerPage: 10,
          include: ['**/*.{md,mdx}'],
          exclude: [
            '**/_*.{js,jsx,ts,tsx,md,mdx}',
            '**/_*/**',
            '**/*.test.{js,jsx,ts,tsx}',
            '**/__tests__/**',
          ],
        },
        theme: {
          customCss: './src/css/custom.css',
        },
        sitemap: {
          changefreq: 'weekly',
          priority: 0.5,
          ignorePatterns: ['/tags/**'],
          filename: 'sitemap.xml',
        },
        gtag: {
          trackingID: 'G-XXXXXXXXXX', // Replace with your Google Analytics ID
          anonymizeIP: true,
        },
      } satisfies Preset.Options,
    ],
  ],

  plugins: [
    [
      '@docusaurus/plugin-pwa',
      {
        debug: true,
        offlineModeActivationStrategies: ['appInstalled', 'standalone', 'queryString'],
        pwaHead: [
          { tagName: 'link', rel: 'icon', href: '/img/logo.svg' },
          { tagName: 'link', rel: 'manifest', href: '/manifest.json' },
          { tagName: 'meta', name: 'theme-color', content: '#667eea' },
          { tagName: 'meta', name: 'apple-mobile-web-app-capable', content: 'yes' },
          { tagName: 'meta', name: 'apple-mobile-web-app-status-bar-style', content: '#667eea' },
          { tagName: 'link', rel: 'apple-touch-icon', href: '/img/logo.svg' },
          { tagName: 'link', rel: 'mask-icon', href: '/img/logo.svg', color: '#667eea' },
          { tagName: 'meta', name: 'msapplication-TileImage', content: '/img/logo.svg' },
          { tagName: 'meta', name: 'msapplication-TileColor', content: '#667eea' },
        ],
      },
    ],
  ],

  themeConfig: {
    // Social card for link previews (Docusaurus will prefix with url/baseUrl)
    image: 'img/pepay-social-card.jpg',
    metadata: [
      { name: 'keywords', content: 'pepay, AI agents, cryptocurrency, payment gateway, blockchain, autonomous agents, crypto payments, multi-chain, self-custody, invoicing, API, SDK' },
      { name: 'description', content: 'Pepay is the first protocol enabling AI agents to own their economy with self-custody wallets, multi-chain support, and autonomous invoicing.' },
      { name: 'author', content: 'Pepay Team' },
      { name: 'robots', content: 'index, follow' },
      { name: 'language', content: 'en' },
      { property: 'og:title', content: 'Pepay Documentation - The Payment Layer for Autonomous Agents' },
      { property: 'og:description', content: 'Pepay is the first protocol enabling AI agents to own their economy with self-custody wallets, multi-chain support, and autonomous invoicing.' },
      { property: 'og:type', content: 'website' },
      { property: 'og:site_name', content: 'Pepay Documentation' },
      { name: 'twitter:card', content: 'summary_large_image' },
      { name: 'twitter:site', content: '@pepay' },
      { name: 'twitter:creator', content: '@pepay' },
    ],
    navbar: {
      title: 'Pepay',
      logo: {
        alt: 'Pepay Logo',
        src: 'img/logo.svg',
      },
      items: [
        {
          type: 'docSidebar',
          sidebarId: 'gettingStartedSidebar',
          position: 'left',
          label: 'Getting Started',
        },
        {
          type: 'docSidebar',
          sidebarId: 'developersSidebar',
          position: 'left',
          label: 'Developers',
        },
        {
          type: 'docSidebar',
          sidebarId: 'furtherReadingSidebar',
          position: 'left',
          label: 'Further Reading',
        },
        { to: '/blog', label: "What's New", position: 'left' },
        { href: 'https://pepay.io', label: 'Platform', position: 'right' },
        { href: 'https://github.com/pepay', label: 'GitHub', position: 'right' },
      ],
    },
    footer: {
      style: 'dark',
      links: [
        {
          title: 'Documentation',
          items: [
            // With baseUrl '/docs/', this yields '/docs/docs/getting-started'
            { label: 'Getting Started', to: '/docs/getting-started' },
            { label: 'API Reference', to: '/docs/developers/pepay-api' },
            { label: 'SDK Guide', to: '/docs/developers/pepay-sdk' },
          ],
        },
        {
          title: 'Community',
          items: [
            { label: 'Discord', href: 'https://discord.gg/pepay' },
            { label: 'X (Twitter)', href: 'https://x.com/pepay' },
            { label: 'Telegram', href: 'https://t.me/pepay' },
          ],
        },
        {
          title: 'More',
          items: [
            { label: 'Platform', href: 'https://pepay.io' },
            { label: 'GitHub', href: 'https://github.com/pepay' },
            { label: "What's New", to: '/blog' }, // -> /docs/blog
          ],
        },
      ],
      copyright: `Copyright © ${new Date().getFullYear()} Pepay. Built by $PepeRuney team.`,
    },
    prism: {
      theme: prismThemes.github,
      darkTheme: prismThemes.dracula,
    },
  } satisfies Preset.ThemeConfig,
};

export default config;

