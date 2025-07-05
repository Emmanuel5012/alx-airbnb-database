-- USERS TABLE
CREATE INDEX idx_users_user_id ON Users(user_id);

-- BOOKING TABLE
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_total_price ON Booking(total_price);

--EXPLAIN ANALYZE
SELECT *
FROM Booking
WHERE property_id = '1'
ORDER BY start_date DESC;



-- PROPERTY TABLE
CREATE INDEX idx_property_property_id ON Property(property_id);
CREATE INDEX idx_property_host_id ON Property(host_id);

-- REVIEW TABLE
CREATE INDEX idx_review_property_id ON Review(property_id);
