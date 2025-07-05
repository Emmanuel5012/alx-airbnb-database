
SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,

  u.user_id,
  u.first_name,
  u.last_name,
  u.email,

  p.property_id,
  p.name AS property_name,

  pay.payment_id,
  pay.amount,
  pay.payment_method,
  pay.payment_date

FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;


-- ✅ WHERE comes before ORDER BY
WHERE b.start_date >= CURRENT_DATE - INTERVAL '6 months'
  AND b.total_price > 0

ORDER BY b.start_date DESC;


EXPLAIN ANALYZE
SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,

  u.user_id,
  u.first_name,
  u.last_name,
  u.email,

  p.property_id,
  p.name AS property_name,

  pay.payment_id,
  pay.amount,
  pay.payment_method,
  pay.payment_date

FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id;
