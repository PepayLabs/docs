# Pepay Documentation Project

## Overview

This project is a complete documentation website for Pepay - The Payment Layer for Autonomous Agents. It was built using Docusaurus and migrated from a GitBook-based documentation system to provide a modern, fast, and SEO-optimized documentation experience.

## Project Structure

```
pepay-docs/
├── docusaurus-site/           # Main Docusaurus application
│   ├── docs/                  # Documentation content
│   │   ├── getting-started/   # Getting started guides
│   │   ├── developers/        # Developer documentation
│   │   └── further-reading/   # Additional resources
│   ├── blog/                  # Blog posts (What's New)
│   ├── src/                   # React components and pages
│   │   ├── components/        # Reusable React components
│   │   ├── css/              # Global styles
│   │   └── pages/            # Custom pages
│   ├── static/               # Static assets
│   │   ├── img/             # Images and icons
│   │   └── robots.txt       # SEO configuration
│   ├── docusaurus.config.ts  # Main configuration
│   ├── sidebars.ts          # Navigation configuration
│   └── deploy.ps1           # Deployment script
├── .gitbook/                 # Original GitBook assets
├── architecture/             # Original architecture docs
├── developers/               # Original developer docs
├── getting-started/          # Original getting started docs
├── further-reading/          # Original further reading docs
├── whats-new/               # Original what's new docs
├── README.md                # Project README
└── CLAUDE.md               # This comprehensive guide
```

## Technology Stack

### Core Technologies
- **Docusaurus 3.8.1** - Modern static site generator
- **React** - Component-based UI framework
- **TypeScript** - Type-safe JavaScript
- **Node.js** - JavaScript runtime
- **npm** - Package manager

### SEO & Performance
- **Structured Data (JSON-LD)** - Rich search results
- **Open Graph Tags** - Social media optimization
- **Twitter Cards** - Twitter sharing optimization
- **Progressive Web App (PWA)** - Offline functionality
- **Service Worker** - Caching and performance
- **Sitemap** - Search engine indexing
- **RSS/Atom Feeds** - Content syndication

### Deployment
- **Google Cloud Platform** - Hosting infrastructure
- **Cloud Storage** - Static file hosting
- **PowerShell** - Deployment automation
- **gcloud CLI** - GCP management

## Content Organization

The documentation is organized into three main sections that mirror the original GitBook structure:

### 1. Getting Started
- **index.md** - Main landing page and overview
- **key-features.md** - Core functionality overview
- **use-cases.md** - Real-world applications
- **universal-payment-use-cases.md** - Cross-platform scenarios
- **business-use-cases.md** - Enterprise applications
- **competitors.md** - Market comparison
- **architecture-and-technical-design.md** - Technical deep-dive
- **product-workflow.md** - Process documentation

### 2. Developers
- **pepay-api.md** - REST API documentation
- **pepay-sdk.md** - Software development kit
- **pepay-n8n.md** - Workflow automation integration

### 3. Further Reading
- **articles.md** - External resources and references

### 4. What's New (Blog)
- **Protocol roadmap** - Future development plans
- **Milestones & accomplishments** - Achievement tracking
- **Change log** - Version history

## Key Features

### Modern Design System
- **Apple/Google-inspired UI** - Clean, professional appearance
- **Responsive Design** - Mobile-first approach
- **Dark/Light Mode** - Automatic theme switching
- **Modern Typography** - System fonts for optimal readability
- **Custom Color Palette** - Purple/blue gradient theme
- **Smooth Animations** - Hover effects and transitions

### SEO Optimization
- **Comprehensive Metadata** - Title, description, keywords for all pages
- **Structured Data** - Organization, software, website schemas
- **Open Graph Integration** - Rich social media previews
- **Twitter Card Support** - Optimized Twitter sharing
- **Sitemap Generation** - Automatic XML sitemap
- **Robots.txt** - Search engine crawling directives

### Performance Features
- **Static Site Generation** - Fast loading times
- **Code Splitting** - Lazy loading for better performance
- **Image Optimization** - Compressed and responsive images
- **Service Worker** - Offline functionality
- **PWA Support** - App-like experience
- **CDN-ready** - Optimized for content delivery networks

## Development Workflow

### Prerequisites
- Node.js 16+
- npm 8+
- Git
- Google Cloud SDK (for deployment)

### Setup
1. Clone the repository
2. Navigate to the Docusaurus directory:
   ```bash
   cd docusaurus-site
   ```
3. Install dependencies:
   ```bash
   npm install
   ```
4. Start development server:
   ```bash
   npm start
   ```

### Development Commands
- `npm start` - Start development server
- `npm run build` - Build for production
- `npm run serve` - Serve built files locally
- `npm run clear` - Clear build cache
- `npm run lint` - Run linting (if configured)

### Content Management

#### Adding New Documentation
1. Create markdown files in the appropriate directory:
   - `docs/getting-started/` - Getting started content
   - `docs/developers/` - Developer documentation
   - `docs/further-reading/` - Additional resources

2. Add frontmatter to each file:
   ```yaml
   ---
   title: "Your Page Title"
   description: "SEO-optimized description"
   keywords: ["keyword1", "keyword2"]
   image: "/img/pepay-social-card.jpg"
   sidebar_position: 1
   ---
   ```

3. Update `sidebars.ts` to include new pages in navigation

#### Adding Blog Posts
1. Create markdown files in `blog/` directory
2. Use date-based naming: `YYYY-MM-DD-slug.md`
3. Add frontmatter:
   ```yaml
   ---
   title: "Blog Post Title"
   description: "Post description"
   authors: pepay
   tags: [tag1, tag2]
   image: "/img/blog-image.jpg"
   ---
   ```

### Customization Guide

#### Styling
- **Global Styles**: `src/css/custom.css`
- **Component Styles**: `src/components/*/styles.module.css`
- **Color Variables**: Defined in `custom.css` root selector

#### Components
- **Homepage**: `src/pages/index.tsx`
- **Homepage Features**: `src/components/HomepageFeatures/`
- **Structured Data**: `src/components/StructuredData/`

#### Configuration
- **Site Config**: `docusaurus.config.ts`
- **Navigation**: `sidebars.ts`
- **SEO Settings**: Metadata section in `docusaurus.config.ts`

## Deployment Guide

### GCP Setup
1. Create a GCP project
2. Create a Cloud Storage bucket:
   ```bash
   gsutil mb gs://docs-pepay-io
   ```
3. Configure bucket for static website hosting:
   ```bash
   gsutil web set -m index.html -e 404.html gs://docs-pepay-io
   ```
4. Make bucket publicly readable:
   ```bash
   gsutil iam ch allUsers:objectViewer gs://docs-pepay-io
   ```

### Deployment Process
1. **Automated Deployment** (Recommended):
   ```powershell
   .\deploy.ps1 -ProjectId "your-project-id" -Production
   ```

2. **Manual Deployment**:
   ```bash
   npm run build
   gsutil -m rsync -r -d ./build gs://docs-pepay-io
   ```

### Domain Configuration
1. Point `docs.pepay.io` to the Cloud Storage bucket
2. Set up SSL certificate
3. Configure CDN for better performance

## Content Migration History

### Original Structure
The project was migrated from GitBook with the following transformations:
- **Removed hidden content** - Files marked with `hidden: true`
- **Restructured navigation** - Matched exact GitBook hierarchy
- **Added SEO metadata** - Comprehensive optimization
- **Modernized styling** - Apple/Google-inspired design
- **Enhanced performance** - Static site generation benefits

### Migration Process
1. **Content Audit** - Identified all markdown files
2. **Hidden Content Removal** - Filtered out draft/hidden files
3. **Structure Mapping** - Matched GitBook sidebar structure
4. **SEO Enhancement** - Added metadata and structured data
5. **Link Fixing** - Updated all internal references
6. **Asset Migration** - Moved images and static files
7. **Build Optimization** - Ensured clean production build

## SEO Implementation

### Page-Level SEO
- **Title Tags** - Unique, descriptive titles
- **Meta Descriptions** - Compelling descriptions under 160 characters
- **Keywords** - Relevant keyword targeting
- **Open Graph Tags** - Social media optimization
- **Twitter Cards** - Twitter sharing optimization
- **Canonical URLs** - Duplicate content prevention

### Structured Data
- **Organization Schema** - Company information
- **Software Application Schema** - Product details
- **Website Schema** - Site search functionality
- **Article Schema** - Blog post optimization

### Technical SEO
- **Sitemap** - XML sitemap generation
- **Robots.txt** - Crawling directives
- **Page Speed** - Optimized loading times
- **Mobile-First** - Responsive design
- **SSL Ready** - HTTPS compatibility

## Maintenance & Updates

### Regular Tasks
- **Content Updates** - Keep documentation current
- **Dependency Updates** - Keep packages up to date
- **Performance Monitoring** - Track loading times
- **SEO Monitoring** - Track search rankings
- **Link Checking** - Ensure all links work

### Monitoring
- **Google Analytics** - Track usage and performance
- **Search Console** - Monitor search presence
- **Lighthouse** - Performance and accessibility audits
- **Broken Link Checking** - Automated link validation

## Troubleshooting

### Common Issues

#### Build Errors
- **Broken Links**: Check all internal links and references
- **Missing Assets**: Ensure all images and files exist
- **TypeScript Errors**: Verify component types and props

#### Deployment Issues
- **GCP Authentication**: Ensure `gcloud auth login` is completed
- **Bucket Permissions**: Verify bucket exists and is accessible
- **DNS Configuration**: Check domain pointing to bucket

#### Performance Issues
- **Large Images**: Optimize images for web
- **Bundle Size**: Analyze and optimize JavaScript bundles
- **Cache Configuration**: Verify cache headers are set correctly

### Debug Commands
```bash
# Check build output
npm run build

# Test built site locally
npm run serve

# Check for broken links
npm run build 2>&1 | grep -i "broken"

# Validate deployment
curl -I https://docs.pepay.io
```

## Future Enhancements

### Planned Features
- **Search Functionality** - Full-text search integration
- **Analytics Dashboard** - Usage insights
- **Multi-language Support** - Internationalization
- **API Documentation** - Interactive API explorer
- **Version Control** - Documentation versioning

### Technical Improvements
- **Performance Optimization** - Further speed improvements
- **Accessibility** - Enhanced screen reader support
- **Security** - Additional security headers
- **Monitoring** - Advanced error tracking

## Contributing

### Content Contributions
1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally
5. Submit a pull request

### Code Contributions
1. Follow TypeScript best practices
2. Maintain consistent styling
3. Add appropriate documentation
4. Test thoroughly
5. Update relevant documentation

## Support

For questions or issues related to this documentation project:
- **Technical Issues**: Check the troubleshooting section
- **Content Updates**: Follow the content management guide
- **Deployment Help**: Reference the deployment guide
- **General Questions**: Contact the development team

---

*This documentation project was built with ❤️ using Docusaurus and modern web technologies to provide the best possible experience for Pepay users and developers.*