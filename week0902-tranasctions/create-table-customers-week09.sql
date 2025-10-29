-- 1. Create the table
DROP TABLE customers;
CREATE TABLE customers (
    id     NUMBER PRIMARY KEY,
    name   VARCHAR2(50),
    email  VARCHAR2(100),
    city   VARCHAR2(50)
);

-- 2. Insert the data
INSERT INTO customers VALUES (1500001, 'Dave Jones', 'djones@yahoo.com', 'Smithers');
INSERT INTO customers VALUES (5500002, 'Rick Gee', 'rgee@yahoo.com', 'Calgary');
INSERT INTO customers VALUES (1500003, 'Dani Kirks', 'dkirks@hotmail.com', 'Prince George');
INSERT INTO customers VALUES (3100004, 'Ed Harris', 'eharris@letter.com', 'Vancouver');
INSERT INTO customers VALUES (1500005, 'Dave Jones', 'djones@yahoo.com', 'Smithers');
INSERT INTO customers VALUES (5500006, 'Rick Gee', 'rgee@yahoo.com', 'Calgary');
INSERT INTO customers VALUES (1500007, 'Dani Kirks', 'dkirks@hotmail.com', 'Prince George');
INSERT INTO customers VALUES (3100008, 'Ed Harris', 'eharris@letter.com', 'Vancouver');
INSERT INTO customers VALUES (1500009, 'Dave Jones', 'djones@yahoo.com', 'Smithers');
INSERT INTO customers VALUES (5500010, 'Rick Gee', 'rgee@yahoo.com', 'Calgary');
INSERT INTO customers VALUES (1500011, 'Dani Kirks', 'dkirks@hotmail.com', 'Prince George');

-- 3. Commit the changes
COMMIT;