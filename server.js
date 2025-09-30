const express = require('express');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 8080;

// Serve static files
app.use(express.static('.'));

// Main route
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'installation.html'));
});

// Direct route to installation page
app.get('/installation', (req, res) => {
  res.sendFile(path.join(__dirname, 'installation.html'));
});

// Health check endpoint for Choreo
app.get('/health', (req, res) => {
  res.status(200).json({ status: 'healthy' });
});

app.listen(PORT, () => {
  console.log(`OpenChoreo Documentation Server running on port ${PORT}`);
  console.log(`Visit http://localhost:${PORT} to view the installation guide`);
});