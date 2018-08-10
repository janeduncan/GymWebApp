DROP TABLE bookings;
DROP TABLE sessions
DROP TABLE gym_classes;
DROP TABLE members;
DROP TABLE instructors;
DROP TABLE studio;

CREATE TABLE studios (
  id SERIAL4 PRIMARY KEY,
  studio VARCHAR(255)
)

CREATE TABLE members (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  membership_type VARCHAR(255)
);

CREATE TABLE instructors (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
);

CREATE TABLE gym_classes (
  id SERIAL4 PRIMARY KEY,
  class_name VARCHAR(255),
  description VARCHAR(255)
);

CREATE TABLE sessions (
  id SERIAL4 PRIMARY KEY,
  gym_class_id INT REFERENCES gym_classes(id) ON DELETE CASCADE,
  instructor_id INT REFERENCES instructors(id) ON DELETE CASCADE,
  studio_id INT REFERENCES studios(id) ON DELETE CASCADE,
  available_spaces INT,
  class_time TIME,
  class_date DATE,
  duration INT
);

CREATE TABLE bookings (
  id SERIAL4 PRIMARY KEY,
  member_id INT REFERENCES members(id) ON DELETE CASCADE,
  session_id INT REFERENCES sessions(id) ON DELETE CASCADE
);
