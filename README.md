# Pepay Documentation Website

Modern, fast, and SEO-optimized documentation website for Pepay - The Payment Layer for Autonomous Agents.

## 🚀 Quick Start

### Prerequisites
- Node.js 16+ 
- npm 8+
- Git

### Development Setup
```bash
# Clone the repository
git clone <repository-url>

# Navigate to the Docusaurus site
cd docusaurus-site

# Install dependencies
npm install

# Start development server
npm start
```

Visit `http://localhost:3000` to see the site locally.

## 📖 About

This documentation website provides comprehensive guides, API references, and resources for developers and users of the Pepay protocol. Built with modern web technologies for optimal performance and user experience.

### Key Features
- **Modern Design** - Clean, Apple/Google-inspired interface
- **Fast Performance** - Static site generation with Docusaurus
- **SEO Optimized** - Comprehensive meta tags and structured data
- **Mobile-First** - Responsive design for all devices
- **PWA Support** - Offline functionality and app-like experience
- **Search Engine Ready** - XML sitemap and robots.txt included

## 🏗️ Project Structure

```
pepay-docs/
├── docusaurus-site/           # Main documentation site
│   ├── docs/                  # Documentation content
│   │   ├── getting-started/   # Getting started guides
│   │   ├── developers/        # Developer documentation
│   │   └── further-reading/   # Additional resources
│   ├── blog/                  # Blog posts (What's New)
│   ├── src/                   # React components and pages
│   ├── static/               # Static assets
│   └── deploy.ps1            # Deployment script
├── .gitbook/                 # Original GitBook assets
└── CLAUDE.md                 # Comprehensive project guide
```

## 📚 Documentation Sections

### Getting Started
- Key Features
- Use Cases
- Universal Payment Use Cases
- Business Use Cases
- Competitors
- Architecture & Technical Design
- Product Workflow

### Developers
- Pepay API
- Pepay SDK
- Pepay N8N Integration

### Further Reading
- External Articles and Resources

### What's New (Blog)
- Protocol Roadmap
- Milestones & Accomplishments
- Change Log

## 🛠️ Development

### Available Scripts
- `npm start` - Start development server
- `npm run build` - Build for production
- `npm run serve` - Serve built files locally
- `npm run clear` - Clear build cache

### Adding Content
1. Create markdown files in the appropriate `docs/` subdirectory
2. Add frontmatter with SEO metadata:
   ```yaml
   ---
   title: "Your Page Title"
   description: "SEO description"
   keywords: ["keyword1", "keyword2"]
   sidebar_position: 1
   ---
   ```
3. Update `sidebars.ts` if needed

### Customization
- **Styling**: `src/css/custom.css`
- **Components**: `src/components/`
- **Configuration**: `docusaurus.config.ts`
- **Navigation**: `sidebars.ts`

## 🚀 Deployment

### GCP Deployment (Recommended)
1. Install Google Cloud SDK
2. Authenticate: `gcloud auth login`
3. Run deployment script:
   ```powershell
   .\deploy.ps1 -ProjectId "your-project-id" -Production
   ```

### Manual Deployment
```bash
# Build the site
npm run build

# Deploy to your hosting platform
# (Copy contents of ./build directory)
```

## 🔧 Configuration

### Environment Variables
- `NODE_ENV` - Set to `production` for production builds
- `DOCUSAURUS_URL` - Site URL for production

### SEO Configuration
The site includes comprehensive SEO optimization:
- Meta tags for all pages
- Open Graph tags for social sharing
- Twitter Cards support
- Structured data (JSON-LD)
- XML sitemap generation
- Robots.txt configuration

## 📈 Performance

### Optimization Features
- Static site generation
- Code splitting and lazy loading
- Image optimization
- Service worker for caching
- PWA support
- CDN-ready assets

### Monitoring
- Google Analytics integration ready
- Search Console compatibility
- Lighthouse performance optimization

## 🤝 Contributing

### Content Updates
1. Fork the repository
2. Make your changes in the appropriate `docs/` directory
3. Test locally with `npm start`
4. Submit a pull request

### Code Contributions
1. Follow TypeScript best practices
2. Maintain consistent styling
3. Test thoroughly
4. Update documentation as needed

## 🔍 SEO Features

### Technical SEO
- Comprehensive meta tags
- Structured data implementation
- XML sitemap generation
- Robots.txt optimization
- Mobile-first responsive design
- Fast loading times

### Content SEO
- Keyword-optimized content
- Descriptive meta descriptions
- Proper heading hierarchy
- Internal linking structure
- Image alt tags

## 📱 PWA Features

The site includes Progressive Web App capabilities:
- Service worker for offline functionality
- Web app manifest
- Mobile app-like experience
- Push notification support (ready)
- Offline page caching

## 🌍 Deployment Options

### Google Cloud Platform
- **Primary**: Cloud Storage with CDN
- **Domain**: docs.pepay.io
- **SSL**: Automatic HTTPS
- **Performance**: Global CDN

### Alternative Platforms
- Netlify
- Vercel
- AWS S3 + CloudFront
- GitHub Pages

## 📊 Analytics & Monitoring

### Ready for Integration
- Google Analytics 4
- Google Search Console
- Hotjar or similar heatmap tools
- Error tracking (Sentry, etc.)

### Performance Monitoring
- Lighthouse audits
- Core Web Vitals tracking
- Page load time monitoring
- SEO performance tracking

## 🆘 Support

### Documentation
- [CLAUDE.md](./CLAUDE.md) - Comprehensive project guide
- [Docusaurus Documentation](https://docusaurus.io/docs)
- [React Documentation](https://reactjs.org/docs)

### Troubleshooting
- Check build logs for errors
- Verify all links and assets exist
- Ensure proper frontmatter format
- Test locally before deployment

## 🎯 Live Site

The documentation is deployed at: [https://docs.pepay.io](https://docs.pepay.io)

## 📄 License

This documentation project is maintained by the Pepay team. Content is subject to Pepay's terms of service.

---

**Built with ❤️ using [Docusaurus](https://docusaurus.io/) and modern web technologies.**