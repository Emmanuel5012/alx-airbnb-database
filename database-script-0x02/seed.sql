-- Sample Users
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
  ('1', 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '08012345678', 'guest', CURRENT_TIMESTAMP),
  ('2, 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '08023456789', 'host', CURRENT_TIMESTAMP),
  ('3', 'Eve', 'Doe', 'eve@example.com', 'hashed_pw_3', '08034567890', 'admin', CURRENT_TIMESTAMP);

-- Sample Properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
  ('1', '2', 'Cozy Cabin', 'A warm, wooden cabin in the mountains.', 'Jos, Nigeria', 150.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
  ('2', '2', 'Beach House', 'A beach-side home with ocean view.', 'Lagos, Nigeria', 250.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Sample Bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
  ('1', '1', '1', '2025-07-01', '2025-07-05', 600.00, 'confirmed', CURRENT_TIMESTAMP),
  ('2', '2', '1', '2025-07-10', '2025-07-12', 500.00, 'pending', CURRENT_TIMESTAMP);

-- Sample Payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
  ('3', '2', 600.00, CURRENT_TIMESTAMP, 'credit_card');

-- Sample Reviews
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
  ('4', '1', '1', 5, 'Loved the cabin! Will return.', CURRENT_TIMESTAMP),
  ('4', '1', '1', 4, 'Nice beach view but too noisy at night.', CURRENT_TIMESTAMP);

-- Sample Messages
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
  ('5', '1', '2', 'Hi, is the cabin available for July?', CURRENT_TIMESTAMP),
  ('5', '2', '1', 'Yes, it's available. Let me know the dates.', CURRENT_TIMESTAMP);
