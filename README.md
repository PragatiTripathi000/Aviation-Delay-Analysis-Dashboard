# ✈️ Aviation Traffic and Delay Analysis Dashboard (2018–2025)

An end-to-end interactive Power BI business intelligence solution analyzing nationwide commercial flight operations from January 2018 through December 2025. The dashboard tracks operational volume, diagnoses multi-category delay drivers, examines seasonal weather disruption patterns, and benchmarks carrier performance across the United States.

---

## 🔗 Project Access & Live Files

- **Live Dashboard (.pbix):** [Download from OneDrive]
-https://onedrive.live.com/?id=%2Fpersonal%2F8944170cb8d0c6e3%2FDocuments%2FAVIATIONDASHB%2Epbix&listurl=%2Fpersonal%2F8944170cb8d0c6e3%2FDocuments&migratedtospo=true&parent=%2Fpersonal%2F8944170cb8d0c6e3%2FDocuments&redeem=aHR0cHM6Ly8xZHJ2Lm1zL3UvYy84OTQ0MTcwY2I4ZDBjNmUzL0lRRHNCRzl2d2R2YlJwWFYzaGFyZGRoWUFTVEIzbnlWYjBQVVF3emRvX21kYXZv&ga=1
- **Timeframe Covered:** January 2018 – December 2025[cite: 1]
- **Data Scope:** 56,850,634 arrival flights | 10,653,335 delayed flights | 1,205,206 cancellations[cite: 1]

---

## 📌 Executive Summary & Key Findings

- **Delay Frequency:** 18.74% of all arrival flights recorded delays of 15 minutes or more[cite: 1].
- **Primary Root Causes:** Reactionary late aircraft turnaround delays (289.48M minutes) and carrier operations (254.45M minutes) together account for more than 70% of total delay time[cite: 1].
- **Weather Seasonality:** Convective summer disruptions peak significantly in July and August, resulting in higher aggregate delay minutes than winter snow events[cite: 1].
- **Carrier Footprint:** Southwest Airlines handled the largest overall volume (10.3M arrivals) but also registered the highest cancellation counts (~234K) and carrier delay accumulations due to operating scale[cite: 1].

---

## 📊 Dashboard Views

The interactive dashboard is organized into three distinct pages connected through synchronized slicers, dynamic cross-filtering, and reset navigation[cite: 1]:

### 1. Global Aviation Delay Analytics
Macro-level overview displaying executive KPI cards (57M total flights, 18.7% delay rate, 1M cancellations), multi-line yearly trajectory trends, delay causes share, and an airport distribution map[cite: 1].

### 2. Comprehensive Weather Impact on Operations
Environmental analysis tracking weather delay growth (rising from 5.33M minutes in 2018 to 8.04M minutes by 2025), summer monthly spikes, an average severity gauge (235.24 mins), and impacted airport hubs (DFW, ORD, ATL, DEN, CLT)[cite: 1].

### 3. Carrier Performance & Scorecard
Direct carrier benchmarking view featuring a detailed scorecard matrix, cancellation rankings, a carrier delay count treemap, and a 100% stacked bar chart breaking down delay cause mix across individual airlines[cite: 1].

---

## 🛠️ Tech Stack & Methodology

- **Business Intelligence:** Microsoft Power BI Desktop[cite: 1, 2]
- **ETL & Data Cleaning:** Power Query (M Language) for data type casting, delimiter splitting, and custom column derivation[cite: 1]
- **Dynamic Analytics:** DAX (Data Analysis Expressions) for real-time KPI aggregations, ratios, and category shares
- **Data Source:** Bureau of Transportation Statistics (BTS) / Federal Aviation Administration (FAA)

---
