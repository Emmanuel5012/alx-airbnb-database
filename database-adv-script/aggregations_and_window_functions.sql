--total number of bookings made by each user, using the COUNT function and GROUP BY clause.
SELECT 
  u.user_id,
  u.first_name || ' ' || u.last_name AS full_name,
  COUNT(b.booking_id) AS total_bookings
FROM Users u
JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;


--Window function (RANK) to rank properties based on the total number of bookings they have received.
SELECT 
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings,
  RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;


--Window function (ROW_NUMBER) to rank properties based on the total number of bookings they have received.
SELECT 
  p.property_id,
  p.name,
  COUNT(b.booking_id) AS total_bookings,
  ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;
