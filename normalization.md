# AirBnB Database Normalization to 3NF

This document explains the normalization process applied to the original AirBnB schema to ensure it complies with **Third Normal Form (3NF)**.

---

## ✅ Step 1: First Normal Form (1NF)
1NF requires that:
- Each table has a primary key
- Atomic values (no repeating groups or arrays)

**✅ Already satisfied**: 
- Each table has a primary key.
- No multivalued or composite attributes.

---

## ✅ Step 2: Second Normal Form (2NF)
2NF requires:
- Being in 1NF
- No partial dependency (all non-key attributes must depend on the whole key)

**All tables use single-column primary keys**, so partial dependency does not apply.

**✅ Already satisfied.**

---

## ✅ Step 3: Third Normal Form (3NF)
3NF requires:
- Being in 2NF
- No transitive dependencies (non-key attributes must not depend on other non-key attributes)

### 🔍 Review of Potential Transitive Dependencies:

### 1. `Property`
- **Observation**: `host_id` links to `User`. No redundant data stored.
- ✅ No transitive dependencies

### 2. `Booking`
- All attributes depend on the primary key (`booking_id`)
- ✅ No transitive dependencies

### 3. `Payment`
- All fields depend directly on `payment_id`
- ✅ No transitive dependencies

### 4. `Review`
- All attributes depend directly on `review_id`
- ✅ No transitive dependencies

### 5. `Message`
- All fields depend directly on `message_id`
- ✅ No transitive dependencies

### 6. `User`
- No derived or redundant information
- ✅ No transitive dependencies

---

## 🔄 Optimization Suggestion (Optional 3NF Improvements)

### 🔁 ENUM Consideration:
Although `ENUM` fields (like `role`, `status`, and `payment_method`) are acceptable for simplicity, you may normalize them further by creating lookup tables:

#### `Roles` Table
| role_id | role_name  |
|---------|------------|
| 1       | guest      |
| 2       | host       |
| 3       | admin      |

#### `BookingStatus` Table
| status_id | status      |
|-----------|-------------|
| 1         | pending     |
| 2         | confirmed   |
| 3         | canceled    |

#### `PaymentMethod` Table
| method_id | method_name |
|-----------|-------------|
| 1         | credit_card |
| 2         | paypal      |
| 3         | stripe      |

This would:
- Make your schema more extensible
- Enforce data integrity
- Better support multi-language/localization systems

However, if ENUM suffices for your current application scale, you may keep them for simplicity.

---

## ✅ Final Verdict
The AirBnB schema **already complies with 3NF**. 
No redundant or derived fields, and all non-key fields depend only on their respective primary keys.

**You may optionally extract ENUMs into separate tables for better normalization and flexibility.**
