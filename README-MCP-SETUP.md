# GCM MCP Server Configuration Guide

This guide explains how to configure and connect to the GCM MCP Server.

## Server Modes

The GCM MCP Server supports two transport modes:

### 1. SSE (Server-Sent Events) Mode - Recommended for Remote Access
- Runs as an HTTP server with SSE transport
- Requires API key authentication
- Default port: 8002
- Suitable for remote connections and multiple clients

### 2. Stdio Mode - For Local Development
- Runs via standard input/output
- No authentication required
- Suitable for local development and testing

## Configuration Files

### For SSE Mode (Remote/Production)

Use the provided `mcp-config.json`:

```json
{
  "mcpServers": {
    "gcm-mcp-server": {
      "url": "http://localhost:8002/sse",
      "transport": "sse",
      "headers": {
        "Authorization": "Bearer YOUR_API_KEY_HERE"
      }
    }
  }
}
```

**Steps to use:**

1. **Start the server in SSE mode:**
   ```bash
   python -m src.server --transport sse --host 0.0.0.0 --port 8002
   ```

2. **Generate an API key** (from localhost only):
   ```bash
   curl -X POST http://localhost:8002/admin/keys \
     -H "Content-Type: application/json" \
     -d '{"user": "your-username"}'
   ```
   
   This will return a response like:
   ```json
   {
     "key": "abc123def456...",
     "user": "your-username",
     "created": "2024-01-01T12:00:00Z",
     "key_prefix": "abc123de"
   }
   ```

3. **Update mcp-config.json** with your API key:
   Replace `YOUR_API_KEY_HERE` with the `key` value from step 2.

4. **Add to your MCP client configuration:**
   - For Claude Desktop: Add the config to `~/Library/Application Support/Claude/claude_desktop_config.json` (macOS)
   - For other MCP clients: Follow their specific configuration instructions

### For Stdio Mode (Local Development)

Add this to your MCP client configuration:

```json
{
  "mcpServers": {
    "gcm-mcp-server": {
      "command": "python",
      "args": ["-m", "src.server"],
      "cwd": "/path/to/gcm-mcp-server",
      "env": {
        "GCM_HOST": "your-gcm-host",
        "GCM_USERNAME": "your-username",
        "GCM_PASSWORD": "your-password",
        "GCM_CLIENT_SECRET": "your-client-secret"
      }
    }
  }
}
```

**Note:** Replace `/path/to/gcm-mcp-server` with the actual path to this project directory.

## Environment Variables

Before starting the server, ensure your `.env` file is configured with the required variables:

```bash
# Required
GCM_HOST=your-gcm-hostname
GCM_USERNAME=your-username
GCM_PASSWORD=your-password
GCM_CLIENT_SECRET=your-client-secret

# Optional (with defaults)
GCM_API_PORT=31443
GCM_KEYCLOAK_PORT=30443
GCM_CLIENT_ID=gcmclient
GCM_AUTH_MODE=auto
GCM_VERIFY_SSL=false
GCM_REQUEST_TIMEOUT=30
GCM_MCP_KEY_STORE_PATH=/data/keys.json
GCM_LOG_LEVEL=INFO
```

## API Key Management

### List all active keys:
```bash
curl http://localhost:8002/admin/keys
```

### Revoke a key:
```bash
curl -X DELETE http://localhost:8002/admin/keys/{key_prefix}
```

**Note:** Admin endpoints are only accessible from localhost for security.

## Health Check

Check if the server is running:

```bash
curl http://localhost:8002/health
```

Expected response:
```json
{
  "status": "ok",
  "server": "GCM MCP Server",
  "version": "1.0.0",
  "transport": "sse",
  "auth_required": true,
  "active_keys": 1,
  "services": ["usermanagement", "tde", "assetinventory", ...]
}
```

## Available Tools

The GCM MCP Server provides three main tools:

1. **gcm_auth** - Authentication and session management
2. **gcm_api** - Execute any GCM API operation
3. **gcm_discover** - Discover available services and endpoints

## Troubleshooting

### Connection Issues
- Verify the server is running: `curl http://localhost:8002/health`
- Check firewall settings if connecting remotely
- Ensure the API key is valid and properly formatted in the Authorization header

### Authentication Issues
- Verify environment variables are set correctly in `.env`
- Check GCM server connectivity: `curl -k https://{GCM_HOST}:{GCM_API_PORT}/health`
- Review server logs for authentication errors

### API Key Issues
- Ensure you're generating keys from localhost
- Verify the key hasn't been revoked: `curl http://localhost:8002/admin/keys`
- Check that the Authorization header format is correct: `Bearer {your-key}`

## Security Notes

- API keys are stored as SHA-256 hashes in the key store
- Admin endpoints (key generation/revocation) are restricted to localhost
- The `.env` file is git-ignored to prevent credential leakage
- Use `GCM_VERIFY_SSL=true` in production environments