# Pepay Documentation Deployment Script
# Deploys Docusaurus site to GCP Cloud Storage for docs.pepay.io

param(
    [string]$ProjectId = "",
    [string]$BucketName = "docs-pepay-io",
    [switch]$Production = $false,
    [switch]$SkipBuild = $false,
    [switch]$Help = $false
)

# Configuration
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"

# Colors for output
$RED = "Red"
$GREEN = "Green"
$YELLOW = "Yellow"
$BLUE = "Blue"

function Write-ColorOutput {
    param([string]$Message, [string]$Color = "White")
    Write-Host $Message -ForegroundColor $Color
}

function Show-Help {
    Write-ColorOutput "Pepay Documentation Deployment Script" $BLUE
    Write-ColorOutput "=====================================" $BLUE
    Write-ColorOutput ""
    Write-ColorOutput "Usage: .\deploy.ps1 [OPTIONS]" $GREEN
    Write-ColorOutput ""
    Write-ColorOutput "Options:"
    Write-ColorOutput "  -ProjectId    GCP Project ID (required)"
    Write-ColorOutput "  -BucketName   GCS bucket name (default: docs-pepay-io)"
    Write-ColorOutput "  -Production   Deploy to production (enables additional optimizations)"
    Write-ColorOutput "  -SkipBuild    Skip the build step (use existing build/)"
    Write-ColorOutput "  -Help         Show this help message"
    Write-ColorOutput ""
    Write-ColorOutput "Examples:"
    Write-ColorOutput "  .\deploy.ps1 -ProjectId 'my-project-id'"
    Write-ColorOutput "  .\deploy.ps1 -ProjectId 'my-project-id' -Production"
    Write-ColorOutput "  .\deploy.ps1 -ProjectId 'my-project-id' -SkipBuild"
    Write-ColorOutput ""
    Write-ColorOutput "Prerequisites:"
    Write-ColorOutput "  - Google Cloud SDK installed and authenticated"
    Write-ColorOutput "  - Node.js and npm installed"
    Write-ColorOutput "  - GCS bucket created and configured for static website hosting"
    Write-ColorOutput ""
}

function Test-Prerequisites {
    Write-ColorOutput "Checking prerequisites..." $BLUE
    
    # Check if gcloud is installed
    try {
        $gcloudVersion = gcloud --version 2>$null
        if ($gcloudVersion) {
            Write-ColorOutput "✓ Google Cloud SDK found" $GREEN
        }
    } catch {
        Write-ColorOutput "✗ Google Cloud SDK not found. Please install it first." $RED
        Write-ColorOutput "  Download from: https://cloud.google.com/sdk/docs/install" $YELLOW
        exit 1
    }
    
    # Check if authenticated with gcloud
    try {
        $account = gcloud auth list --filter="status:ACTIVE" --format="value(account)" 2>$null
        if ($account) {
            Write-ColorOutput "✓ Google Cloud authenticated as: $account" $GREEN
        } else {
            Write-ColorOutput "✗ Not authenticated with Google Cloud" $RED
            Write-ColorOutput "  Run: gcloud auth login" $YELLOW
            exit 1
        }
    } catch {
        Write-ColorOutput "✗ Unable to check Google Cloud authentication" $RED
        exit 1
    }
    
    # Check if Node.js is installed
    try {
        $nodeVersion = node --version 2>$null
        if ($nodeVersion) {
            Write-ColorOutput "✓ Node.js found: $nodeVersion" $GREEN
        }
    } catch {
        Write-ColorOutput "✗ Node.js not found. Please install Node.js first." $RED
        exit 1
    }
    
    # Check if npm is installed
    try {
        $npmVersion = npm --version 2>$null
        if ($npmVersion) {
            Write-ColorOutput "✓ npm found: $npmVersion" $GREEN
        }
    } catch {
        Write-ColorOutput "✗ npm not found. Please install npm first." $RED
        exit 1
    }
    
    Write-ColorOutput "All prerequisites met!" $GREEN
    Write-ColorOutput ""
}

function Set-GCPProject {
    param([string]$ProjectId)
    
    Write-ColorOutput "Setting GCP project to: $ProjectId" $BLUE
    try {
        gcloud config set project $ProjectId
        Write-ColorOutput "✓ Project set successfully" $GREEN
    } catch {
        Write-ColorOutput "✗ Failed to set project. Please check the project ID." $RED
        exit 1
    }
}

function Install-Dependencies {
    Write-ColorOutput "Installing dependencies..." $BLUE
    try {
        npm install
        Write-ColorOutput "✓ Dependencies installed successfully" $GREEN
    } catch {
        Write-ColorOutput "✗ Failed to install dependencies" $RED
        exit 1
    }
}

function Build-Site {
    Write-ColorOutput "Building Docusaurus site..." $BLUE
    try {
        if ($Production) {
            $env:NODE_ENV = "production"
            Write-ColorOutput "Building for production..." $YELLOW
        }
        
        npm run build
        Write-ColorOutput "✓ Site built successfully" $GREEN
    } catch {
        Write-ColorOutput "✗ Build failed" $RED
        exit 1
    }
}

function Deploy-ToGCS {
    param([string]$BucketName)
    
    Write-ColorOutput "Deploying to GCS bucket: $BucketName" $BLUE
    
    # Check if bucket exists
    try {
        $bucketExists = gsutil ls -b gs://$BucketName 2>$null
        if (-not $bucketExists) {
            Write-ColorOutput "✗ Bucket gs://$BucketName does not exist" $RED
            Write-ColorOutput "  Create it with: gsutil mb gs://$BucketName" $YELLOW
            exit 1
        }
    } catch {
        Write-ColorOutput "✗ Unable to check bucket existence" $RED
        exit 1
    }
    
    # Sync files to bucket
    try {
        Write-ColorOutput "Syncing files to bucket..." $YELLOW
        gsutil -m rsync -r -d ./build gs://$BucketName
        
        # Set cache control headers for static assets
        Write-ColorOutput "Setting cache control headers..." $YELLOW
        gsutil -m setmeta -h "Cache-Control:public,max-age=31536000" gs://$BucketName/static/**
        gsutil -m setmeta -h "Cache-Control:public,max-age=3600" gs://$BucketName/*.html
        gsutil -m setmeta -h "Cache-Control:public,max-age=3600" gs://$BucketName/**/*.html
        
        Write-ColorOutput "✓ Deployment completed successfully" $GREEN
    } catch {
        Write-ColorOutput "✗ Deployment failed" $RED
        exit 1
    }
}

function Set-BucketWebsite {
    param([string]$BucketName)
    
    Write-ColorOutput "Configuring bucket for static website hosting..." $BLUE
    try {
        gsutil web set -m index.html -e 404.html gs://$BucketName
        Write-ColorOutput "✓ Website configuration set" $GREEN
    } catch {
        Write-ColorOutput "⚠ Warning: Could not set website configuration" $YELLOW
    }
}

function Make-BucketPublic {
    param([string]$BucketName)
    
    Write-ColorOutput "Making bucket publicly readable..." $BLUE
    try {
        gsutil iam ch allUsers:objectViewer gs://$BucketName
        Write-ColorOutput "✓ Bucket made publicly readable" $GREEN
    } catch {
        Write-ColorOutput "⚠ Warning: Could not make bucket public" $YELLOW
    }
}

function Main {
    # Show help if requested
    if ($Help) {
        Show-Help
        return
    }
    
    # Validate required parameters
    if (-not $ProjectId) {
        Write-ColorOutput "Error: ProjectId is required" $RED
        Write-ColorOutput "Use -Help for usage information" $YELLOW
        exit 1
    }
    
    Write-ColorOutput "Pepay Documentation Deployment" $BLUE
    Write-ColorOutput "=============================" $BLUE
    Write-ColorOutput ""
    
    # Check prerequisites
    Test-Prerequisites
    
    # Set GCP project
    Set-GCPProject -ProjectId $ProjectId
    
    # Install dependencies
    Install-Dependencies
    
    # Build site (unless skipped)
    if (-not $SkipBuild) {
        Build-Site
    } else {
        Write-ColorOutput "Skipping build step..." $YELLOW
        if (-not (Test-Path "./build")) {
            Write-ColorOutput "✗ Build directory not found. Cannot skip build." $RED
            exit 1
        }
    }
    
    # Deploy to GCS
    Deploy-ToGCS -BucketName $BucketName
    
    # Configure bucket for website hosting
    Set-BucketWebsite -BucketName $BucketName
    
    # Make bucket public (if production)
    if ($Production) {
        Make-BucketPublic -BucketName $BucketName
    }
    
    Write-ColorOutput ""
    Write-ColorOutput "🎉 Deployment completed successfully!" $GREEN
    Write-ColorOutput ""
    Write-ColorOutput "Your documentation is now available at:" $BLUE
    Write-ColorOutput "https://storage.googleapis.com/$BucketName/index.html" $YELLOW
    
    if ($Production) {
        Write-ColorOutput "Production URL: https://docs.pepay.io" $GREEN
    }
    
    Write-ColorOutput ""
    Write-ColorOutput "Next steps:" $BLUE
    Write-ColorOutput "1. Configure your domain (docs.pepay.io) to point to the bucket"
    Write-ColorOutput "2. Set up SSL certificate if needed"
    Write-ColorOutput "3. Configure CDN for better performance"
}

# Run the main function
Main