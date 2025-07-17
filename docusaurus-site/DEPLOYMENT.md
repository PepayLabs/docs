# Deployment Guide

This guide explains how to deploy the Pepay documentation website to Google Cloud Platform.

## Prerequisites

Before deploying, ensure you have:

1. **Google Cloud SDK** installed and configured
2. **Node.js 16+** and **npm** installed
3. A **GCP project** with billing enabled
4. **Cloud Storage API** enabled in your project
5. **Appropriate IAM permissions** for Cloud Storage

## Quick Setup

### 1. Install Google Cloud SDK

**Windows:**
```powershell
# Download and install from: https://cloud.google.com/sdk/docs/install
# Or use chocolatey:
choco install gcloudsdk
```

**macOS:**
```bash
# Using Homebrew:
brew install google-cloud-sdk
```

**Linux:**
```bash
# Using snap:
sudo snap install google-cloud-sdk --classic
```

### 2. Authenticate with Google Cloud

```bash
gcloud auth login
gcloud auth application-default login
```

### 3. Create GCP Project (if needed)

```bash
gcloud projects create your-project-id
gcloud config set project your-project-id
```

### 4. Enable Required APIs

```bash
gcloud services enable storage-component.googleapis.com
gcloud services enable storage.googleapis.com
```

### 5. Create Storage Bucket

```bash
gsutil mb gs://docs-pepay-io
```

## Deployment Options

### Option 1: PowerShell Script (Recommended for Windows)

```powershell
# Basic deployment
.\deploy.ps1 -ProjectId "your-project-id"

# Production deployment
.\deploy.ps1 -ProjectId "your-project-id" -Production

# Skip build step (use existing build)
.\deploy.ps1 -ProjectId "your-project-id" -SkipBuild

# Custom bucket name
.\deploy.ps1 -ProjectId "your-project-id" -BucketName "my-custom-bucket"

# Show help
.\deploy.ps1 -Help
```

### Option 2: Batch Script (Windows CMD)

```cmd
# Basic deployment
deploy.bat "your-project-id"

# Production deployment
deploy.bat "your-project-id" production
```

### Option 3: Manual Deployment

```bash
# Install dependencies
npm install

# Build the site
npm run build

# Deploy to GCS
gsutil -m rsync -r -d ./build gs://docs-pepay-io

# Set cache headers
gsutil -m setmeta -h "Cache-Control:public,max-age=31536000" gs://docs-pepay-io/static/**
gsutil -m setmeta -h "Cache-Control:public,max-age=3600" gs://docs-pepay-io/*.html

# Configure for website hosting
gsutil web set -m index.html -e 404.html gs://docs-pepay-io

# Make public (production only)
gsutil iam ch allUsers:objectViewer gs://docs-pepay-io
```

## Domain Configuration

### 1. Configure Custom Domain

To use `docs.pepay.io` with your Cloud Storage bucket:

```bash
# Create a CNAME record pointing to:
# c.storage.googleapis.com

# Verify domain ownership in Google Search Console
# https://search.google.com/search-console/
```

### 2. SSL Certificate

For HTTPS support, you'll need to:

1. Set up a Load Balancer
2. Configure SSL certificate
3. Point domain to Load Balancer IP

```bash
# Create SSL certificate
gcloud compute ssl-certificates create pepay-docs-ssl \
    --domains docs.pepay.io

# Create backend bucket
gcloud compute backend-buckets create pepay-docs-backend \
    --gcs-bucket-name docs-pepay-io
```

## Configuration Files

### deploy.config.json

You can modify `deploy.config.json` to customize deployment settings:

```json
{
  "gcp": {
    "projectId": "your-project-id",
    "bucketName": "docs-pepay-io",
    "region": "us-central1"
  },
  "deployment": {
    "domain": "docs.pepay.io",
    "cacheControl": {
      "static": "public,max-age=31536000",
      "html": "public,max-age=3600"
    }
  },
  "build": {
    "nodeEnv": "production",
    "outputDir": "./build"
  }
}
```

## Environment Variables

You can set these environment variables for customization:

```bash
# Node environment
export NODE_ENV=production

# Custom build directory
export BUILD_DIR=./dist

# GCP project
export GOOGLE_CLOUD_PROJECT=your-project-id
```

## CI/CD Integration

### GitHub Actions Example

```yaml
name: Deploy Documentation

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    
    - name: Setup Node.js
      uses: actions/setup-node@v3
      with:
        node-version: '18'
        cache: 'npm'
        cache-dependency-path: docusaurus-site/package-lock.json
    
    - name: Setup Google Cloud SDK
      uses: google-github-actions/setup-gcloud@v1
      with:
        project_id: ${{ secrets.GCP_PROJECT_ID }}
        service_account_key: ${{ secrets.GCP_SA_KEY }}
        export_default_credentials: true
    
    - name: Install dependencies
      run: |
        cd docusaurus-site
        npm install
    
    - name: Build site
      run: |
        cd docusaurus-site
        npm run build
    
    - name: Deploy to GCS
      run: |
        cd docusaurus-site
        gsutil -m rsync -r -d ./build gs://docs-pepay-io
```

## Monitoring and Analytics

### Google Analytics

Add your Google Analytics tracking ID to `docusaurus.config.ts`:

```typescript
gtag: {
  trackingID: 'G-XXXXXXXXXX',
  anonymizeIP: true,
}
```

### Google Search Console

1. Add your site to Google Search Console
2. Submit your sitemap: `https://docs.pepay.io/sitemap.xml`
3. Monitor indexing and search performance

## Troubleshooting

### Common Issues

**Permission Denied:**
```bash
# Check if you're authenticated
gcloud auth list

# Re-authenticate if needed
gcloud auth login
```

**Bucket Not Found:**
```bash
# Create the bucket
gsutil mb gs://docs-pepay-io

# Check bucket permissions
gsutil iam get gs://docs-pepay-io
```

**Build Failures:**
```bash
# Clear cache and reinstall
npm run clear
rm -rf node_modules
npm install

# Check Node version
node --version  # Should be 16+
```

**Domain Not Working:**
- Verify DNS CNAME record
- Check domain ownership in Search Console
- Ensure SSL certificate is active

### Debug Commands

```bash
# Test bucket access
gsutil ls gs://docs-pepay-io

# Check website configuration
gsutil web get gs://docs-pepay-io

# Test deployed site
curl -I https://storage.googleapis.com/docs-pepay-io/index.html

# Check DNS resolution
nslookup docs.pepay.io
```

## Performance Optimization

### CDN Configuration

For better performance, consider setting up Cloud CDN:

```bash
# Create HTTP(S) load balancer with CDN
gcloud compute url-maps create pepay-docs-map \
    --default-backend-bucket pepay-docs-backend

gcloud compute target-https-proxies create pepay-docs-proxy \
    --url-map pepay-docs-map \
    --ssl-certificates pepay-docs-ssl
```

### Caching Strategy

The deployment script automatically sets optimal cache headers:

- **Static assets** (JS/CSS): 1 year cache
- **HTML files**: 1 hour cache
- **Images**: 1 year cache

## Security Considerations

### IAM Permissions

Create a service account with minimal permissions:

```bash
# Create service account
gcloud iam service-accounts create pepay-docs-deployer \
    --display-name "Pepay Docs Deployer"

# Grant storage permissions
gcloud projects add-iam-policy-binding your-project-id \
    --member serviceAccount:pepay-docs-deployer@your-project-id.iam.gserviceaccount.com \
    --role roles/storage.objectAdmin
```

### Bucket Security

```bash
# Remove public access (if needed)
gsutil iam ch -d allUsers:objectViewer gs://docs-pepay-io

# Add specific user access
gsutil iam ch user:user@example.com:objectViewer gs://docs-pepay-io
```

## Cost Optimization

### Storage Costs

- Use **Standard** storage class for frequently accessed content
- Consider **Nearline** for archived content
- Enable **Object Lifecycle Management** to automatically transition old versions

### Bandwidth Costs

- Use Cloud CDN to reduce egress charges
- Enable compression for text files
- Optimize images and assets

## Support

For deployment issues:

1. Check this guide first
2. Review the [CLAUDE.md](../CLAUDE.md) for comprehensive project information
3. Check Google Cloud documentation
4. Contact the development team

---

*This deployment guide is maintained alongside the Pepay documentation project.*