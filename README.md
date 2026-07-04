# Digital Customer Onboarding Analytics Dashboard

## Project Overview

Retail banks lose a lot of potential customers during digital account opening, and I wanted to understand why. This project digs into the onboarding process step by step to find where people actually drop off, and what that means for the business.

I built the backend in MySQL, wrote SQL queries to pull out the key metrics, and then brought everything together in a Power BI dashboard.

---

## Business Problem

A lot of customers never make it through account opening. Some fail at OTP verification, others get stuck uploading documents, some hit OCR errors, and a few just get held up in compliance checks for too long.

My goal here was to figure out which of these stages causes the most drop-off, and to come up with practical recommendations to fix it.

---

## Dashboard Preview

![Digital Customer Onboarding Dashboard](dashboard.png)

---

## Documentation

I also put together a few BA-style documents for this project — mainly so I could practice the full requirements-to-testing workflow, not just the dashboard part:

- [Business Requirements Document (BRD)](BRD.md)
- [UAT Test Cases](UAT_Test_Cases.md)
- [UAT Verification Queries](UAT_Verification_Queries.pdf) — the actual SQL I ran to check these test cases against the real data

---

## Tools Used

- MySQL
- SQL
- Power BI
- DAX

---

## Database Design

I normalized the data into four related tables:

- Customers
- Applications
- Application Journey
- Verifications

---

## Dashboard KPIs

- Total applications
- Completed applications
- Completion rate
- Average processing time

---

## Key Insights

A few things stood out once I dug into the data:

- Verification stages (OCR + compliance) account for a disproportionate share of processing delays compared to the earlier stages.
- Drop-off isn't evenly spread — certain regions and account types show noticeably different completion rates.
- Having final-status and stage-level data together made it possible to actually pinpoint *where* in the funnel people were abandoning, not just that they were.
- Interactive filters in the dashboard let you slice this by region and channel, which is useful if this were handed to an ops team to actually monitor.

---

## Recommendations

Based on what the data showed, here's what I'd suggest to reduce drop-off:

- Improve OTP delivery reliability — this is one of the earliest and most avoidable drop-off points.
- Invest in better OCR to cut down on manual verification.
- Make document upload instructions clearer up front, so fewer applications fail on quality issues.
- Automate the more repetitive verification checks to shorten processing time.
- Keep onboarding KPIs visible on a live dashboard so ops can catch drop-off spikes early, not after the fact.
---

## Business Recommendations

- Improve OTP delivery reliability.
- Reduce manual verification using better OCR.
- Simplify document upload instructions.
- Automate repetitive verification checks.
- Monitor onboarding KPIs through interactive dashboards.
