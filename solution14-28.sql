-- solution 14
SELECT d.department_name, a.street_address, a.city, a.State, a.postal_code
FROM student s
JOIN department d ON s.department_id = d.department_id
JOIN address a ON s.address_id = a.address_id
WHERE s.first_name = 'John';

-- solution 15
SELECT *
FROM student
WHERE birthdate BETWEEN '1995-01-01' AND '1998-12-31';

-- solution 16
SELECT s.first_name, s.last_name, d.department_name
FROM student s
JOIN department d ON s.department_id = d.department_id
ORDER BY d.department_name;

-- solution 17
SELECT d.department_name, COUNT(s.student_id) AS student_count
FROM student s
JOIN department d ON s.department_id = d.department_id
JOIN address a ON s.address_id = a.address_id
WHERE a.city = 'Champaign'
GROUP BY d.department_name;

-- solution 18
SELECT s.first_name, s.last_name
FROM student s
JOIN address a ON s.address_id = a.address_id
WHERE a.street_address LIKE '%Pine%';

-- solution 19
UPDATE student
SET department_id = (
    SELECT department_id 
    FROM department 
    WHERE department_name = 'Mechanical Engineering'
)
WHERE student_id = 6;

-- solution 20
SELECT s.*
FROM student s
JOIN address a ON s.address_id = a.address_id
JOIN department d ON s.department_id = d.department_id
WHERE a.city = 'Chicago' AND d.department_name = 'Mathematics';

-- solution 21
SELECT s.*
FROM student s
JOIN address a ON s.address_id = a.address_id
WHERE a.city IN ('Urbana', 'Peoria');

-- solution 22
SELECT *
FROM student
WHERE student_id = (SELECT MAX(student_id) FROM student);

-- solution 23
SELECT s.*
FROM student s
JOIN department d ON s.department_id = d.department_id
WHERE d.department_name != 'Computer Science';

-- solution 24
SELECT COUNT(address_id) AS total_addresses
FROM address
WHERE city = 'Champaign';

-- solution 25
SELECT s.first_name, s.last_name
FROM student s
JOIN address a ON s.address_id = a.address_id
WHERE a.street_address = '520 Pine Rd';

-- solution 26
SELECT AVG(EXTRACT(YEAR FROM CURRENT_DATE) - EXTRACT(YEAR FROM s.birthdate)) AS average_age
FROM student s
JOIN department d ON s.department_id = d.department_id
WHERE d.department_name = 'Electrical Engineering';

-- solution 27
SELECT s.first_name, s.last_name, d.department_name, a.city
FROM student s
JOIN department d ON s.department_id = d.department_id
JOIN address a ON s.address_id = a.address_id
WHERE d.department_name LIKE 'M%';

-- solution 28
DELETE FROM student
WHERE student_id = (
    SELECT MIN(s.student_id)
    FROM student s
    JOIN department d ON s.department_id = d.department_id
    WHERE d.department_name = 'Mechanical Engineering'
);
