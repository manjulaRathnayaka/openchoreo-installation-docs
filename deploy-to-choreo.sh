#!/bin/bash

echo "🚀 OpenChoreo Documentation Deployment Script"
echo "============================================"
echo ""

# GitHub Repository Info
GITHUB_REPO="https://github.com/manjulaRathnayaka/openchoreo-installation-docs.git"
echo "✅ GitHub Repository: $GITHUB_REPO"
echo ""

# Step 1: Login to Choreo
echo "Step 1: Login to Choreo"
echo "------------------------"
echo "Please run: choreo login"
echo "Press Enter after logging in..."
read -r

# Step 2: List organizations to select
echo ""
echo "Step 2: Select your organization"
echo "---------------------------------"
choreo org list
echo ""
echo "Enter your organization ID:"
read -r ORG_ID

# Step 3: Create project
echo ""
echo "Step 3: Creating Choreo project..."
echo "-----------------------------------"
PROJECT_NAME="openchoreo-docs"
choreo project create \
  --name "$PROJECT_NAME" \
  --description "OpenChoreo Installation Documentation" \
  --organization "$ORG_ID"

echo "✅ Project created"

# Step 4: List projects to get the project ID
echo ""
echo "Step 4: Getting project details..."
echo "-----------------------------------"
choreo project list --organization "$ORG_ID"
echo ""
echo "Enter the Project ID for $PROJECT_NAME:"
read -r PROJECT_ID

# Step 5: Create web app component
echo ""
echo "Step 5: Creating web app component..."
echo "--------------------------------------"
COMPONENT_NAME="installation-guide"
choreo component create \
  --name "$COMPONENT_NAME" \
  --type "web-app" \
  --project-id "$PROJECT_ID" \
  --repository-url "$GITHUB_REPO" \
  --repository-branch "main" \
  --build-path "." \
  --build-command "npm install" \
  --run-command "npm start" \
  --port "8080"

echo "✅ Component created"

# Step 6: Deploy the component
echo ""
echo "Step 6: Deploying to Choreo..."
echo "-------------------------------"
choreo component deploy \
  --name "$COMPONENT_NAME" \
  --project-id "$PROJECT_ID" \
  --environment "dev"

echo ""
echo "🎉 Deployment complete!"
echo ""
echo "Your documentation site should be available at:"
echo "https://${COMPONENT_NAME}-${ORG_ID}.choreoapps.dev"
echo ""
echo "You can also check the status in the Choreo Console:"
echo "https://console.choreo.dev"