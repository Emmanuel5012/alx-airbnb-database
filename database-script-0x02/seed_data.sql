-- Step 1: Reset the table
TRUNCATE TABLE Users RESTART IDENTITY CASCADE;

-- Step 2: Insert 20 random users
INSERT INTO Users (first_name, last_name, email, password_hash, phone_number, role, created_at)
SELECT 
  'User' || gs, 
  'Test' || gs,
  'user' || gs || '@example.com',
  md5(random()::text),
  '080' || floor(random()*100000000)::text,
  CASE 
    WHEN gs % 3 = 0 THEN 'admin' 
    WHEN gs % 3 = 1 THEN 'guest' 
    ELSE 'host' 
  END,
  NOW()
FROM generate_series(1, 20) AS gs;



INSERT INTO Property (host_id, name, description, pricepernight, created_at, updated_at)
SELECT 
  (gs % 5) + 1,
  'Property ' || gs,
  'Description for property ' || gs,
  round((random() * 500 + 50)::numeric, 2),
  NOW(),
  NOW()
FROM generate_series(1, 20) AS gs;


INSERT INTO Booking (user_id, property_id, start_date, end_date, total_price, status, created_at)
SELECT 
  (gs % 10) + 1,  -- Random user_id 1–10
  (gs % 10) + 1,  -- Random property_id 1–10
  CURRENT_DATE + (gs || ' days')::interval,
  CURRENT_DATE + (gs + 3 || ' days')::interval,
  round((random()*1000 + 200)::numeric, 2),
  CASE WHEN gs % 3 = 0 THEN 'pending'
       WHEN gs % 3 = 1 THEN 'confirmed'
       ELSE 'canceled' END,
  NOW()
FROM generate_series(1, 20) AS gs;

INSERT INTO Payment (booking_id, amount, payment_method, payment_date)
SELECT 
  gs,
  round((random()*1000 + 100)::numeric, 2),
  CASE WHEN gs % 3 = 0 THEN 'credit_card' 
       WHEN gs % 3 = 1 THEN 'paypal' 
       ELSE 'stripe' END,
  NOW()
FROM generate_series(1, 20) AS gs;


INSERT INTO Message (sender_id, recipient_id, message_body, sent_at)
SELECT 
  (gs % 10) + 1,
  ((gs + 1) % 10) + 1,
  'Hello, this is message ' || gs,
  NOW()
FROM generate_series(1, 20) AS gs;


SELECT * FROM message;