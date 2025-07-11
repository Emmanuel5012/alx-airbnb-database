SELECT *
FROM Property
WHERE property_id IN (
  SELECT property_id
  FROM Review
  GROUP BY property_id
  HAVING AVG(rating) > 4.0
);

SELECT *
FROM Users u
WHERE (
  SELECT COUNT(*)
  FROM Booking b
  WHERE b.user_id = u.user_id
) > 3;


