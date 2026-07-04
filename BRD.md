# Business Requirements Document (BRD)
### Digital Customer Onboarding Analytics Dashboard

**Prepared by:** Prantik Pegu
**Version:** 1.0
**Status:** Approved for build

---

## 1. Business Objective

Retail banks lose a significant share of prospective customers during digital account opening. This project analyzes the end-to-end onboarding process to identify where and why applicants abandon the process, and to give operations and product stakeholders a data-backed basis for reducing that drop-off.

## 2. Business Problem Statement

Customers abandon online account opening due to OTP failures, document upload issues, OCR extraction errors, verification delays, and compliance checks. The business does not currently have consolidated visibility into which stage causes the most drop-off, how long each stage takes, or how these vary by region.

## 3. Scope

**In scope:**
- Design of a relational data model covering customers, applications, journey stages, and verification outcomes
- SQL-based analysis of application volume, completion rates, and processing times
- A Power BI dashboard presenting KPIs, application status, journey-stage drop-off, and region-wise performance
- Business recommendations to reduce abandonment and verification delay

**Out of scope:**
- Live integration with a production banking system (data is a modeled/representative dataset)
- Changes to the actual OTP, OCR, or compliance engines themselves

## 4. Stakeholders

| Stakeholder | Interest |
|---|---|
| Operations lead | Owns onboarding process performance and staffing decisions |
| Product manager | Owns the customer-facing application flow |
| Compliance team | Owns KYC/verification rules |
| Analytics/BI consumer | Uses the dashboard for ongoing monitoring |

## 5. Functional Requirements

| ID | Requirement |
|---|---|
| FR-1 | The data model must capture every application's current stage and timestamp, so drop-off point and time-in-stage can be measured |
| FR-2 | The system must distinguish between completed, abandoned, and in-progress applications |
| FR-3 | The dashboard must report region-wise completion rate and average processing time |
| FR-4 | The dashboard must surface the top drop-off stage(s) so operations can prioritize fixes |
| FR-5 | KPI figures shown on the dashboard must be traceable back to the underlying SQL logic (no black-box numbers) |

## 6. Data Model Overview

The database is normalized into four related tables:
- **Customers** — demographic and registration details
- **Applications** — application ID, status, stage, region, timestamps
- **Application_journey** — stage-by-stage progression log per application
- **Verifications** — OTP, OCR, and compliance check outcomes per application

## 7. Process Flow Summary

The onboarding journey is modeled as five sequential stages, with abandonment possible at any point:

**Registration (OTP verification) → Document upload → OCR & verification → Compliance review → Account activation**

Each stage carries a distinct drop-off risk — OTP failure, upload errors, OCR errors, and processing delay respectively — which the SQL analysis and dashboard quantify by stage and by region.

## 8. Success Metrics

- Reduction in overall application abandonment rate
- Reduction in average time spent in the verification/compliance stage
- Dashboard adoption: operations team reviews KPIs on a recurring (e.g. weekly) basis

---
*See [UAT_Test_Cases.md](UAT_Test_Cases.md) for the validation test suite tied to this BRD.*
