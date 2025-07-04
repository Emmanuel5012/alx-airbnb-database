# 🔗 SQL Joins Mastery

> A comprehensive guide to mastering SQL joins with practical examples and real-world scenarios.

## 📋 Table of Contents
- [🔗 SQL Joins Mastery](#-sql-joins-mastery)
  - [📋 Table of Contents](#-table-of-contents)
  - [🎯 Overview](#-overview)
  - [🗃️ Database Schema](#️-database-schema)

## 🎯 Overview

This repository contains SQL examples and exercises focused on mastering different types of joins. Perfect for developers looking to strengthen their database querying skills through hands-on practice.

**What you'll learn:**
- INNER JOIN fundamentals
- LEFT/RIGHT JOIN operations
- FULL OUTER JOIN concepts
- Real-world join scenarios
- Best practices and optimization tips

## 🗃️ Database Schema

Our examples use a **booking system** with four interconnected tables:

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│    Users    │    │  Properties │    │   Bookings  │    │   Reviews   │
├─────────────┤    ├─────────────┤    ├─────────────┤    ├─────────────┤
│ user_id     │◄──┐│ property_id │◄──┐│ booking_id  │    │ review_id   │
│ username    │   ││ name        │   ││ user_id     │──┐ │ property_id │
│ email       │   ││ location    │   ││ property_id │  └►│ user_id     │
│ created_at  │   ││ price       │   ││ check_in    │    │ rating      │
└─────────────┘   │└─────────────┘   ││ check_out   │    │ comment     │
                  │                  ││ total       │    └─────────────┘
                  └──────────────────┘│ status      │
                                     └─────────────┘
```

