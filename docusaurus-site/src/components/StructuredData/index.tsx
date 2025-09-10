import React from 'react';
import Head from '@docusaurus/Head';

const StructuredData = () => {
  const organizationData = {
    "@context": "https://schema.org",
    "@type": "Organization",
    "name": "Pepay",
    "url": "https://pepay.io",
    "logo": "https://docs.pepay.io/img/logo.svg",
    "description": "The Payment Layer for Autonomous Agents",
    "sameAs": [
      "https://twitter.com/pepay",
      "https://github.com/pepay",
      "https://discord.gg/pepay"
    ],
    "contactPoint": {
      "@type": "ContactPoint",
      "contactType": "customer service",
      "url": "https://docs.pepay.io"
    }
  };

  const softwareData = {
    "@context": "https://schema.org",
    "@type": "SoftwareApplication",
    "name": "Pepay Payment Protocol",
    "description": "The first protocol enabling AI agents to own their economy with self-custody wallets, multi-chain support, and autonomous invoicing.",
    "url": "https://docs.pepay.io",
    "author": {
      "@type": "Organization",
      "name": "Pepay Team"
    },
    "applicationCategory": "DeveloperApplication",
    "operatingSystem": "Web",
    "offers": {
      "@type": "Offer",
      "price": "0",
      "priceCurrency": "USD"
    },
    "featureList": [
      "Self-Custody Wallets",
      "Multi-Chain Support",
      "Autonomous Invoicing",
      "Time-Bound Payments",
      "Partial Payment System",
      "AI Agent Integration"
    ]
  };

  const websiteData = {
    "@context": "https://schema.org",
    "@type": "WebSite",
    "name": "Pepay Documentation",
    "url": "https://docs.pepay.io",
    "description": "Complete documentation for Pepay - The Payment Layer for Autonomous Agents",
    "publisher": {
      "@type": "Organization",
      "name": "Pepay"
    },
    "potentialAction": {
      "@type": "SearchAction",
      "target": "https://docs.pepay.io/search?q={search_term_string}",
      "query-input": "required name=search_term_string"
    }
  };

  const techArticleData = {
    "@context": "https://schema.org",
    "@type": "TechArticle",
    "headline": "Pepay: The Payment Layer for Autonomous Agents",
    "description": "Learn how Pepay enables AI agents to transact value with self-custody wallets, multi-chain support, and autonomous invoicing.",
    "author": {
      "@type": "Organization",
      "name": "Pepay Team"
    },
    "publisher": {
      "@type": "Organization",
      "name": "Pepay",
      "logo": {
        "@type": "ImageObject",
        "url": "https://docs.pepay.io/img/logo.svg"
      }
    },
    "datePublished": "2024-12-01",
    "dateModified": new Date().toISOString(),
    "mainEntityOfPage": {
      "@type": "WebPage",
      "@id": "https://docs.pepay.io"
    },
    "image": {
      "@type": "ImageObject",
      "url": "https://docs.pepay.io/img/pepay-social-card.jpg",
      "width": 1200,
      "height": 630
    }
  };

  return (
    <Head>
      <script type="application/ld+json">
        {JSON.stringify(organizationData)}
      </script>
      <script type="application/ld+json">
        {JSON.stringify(softwareData)}
      </script>
      <script type="application/ld+json">
        {JSON.stringify(websiteData)}
      </script>
      <script type="application/ld+json">
        {JSON.stringify(techArticleData)}
      </script>
    </Head>
  );
};

export default StructuredData;