-- USER TABLE
CREATE TABLE Users (
  user_id SERIAL PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  password_hash VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20),
  role VARCHAR(10) NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_user_email ON Users(email);

-- PROPERTY TABLE
CREATE TABLE Property (
  property_id SERIAL PRIMARY KEY,
  host_id SERIAL NOT NULL,
  name VARCHAR(100) NOT NULL,
  description TEXT NOT NULL,
  pricepernight DECIMAL(10, 2) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (host_id) REFERENCES Users(user_id)
);

CREATE INDEX idx_property_host ON Property(host_id);

-- BOOKING TABLE
CREATE TABLE Booking (
  booking_id SERIAL PRIMARY KEY,
  property_id SERIAL NOT NULL,
  user_id SERIAL NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL,
  total_price DECIMAL(10, 2) NOT NULL,
  status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2025-05-01' AND '2025-05-31';


CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_user ON Booking(user_id);

-- PAYMENT TABLE
CREATE TABLE Payment (
  payment_id SERIAL PRIMARY KEY,
  booking_id SERIAL NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method VARCHAR(20) NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
  FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE INDEX idx_payment_booking ON Payment(booking_id);

-- REVIEW TABLE
CREATE TABLE Review (
  review_id SERIAL PRIMARY KEY,
  property_id SERIAL NOT NULL,
  user_id SERIAL NOT NULL,
  rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (property_id) REFERENCES Property(property_id),
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- MESSAGE TABLE
CREATE TABLE Message (
  message_id SERIAL PRIMARY KEY,
  sender_id SERIAL NOT NULL,
  recipient_id SERIAL NOT NULL,
  message_body TEXT NOT NULL,
  sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (sender_id) REFERENCES Users(user_id),
  FOREIGN KEY (recipient_id) REFERENCES Users(user_id)
);
