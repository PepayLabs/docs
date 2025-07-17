import type {ReactNode} from 'react';
import clsx from 'clsx';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import Layout from '@theme/Layout';
import HomepageFeatures from '@site/src/components/HomepageFeatures';
import Heading from '@theme/Heading';

import styles from './index.module.css';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <Heading as="h1" className="hero__title">
          Pepay
        </Heading>
        <p className="hero__subtitle">The Payment Layer for Autonomous Agents</p>
        <p className={styles.heroDescription}>
          The missing piece of the AI Agent Stack — enabling AI agents to transact value as seamlessly as they process language.
        </p>
        <div className={styles.buttons}>
          <Link
            className="button button--secondary button--lg margin-right--md"
            to="/docs/getting-started">
            Get Started 🚀
          </Link>
          <Link
            className="button button--outline button--lg"
            to="/docs/developers">
            Developer Docs 👨‍💻
          </Link>
        </div>
      </div>
    </header>
  );
}

export default function Home(): ReactNode {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title="Pepay Documentation"
      description="The Payment Layer for Autonomous Agents - Documentation, API Reference, and Developer Guide">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}
