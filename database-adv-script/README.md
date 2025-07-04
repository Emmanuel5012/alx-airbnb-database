# SQL Joins Practice

This repository demonstrates different SQL join operations with practical examples.

## Queries

1. **INNER JOIN** - Get bookings with user details  
   ```sql
   SELECT b.*, u.* FROM bookings b
   INNER JOIN users u ON b.user_id = u.user_id;
   ```

2. **LEFT JOIN** - Get all properties with reviews (including properties without reviews)  
   ```sql
   SELECT p.*, r.* FROM properties p
   LEFT JOIN reviews r ON p.property_id = r.property_id;
   ```

3. **FULL OUTER JOIN** - Get all users and all bookings (including unmatched records)  
   ```sql
   SELECT u.*, b.* FROM users u
   FULL OUTER JOIN bookings b ON u.user_id = b.user_id;
   ```

## Purpose
- Understand different SQL join types
- See practical examples of each join operation
- Learn when to use each join type

Simply run these queries against your database to see the results.
```
