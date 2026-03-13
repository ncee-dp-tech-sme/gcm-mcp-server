# GCM MCP Server

IBM Guardium Cryptographic Manager (GCM) MCP Server - A Model Context Protocol server for interacting with IBM GCM's cryptographic asset management platform.
Based on [https://github.com/IBM/gcm-mcp-server](https://github.com/IBM/gcm-mcp-server)
## Overview

This MCP server provides tools to interact with IBM Guardium Cryptographic Manager, enabling:
- Authentication and session management
- Cryptographic asset inventory queries (keys, certificates, protocols)
- Policy violation tracking and ticket management
- Service discovery and API exploration

## Prerequisites

- **Podman** or Docker installed
- **Python 3.10+** (for local development)
- Access to an IBM GCM instance
- GCM credentials (username, password, client secret)

## Quick Start with Podman

### 1. Build the Podman Image

```bash
# Clone the repository
git clone <repository-url>
cd gcm-mcp-server

# Create .env file from example
cp env.example .env

# Edit .env with your GCM credentials
nano .env  # or use your preferred editor

# Build the image
podman build -t gcm-mcp-server:latest .
```

### 2. Run the Container

```bash
# Run with volume mount for persistent key storage
podman run -d \
  --name gcm-mcp-server \
  -p 8002:8002 \
  -v gcm-keys:/data \
  --env-file .env \
  gcm-mcp-server:latest

# Check if the server is running
podman logs gcm-mcp-server

# Verify health
curl http://localhost:8002/health
```

Expected health response:
```json
{
  "status": "ok",
  "server": "GCM MCP Server",
  "version": "1.0.0",
  "transport": "sse",
  "auth_required": true
}
```

### 3. Generate an API Key

The API key is required for Bob IDE to authenticate with the MCP server.

```bash
# Generate a new API key (must be run from within the running container or edit server.py on line 101 and add your machines ip)
curl -X POST http://localhost:8002/admin/keys \
  -H "Content-Type: application/json" \
  -d '{"user": "bob-ide-user"}'
```

Response:
```json
{
  "key": "gcm_1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcd",
  "user": "bob-ide-user",
  "created": "2026-03-13T17:00:00Z",
  "key_prefix": "gcm_1234"
}
```

**Important:** Save the `key` value - you'll need it for Bob IDE configuration.

### 4. Configure Bob IDE

#### Step 1: Locate Bob's MCP Configuration

Bob IDE stores MCP server configurations in:
- **macOS**: `~/.bob/mcp_settings.json`
- **Linux**: `~/.bob/mcp_settings.json`
- **Windows**: `%USERPROFILE%\.bob\mcp_settings.json`

#### Step 2: Add GCM MCP Server Configuration

Edit the configuration file and add the GCM MCP server:

```json
{
  "mcpServers": {
    "gcm-mcp-server": {
      "url": "http://localhost:8002/sse",
      "transport": "sse",
      "headers": {
        "Authorization": "Bearer gcm_1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcd"
      }
    }
  }
}
```

Replace the Bearer token with your actual API key from step 3.

#### Step 3: Restart Bob IDE

After adding the configuration, restart Bob IDE to load the new MCP server.

#### Step 4: Create a new "slash" command in Bob

add a new slash command name gcmapp via the chat window and add the following to the description
```
---
description: "this slash command will always use the gcm-mcp-server to execute commands"
---

When this slash command is executed, it will use the gcm-mcp-server to run the command and return the output.
```

#### Step 5: Verify Connection in Bob IDE

In Bob IDE, you should now be able to use the `/gcmmcp` command to interact with GCM:

```
/gcmmcp Get a summary of all cryptographic assets
/gcmmcp List open tickets
/gcmmcp Show authentication status
```

#### list of example prompts to use in Bob IDE
The following file contains an extensive list to be used in Bob IDE [GCM-MCP-EXAMPLE-PROMPTS.md](GCM-MCP-EXAMPLE-PROMPTS.md)

## Configuration

### Environment Variables

Create a `.env` file with the following variables:

```bash
# Required - GCM Server Connection
GCM_HOST=your-gcm-hostname.com
GCM_USERNAME=your_username
GCM_PASSWORD=your_password
GCM_CLIENT_SECRET=your_client_secret

# Optional - Ports (defaults shown)
GCM_API_PORT=31443
GCM_KEYCLOAK_PORT=30443

# Optional - Authentication
GCM_CLIENT_ID=gcmclient
GCM_AUTH_MODE=auto

# Optional - SSL & Timeouts
GCM_VERIFY_SSL=false
GCM_REQUEST_TIMEOUT=30

# Optional - MCP Server
GCM_MCP_KEY_STORE_PATH=/data/keys.json
GCM_LOG_LEVEL=INFO
```

### Key Store Persistence

The API keys are stored in `/data/keys.json` inside the container. To persist keys across container restarts, use a volume:

```bash
# Create a named volume
podman volume create gcm-keys

# Run with volume mount
podman run -d \
  --name gcm-mcp-server \
  -p 8002:8002 \
  -v gcm-keys:/data \
  --env-file .env \
  gcm-mcp-server:latest
```

## API Key Management

### List All Active Keys

```bash
curl http://localhost:8002/admin/keys
```

Response:
```json
{
  "keys": [
    {
      "key_prefix": "gcm_1234",
      "user": "bob-ide-user",
      "created": "2026-03-13T17:00:00Z"
    }
  ]
}
```

### Revoke a Key

```bash
curl -X DELETE http://localhost:8002/admin/keys/gcm_1234
```

**Note:** Admin endpoints are only accessible from localhost for security.

## Available MCP Tools

The GCM MCP Server provides three main tools:

### 1. `gcm_auth` - Authentication Management
Manage GCM authentication sessions.

**Actions:**
- `login` - Authenticate with GCM
- `logout` - End current session
- `status` - Check authentication status
- `refresh` - Refresh authentication token

### 2. `gcm_api` - API Operations
Execute any GCM API operation.

**Parameters:**
- `service` - Service name (e.g., "assetinventory", "tde", "clm")
- `operation` - Operation to perform (e.g., "assets.list_certificates")
- `method` - HTTP method (GET, POST, PUT, DELETE)
- `endpoint` - Direct API endpoint path
- `body` - Request body (for POST/PUT)
- `params` - Query parameters

### 3. `gcm_discover` - Service Discovery
Discover available GCM services and endpoints.

**Categories:**
- `services` - List all available services
- `endpoints` - List endpoints for a specific service

## Container Management

### View Logs

```bash
# Follow logs in real-time
podman logs -f gcm-mcp-server

# View last 100 lines
podman logs --tail 100 gcm-mcp-server
```

### Stop the Container

```bash
podman stop gcm-mcp-server
```

### Start the Container

```bash
podman start gcm-mcp-server
```

### Remove the Container

```bash
podman rm -f gcm-mcp-server
```

### Rebuild After Changes

```bash
# Stop and remove existing container
podman rm -f gcm-mcp-server

# Rebuild image
podman build -t gcm-mcp-server:latest .

# Run new container
podman run -d \
  --name gcm-mcp-server \
  -p 8002:8002 \
  -v gcm-keys:/data \
  --env-file .env \
  gcm-mcp-server:latest
```

## Local Development (Without Container)

### Install Dependencies

```bash
# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt
```

### Run Locally

```bash
# SSE mode (for Bob IDE)
python -m src.server --transport sse --host 0.0.0.0 --port 8002

# Stdio mode (for local testing)
python -m src.server
```

## Troubleshooting

### Container Won't Start

```bash
# Check container logs
podman logs gcm-mcp-server

# Verify .env file is present and correct
cat .env

# Test GCM connectivity
curl -k https://your-gcm-host:31443/health
```

### Bob IDE Can't Connect

1. **Verify server is running:**
   ```bash
   curl http://localhost:8002/health
   ```

2. **Check API key is valid:**
   ```bash
   curl http://localhost:8002/admin/keys
   ```

3. **Verify Bob IDE configuration:**
   - Check `~/.bob/mcp_settings.json` exists
   - Verify API key matches
   - Ensure URL is `http://localhost:8002/sse`

4. **Check firewall settings:**
   ```bash
   # On Linux/macOS
   sudo lsof -i :8002
   
   # On Windows
   netstat -ano | findstr :8002
   ```

### Authentication Failures

1. **Verify GCM credentials in .env:**
   ```bash
   podman exec gcm-mcp-server cat .env
   ```

2. **Test GCM authentication manually:**
   ```bash
   curl -X POST http://localhost:8002/admin/test-auth
   ```

3. **Check GCM server accessibility:**
   ```bash
   curl -k https://your-gcm-host:31443/health
   ```

### API Key Issues

- Keys are only accessible from localhost for security
- Use `curl` from the same machine running the container
- Keys are stored as SHA-256 hashes in `/data/keys.json`

## Security Considerations

- **API Keys**: Stored as SHA-256 hashes, never in plain text
- **Admin Endpoints**: Restricted to localhost only
- **SSL Verification**: Set `GCM_VERIFY_SSL=true` in production
- **Credentials**: Never commit `.env` file to version control
- **Network**: Consider using `--network host` for production deployments

## Support

For issues, questions, or contributions:
- Review the [detailed setup guide](README-MCP-SETUP.md)
- Check container logs: `podman logs gcm-mcp-server`
- Verify health endpoint: `curl http://localhost:8002/health`

## License

[Your License Here]

