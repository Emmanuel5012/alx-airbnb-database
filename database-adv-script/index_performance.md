# Database Indexing Optimization

This project demonstrates how to identify and create indexes to improve query performance.

## Key Tasks

1. **Identify High-Usage Columns**:
   - Columns frequently used in:
     - `WHERE` clauses
     - `JOIN` conditions
     - `ORDER BY` clauses
| 📂 Table   | 🔍 High-Usage Column | 🧠 Why Index It?                          |
| ---------- | -------------------- | ----------------------------------------- |
| `Users`    | `user_id`            | JOINs with Booking, Review, Message, etc. |
| `Booking`  | `user_id`            | JOIN with Users, filters, counts          |
| `Booking`  | `property_id`        | JOIN with Property, filters, groupings    |
| `Booking`  | `start_date`         | ORDER BY in dashboards                    |
| `Booking`  | `total_price`        | Sorting by value                          |
| `Property` | `property_id`        | JOIN with Review, Booking                 |
| `Property` | `host_id`            | JOIN with Users or filters                |
| `Review`   | `property_id`        | JOIN with Property, filters               |


2. **Create Indexes**:
   ```sql
   -- User table indexes
   CREATE INDEX idx_users_email ON users(email);
   CREATE INDEX idx_users_created_at ON users(created_at);
   
   -- Booking table indexes
   CREATE INDEX idx_bookings_user_id ON bookings(user_id);
   CREATE INDEX idx_bookings_check_in_date ON bookings(check_in_date);
   
   -- Property table indexes
   CREATE INDEX idx_properties_location ON properties(location);
   CREATE INDEX idx_properties_price ON properties(price);
   ```

3. **Performance Measurement**:
   - Use `EXPLAIN ANALYZE` before and after adding indexes:
   ```sql
   EXPLAIN ANALYZE SELECT * FROM users WHERE email = 'test@example.com';
   ```

## Expected Benefits
- Faster query execution
- Improved JOIN performance
- More efficient sorting operations
