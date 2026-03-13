# 📚 GCM MCP Server - Example Prompts

## 🔐 Authentication & Setup

### Basic Authentication
```
/gcmmcp authenticate to GCM
/gcmmcp check authentication status
/gcmmcp logout from GCM
```

### Discovery
```
/gcmmcp discover available services
/gcmmcp show all endpoints for usermanagement service
/gcmmcp search for endpoints related to "certificate"
/gcmmcp get the complete API schema
```

---

## 👥 User Management

### User Operations
```
/gcmmcp list all users
/gcmmcp get details for user with ID {userId}
/gcmmcp create a new user with username "testuser"
/gcmmcp update user {userId} with new email
/gcmmcp delete user {userId}
/gcmmcp list user roles
/gcmmcp get system version information
```

---

## 🔑 Key & Certificate Management

### Certificate Operations
```
/gcmmcp list all certificates
/gcmmcp get certificate details for asset {assetId}
/gcmmcp list certificates expiring in the next 30 days
/gcmmcp show certificates with RSA keys smaller than 2048 bits
/gcmmcp list certificates using weak signature algorithms
/gcmmcp get certificate inventory with all columns
```

### Key Operations
```
/gcmmcp list all cryptographic keys
/gcmmcp get key details for asset {assetId}
/gcmmcp list symmetric keys
/gcmmcp list asymmetric keys
/gcmmcp show keys that are not quantum-safe
/gcmmcp list RSA keys with length less than 2048 bits
```

---

## 📊 Dashboards & Analytics

### Crypto Posture
```
/gcmmcp get crypto posture dashboard
/gcmmcp show cryptographic asset inventory
/gcmmcp get certificate statistics
/gcmmcp show key usage statistics
/gcmmcp analyze protocol usage across assets
```

### Compliance & Risk
```
/gcmmcp get compliance posture management dashboard
/gcmmcp show policy violations dashboard
/gcmmcp list all policy violations
/gcmmcp get compliance controls
/gcmmcp show NIST compliance status
/gcmmcp list high-severity violations
```

---

## 📋 Policy Management

### Policy Operations
```
/gcmmcp list all policies
/gcmmcp get policy details for {policyId}
/gcmmcp show active policies
/gcmmcp list policies by severity
/gcmmcp get PQC-related policies
/gcmmcp show policies with violations
/gcmmcp list OOTB (out-of-the-box) policies
```

### Policy Creation & Updates
```
/gcmmcp create a new policy for expired certificates
/gcmmcp update policy {policyId} with new threshold
/gcmmcp enable policy {policyId}
/gcmmcp disable policy {policyId}
/gcmmcp delete policy {policyId}
```

---

## 🚨 Violations & Tickets

### Violation Management
```
/gcmmcp list all violations
/gcmmcp get violations for entity {entityId}
/gcmmcp show violations by policy name
/gcmmcp list violations sorted by severity
/gcmmcp get violation details with ticket information
/gcmmcp show violations for expired certificates
```

### Ticket Operations
```
/gcmmcp create a ticket for violation {violationId}
/gcmmcp update ticket status to "resolved"
/gcmmcp list open tickets
/gcmmcp get ticket history for {ticketId}
```

---

## 🔍 Discovery & Scanning

### Asset Discovery
```
/gcmmcp discover assets in the environment
/gcmmcp scan for new certificates
/gcmmcp list discovered assets
/gcmmcp get discovery job status
/gcmmcp show asset discovery history
```

---

## 🗄️ TDE (Transparent Data Encryption)

### TDE Client Management
```
/gcmmcp get TDE client inventory
/gcmmcp list TDE clients
/gcmmcp get TDE client details for {clientId}
/gcmmcp show TDE key usage
/gcmmcp list TDE policies
```

---

## 🔔 Notifications & Integration

### Notification Management
```
/gcmmcp list notification configurations
/gcmmcp get notification settings
/gcmmcp create email notification for policy violations
/gcmmcp update notification preferences
```

### Integration
```
/gcmmcp list configured integrations
/gcmmcp get SIEM integration status
/gcmmcp configure webhook for alerts
```

---

## 📝 Audit & Logging

### Audit Operations
```
/gcmmcp get audit logs
/gcmmcp list audit events for user {userId}
/gcmmcp show audit trail for policy changes
/gcmmcp get compliance audit report
/gcmmcp list security events
```

---

## ⚙️ Configuration & System

### System Configuration
```
/gcmmcp get system configuration
/gcmmcp show all configuration settings
/gcmmcp update configuration parameter
/gcmmcp get system health status
/gcmmcp list system components
```

### CLM (Certificate Lifecycle Management)
```
/gcmmcp get CLM configuration
/gcmmcp list certificate lifecycle policies
/gcmmcp show certificate renewal settings
/gcmmcp get certificate expiration alerts
```

---

## 🎯 Advanced Queries

### Complex Analysis
```
/gcmmcp analyze post-quantum cryptography readiness
/gcmmcp identify all assets using deprecated protocols
/gcmmcp show compliance gaps by NIST control
/gcmmcp generate risk assessment report
/gcmmcp list all non-compliant assets with remediation steps
```

### Batch Operations
```
/gcmmcp get all certificates, keys, and protocols for domain example.com
/gcmmcp show complete security posture for business unit "Finance"
/gcmmcp generate comprehensive compliance report
/gcmmcp list all high-severity issues across all categories
```

---

## 🔬 Specific Use Cases

### Security Assessment
```
/gcmmcp identify expired certificates and their impact
/gcmmcp list all assets using SSL 2.0, SSL 3.0, or TLS 1.0
/gcmmcp show certificates with weak signature algorithms (MD5, SHA-1)
/gcmmcp find keys smaller than recommended size
/gcmmcp analyze cipher suite compliance
```

### Compliance Reporting
```
/gcmmcp generate NIST compliance report
/gcmmcp show PCI-DSS compliance status
/gcmmcp list all policy violations by severity
/gcmmcp get compliance score by control category
/gcmmcp show remediation timeline for all violations
```

### Operational Tasks
```
/gcmmcp list certificates expiring in next 7 days
/gcmmcp show recently created policies
/gcmmcp get violation trends over last 30 days
/gcmmcp list assets requiring immediate attention
/gcmmcp show certificate renewal queue
```

---

## 💡 Pro Tips

### Efficient Workflows
```
# Start with discovery
/gcmmcp discover available services

# Check authentication
/gcmmcp check authentication status

# Get overview
/gcmmcp get crypto posture dashboard

# Deep dive into issues
/gcmmcp list all violations
/gcmmcp get policy details for violated policies

# Generate reports
/gcmmcp get compliance posture management dashboard
```

### Filtering & Sorting
```
/gcmmcp list certificates with page size 50 sorted by expiration date
/gcmmcp get violations filtered by severity "HIGH"
/gcmmcp show policies where type is "CERTIFICATE_CERTIFICATE"
/gcmmcp list keys filtered by algorithm "RSA"
```

### Combining Operations
```
# Multi-step analysis
1. /gcmmcp get crypto posture dashboard
2. /gcmmcp list all violations
3. /gcmmcp get policy details for top violated policies
4. /gcmmcp generate remediation plan

# Compliance workflow
1. /gcmmcp get compliance controls
2. /gcmmcp show policy violations dashboard
3. /gcmmcp list violations by NIST control
4. /gcmmcp create tickets for high-severity violations
```

---

## 🚀 Quick Start Examples

### For Security Analysts
```
/gcmmcp get crypto posture dashboard
/gcmmcp list all violations
/gcmmcp show high-severity policy violations
/gcmmcp identify expired certificates
```

### For Compliance Officers
```
/gcmmcp get compliance posture management dashboard
/gcmmcp list all policies
/gcmmcp show NIST compliance controls
/gcmmcp generate compliance report
```

### For System Administrators
```
/gcmmcp list all certificates
/gcmmcp show certificates expiring soon
/gcmmcp get TDE client inventory
/gcmmcp list system configuration
```

### For Auditors
```
/gcmmcp get audit logs
/gcmmcp show policy compliance status
/gcmmcp list all violations with tickets
/gcmmcp generate comprehensive audit report
```

---

## 📖 API Pattern Examples

### Using Service/Operation Pattern
```
service: "usermanagement", operation: "users.list"
service: "assetinventory", operation: "assets.list_certificates"
service: "policyrisk", operation: "violations.dashboard"
service: "policy", operation: "policies.list"
service: "tde", operation: "clients.inventory"
```

### Using Raw Endpoints
```
method: "GET", endpoint: "/ibm/usermanagement/api/v1/users"
method: "POST", endpoint: "/ibm/gemassetinventory/api/v1/assets/list-certificates"
method: "GET", endpoint: "/ibm/gempolicyengine/api/v1/violations/dashboards/policy-violations"
```

---

## 🎓 Learning Path

### Beginner
1. Authenticate to GCM
2. Discover available services
3. List certificates and keys
4. View crypto posture dashboard

### Intermediate
5. List and analyze policy violations
6. Get compliance controls
7. Create and manage policies
8. Generate compliance reports

### Advanced
9. Perform complex security assessments
10. Automate compliance workflows
11. Integrate with external systems
12. Build custom dashboards and reports

---

**Note**: Replace `{userId}`, `{assetId}`, `{policyId}`, etc. with actual IDs from your GCM environment.