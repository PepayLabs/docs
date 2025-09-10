@echo off
REM Pepay Documentation Deployment Script (Windows Batch)
REM Simple alternative to PowerShell script

setlocal enabledelayedexpansion

REM Configuration
set PROJECT_ID=%1
set BUCKET_NAME=docs-pepay-io
set PRODUCTION=%2

REM Colors (limited in cmd)
set RED=[31m
set GREEN=[32m
set YELLOW=[33m
set BLUE=[34m
set RESET=[0m

if "%PROJECT_ID%"=="" (
    echo %RED%Error: Project ID is required%RESET%
    echo Usage: deploy.bat "your-project-id" [production]
    echo Example: deploy.bat "my-project-id" production
    exit /b 1
)

echo %BLUE%Pepay Documentation Deployment%RESET%
echo =============================
echo.

REM Check prerequisites
echo %BLUE%Checking prerequisites...%RESET%

REM Check gcloud
gcloud --version >nul 2>&1
if errorlevel 1 (
    echo %RED%Error: Google Cloud SDK not found%RESET%
    echo Please install it from: https://cloud.google.com/sdk/docs/install
    exit /b 1
)
echo %GREEN%✓ Google Cloud SDK found%RESET%

REM Check node
node --version >nul 2>&1
if errorlevel 1 (
    echo %RED%Error: Node.js not found%RESET%
    echo Please install Node.js from: https://nodejs.org/
    exit /b 1
)
echo %GREEN%✓ Node.js found%RESET%

REM Check npm
npm --version >nul 2>&1
if errorlevel 1 (
    echo %RED%Error: npm not found%RESET%
    exit /b 1
)
echo %GREEN%✓ npm found%RESET%

echo.

REM Set GCP project
echo %BLUE%Setting GCP project to: %PROJECT_ID%%RESET%
gcloud config set project %PROJECT_ID%
if errorlevel 1 (
    echo %RED%Error: Failed to set project%RESET%
    exit /b 1
)
echo %GREEN%✓ Project set successfully%RESET%

REM Install dependencies
echo %BLUE%Installing dependencies...%RESET%
call npm install
if errorlevel 1 (
    echo %RED%Error: Failed to install dependencies%RESET%
    exit /b 1
)
echo %GREEN%✓ Dependencies installed%RESET%

REM Build site
echo %BLUE%Building Docusaurus site...%RESET%
if "%PRODUCTION%"=="production" (
    set NODE_ENV=production
    echo %YELLOW%Building for production...%RESET%
)
call npm run build
if errorlevel 1 (
    echo %RED%Error: Build failed%RESET%
    exit /b 1
)
echo %GREEN%✓ Site built successfully%RESET%

REM Deploy to GCS
echo %BLUE%Deploying to GCS bucket: %BUCKET_NAME%%RESET%
gsutil -m rsync -r -d ./build gs://%BUCKET_NAME%
if errorlevel 1 (
    echo %RED%Error: Deployment failed%RESET%
    exit /b 1
)

REM Set cache control headers
echo %BLUE%Setting cache control headers...%RESET%
gsutil -m setmeta -h "Cache-Control:public,max-age=31536000" gs://%BUCKET_NAME%/static/**
gsutil -m setmeta -h "Cache-Control:public,max-age=3600" gs://%BUCKET_NAME%/*.html
gsutil -m setmeta -h "Cache-Control:public,max-age=3600" gs://%BUCKET_NAME%/**/*.html

REM Configure website
echo %BLUE%Configuring bucket for static website hosting...%RESET%
gsutil web set -m index.html -e 404.html gs://%BUCKET_NAME%

REM Make public if production
if "%PRODUCTION%"=="production" (
    echo %BLUE%Making bucket publicly readable...%RESET%
    gsutil iam ch allUsers:objectViewer gs://%BUCKET_NAME%
)

echo.
echo %GREEN%🎉 Deployment completed successfully!%RESET%
echo.
echo %BLUE%Your documentation is now available at:%RESET%
echo %YELLOW%https://storage.googleapis.com/%BUCKET_NAME%/index.html%RESET%

if "%PRODUCTION%"=="production" (
    echo %GREEN%Production URL: https://docs.pepay.io%RESET%
)

echo.
echo %BLUE%Next steps:%RESET%
echo 1. Configure your domain (docs.pepay.io) to point to the bucket
echo 2. Set up SSL certificate if needed
echo 3. Configure CDN for better performance

endlocal