DROP TABLE bookings;
DROP TABLE lessons;
DROP TABLE members;

CREATE TABLE lessons(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  instructor VARCHAR(255)
);

CREATE TABLE members(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255),
  email VARCHAR(255)
);

CREATE TABLE bookings(
  id SERIAL8 PRIMARY KEY,
  lesson_id INT8 references lessons(id) ON DELETE CASCADE,
  member_id INT8 references members(id) ON DELETE CASCADE
);
