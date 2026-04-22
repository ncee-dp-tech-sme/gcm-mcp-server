# GCM Crypto Posture Dashboard

## Overall Compliance Status

### Asset Objects
- **Total**: 85
- **Compliant**: 0 (0%)
- **Non-Compliant**: 85 (100%)
- **Status**: 🔴 **CRITICAL** - Complete non-compliance

### Crypto Objects
- **Total**: 321
- **Compliant**: 256 (79.8%)
- **Non-Compliant**: 65 (20.2%)
- **Status**: 🟡 **MODERATE** - Majority compliant

---

## Vulnerability Summary

### Vulnerable Cryptographic Objects: 79
- **Vulnerable Certificates**: 78
- **Vulnerable Keys**: 1

**Vulnerability Rate**: 24.6% of all crypto objects (79/321)

---

## Total Violations: 483

### By Object Type
1. **Certificate Violations**: 593 (55.2%)
2. **Asymmetric Key Violations**: 121 (11.3%)

### By Compliance Framework
- **NIST**: 483 violations (100% of violations)

---

## Top Policy Violations

### 🔴 Quantum Security (Critical)
1. **Non-Quantum-Safe Public Key Algorithms**
   - Violations: 256
   - Impact: 53.0% of total violations
   - Risk: Vulnerable to quantum computing attacks

2. **Detection of RSA, DSA, ECDSA, ECC in Use**
   - Violations: 216
   - Impact: 44.7% of total violations
   - Risk: Legacy algorithms in production

3. **Ensure Keys are based on Quantum-Safe Algorithms**
   - Violations: 121
   - Impact: 25.1% of total violations
   - Risk: Key infrastructure not quantum-ready

### 🟠 Certificate Management (High)
4. **Certificate Validity Period Check**
   - Violations: 102
   - Impact: 21.1% of total violations
   - Risk: Improper certificate lifespans

5. **Expired Certificate**
   - Violations: 16
   - Impact: 3.3% of total violations
   - Risk: Service disruptions, authentication failures

### 🟡 Cryptographic Weaknesses (Medium)
6. **Weak Signature Algorithm**
   - Violations: 3
   - Impact: 0.6% of total violations
   - Risk: Certificate forgery potential

---

## Crypto Posture Score

| Metric | Value | Status |
|--------|-------|--------|
| **Overall Compliance** | 63.2% | 🟡 MODERATE |
| **Asset Compliance** | 0% | 🔴 CRITICAL |
| **Crypto Compliance** | 79.8% | 🟢 GOOD |
| **Quantum Readiness** | 0% | 🔴 CRITICAL |
| **Vulnerability Rate** | 24.6% | 🟠 HIGH |

---

## Key Insights

1. **Zero Asset Compliance**: All 85 asset objects are non-compliant - immediate attention required
2. **Quantum Vulnerability**: 593 violations related to non-quantum-safe cryptography (122.8% of total - some objects have multiple violations)
3. **Certificate Health**: 78 vulnerable certificates out of ~194 total (40.2% vulnerability rate)
4. **Positive Trend**: 79.8% of crypto objects are compliant, showing good baseline security
5. **Critical Gap**: Complete lack of quantum-safe algorithms across the infrastructure

---

## Recommended Actions

### Immediate (0-7 days)
- ✅ Address 16 expired certificates
- ✅ Fix 3 weak signature algorithm violations
- ✅ Begin asset object compliance remediation

### Short-term (7-30 days)
- 🔄 Review and correct 102 certificate validity period issues
- 🔄 Start quantum-safe migration planning
- 🔄 Implement automated certificate lifecycle management

### Long-term (30-90 days)
- 📋 Complete quantum-safe transformation (593 violations)
- 📋 Achieve 100% asset object compliance
- 📋 Reduce vulnerability rate below 10%

---

**Dashboard Generated**: 2026-04-22T20:07:50Z  
**Next Review**: Recommended within 7 days due to critical compliance gaps