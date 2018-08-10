DROP TABLE bookings;
DROP TABLE gym_classes;
DROP TABLE members;

CREATE TABLE members (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255),
  memership_type VARCHAR(255)
);

CREATE TABLE gym_classes (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  instructor VARCHAR(255),
  capacity INT,
  class_time TIME,
  class_date DATE,
  duration INT
);

CREATE TABLE bookings (
  id SERIAL4 PRIMARY KEY,
  member_id INT REFERENCES members(id) ON DELETE CASCADE,
  gym_class_id INT REFERENCES gym_classes(id) ON DELETE CASCADE
);
