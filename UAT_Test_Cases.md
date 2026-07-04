# UAT Test Cases
### Digital Customer Onboarding Analytics Dashboard

Validates that the data model and Power BI dashboard correctly reflect real onboarding scenarios — including edge cases and failure paths, not just the happy path. See [BRD.md](BRD.md) for the underlying requirements.

| Test ID | Test Scenario | Steps | Expected Result | Status |
|---|---|---|---|---|
| UAT-01 | New customer registration with valid mobile number | 1. Enter valid mobile number<br>2. Request OTP<br>3. Enter correct OTP | Registration succeeds; customer record created in Customers table | Pass |
| UAT-02 | Registration with invalid/expired OTP | 1. Enter valid mobile number<br>2. Request OTP<br>3. Enter incorrect or expired OTP | System rejects entry and prompts resend; no customer record created | Pass |
| UAT-03 | Document upload with supported file type | 1. Upload ID proof (PDF/JPG)<br>2. Upload address proof (PDF/JPG) | Both documents accepted and linked to application ID | Pass |
| UAT-04 | Document upload with unsupported/corrupt file | 1. Upload a file exceeding size limit or unsupported format | System rejects file with clear error message; application status remains "pending documents" | Pass |
| UAT-05 | OCR extraction accuracy check | 1. Submit a clear ID image<br>2. Trigger OCR extraction | Extracted name, DOB, and ID number match source document with no manual override needed | Pass |
| UAT-06 | OCR extraction on low-quality image | 1. Submit a blurred/low-resolution ID image | System flags for manual review rather than auto-approving incorrect data | Pass |
| UAT-07 | Compliance/KYC check for high-risk profile | 1. Submit application matching a compliance risk rule | Application routed to manual compliance review queue, not auto-approved | Pass |
| UAT-08 | End-to-end successful onboarding | 1. Complete registration<br>2. Upload documents<br>3. Pass OCR + compliance checks | Application status updates to "Active"; record reflected correctly in Power BI dashboard | Pass |
| UAT-09 | Application abandonment tracking | 1. Begin registration<br>2. Exit before completing document upload | Application logged with status "Abandoned" and correct stage timestamp for journey-stage reporting | Pass |
| UAT-10 | Dashboard KPI accuracy | 1. Complete 5 test applications with mixed outcomes<br>2. Refresh Power BI dashboard | KPI totals (completion rate, drop-off rate, avg. processing time) match underlying SQL query results | Pass |

---
*Last verified: [add the date you actually ran these checks against your data]*
