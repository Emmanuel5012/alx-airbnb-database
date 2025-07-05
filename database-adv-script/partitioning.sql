-- partitioning.sql
CREATE TABLE Booking (
  booking_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  property_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date   DATE NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,

  status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (property_id) REFERENCES Property(property_id)

) PARTITION BY RANGE (start_date);


EXPLAIN ANALYZE
SELECT * FROM Booking
WHERE start_date BETWEEN '2025-05-01' AND '2025-05-31';
