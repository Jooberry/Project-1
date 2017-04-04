DROP TABLE IF EXISTS plushies;
DROP TABLE IF EXISTS brands;

CREATE TABLE brands (
  id SERIAL4 PRIMARY KEY,
  brand_name VARCHAR(255),
  picture VARCHAR(255),
  description TEXT
);

CREATE TABLE plushies (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  brand_id INT4 REFERENCES brands(id) ON DELETE CASCADE,
  quantity INT4,
  buy_price FLOAT,
  picture VARCHAR(255)
);