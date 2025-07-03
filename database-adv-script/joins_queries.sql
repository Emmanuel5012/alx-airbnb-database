SELECT Booking.booking_id,
Booking.start_date,
Booking.end_date,
Booking.total_price,
Users.first_name,
Users.last_name,
Users.email
FROM Booking
INNER JOIN Users ON Booking.user_id = Users.user_id;

SELECT 
  Property.property_id,
  Property.name,
  Property.description,
  Review.review_id,
  Review.rating,
  Review.comment
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id;


SELECT 
  Users.user_id,
  Users.first_name,
  Booking.booking_id,
  Booking.start_date,
  Booking.total_price
FROM Users
FULL OUTER JOIN Booking ON Users.user_id = Booking.user_id;
