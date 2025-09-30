# OpenChoreo Installation Documentation

Interactive installation guide for OpenChoreo platform with multiple deployment options.

## Features

- 🌓 Dark/Light mode support
- 📑 Clean tab navigation (Cilium-style)
- 📋 Copy-paste ready commands
- 🚀 5 installation methods:
  - Quick Start (Local with Docker/kind)
  - Development (Existing K8s cluster)
  - Production (Single cluster HA)
  - Multi-Cluster (Enterprise)
  - Air-gapped (Disconnected environments)

## Local Development

```bash
# Install dependencies
npm install

# Run locally
npm start

# Visit http://localhost:8080
```

## Deployment

This site is designed to be deployed on Choreo as a static web application.

### Choreo Deployment Steps

1. Login to Choreo CLI
```bash
choreo login
```

2. Create a project
```bash
choreo project create --name "OpenChoreo Docs"
```

3. Create web app component
```bash
choreo component create \
  --name "installation-guide" \
  --type "web-app" \
  --repo-url "https://github.com/YOUR_USERNAME/YOUR_REPO.git" \
  --branch "main"
```

4. Deploy
```bash
choreo component deploy --name "installation-guide" --env "dev"
```

## Technology Stack

- HTML5 with embedded CSS/JavaScript
- Express.js for serving static files
- Vanilla JavaScript (no framework dependencies)
- Responsive design with mobile support

## License

Apache 2.0