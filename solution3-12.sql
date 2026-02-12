-- Solution number 3
select count(*) as Total_Student from student;

-- Solution number 4
with JohnCTE (department_id) as (
 SELECT department_id from Student where student_id = 1
)
SELECT department_name from Department
where department_id = (SELECT department_id from JohnCTE);

-- Solution number 5
with StudentCTE (Student_Count, Department_id) as (
	SELECT COUNT(*), department_id
	FROM STUDENT GROUP BY department_id
)
SELECT d.department_name, COALESCE(s.student_count,0) as student_count
from Department d
LEFT JOIN StudentCTE s ON
	d.department_id = s.department_id

-- SOLUTION NUMBER 6
WITH StudentCTE (first_name, last_name, department_id, address) as (
	SELECT first_name, last_name, department_id, CONCAT(a.street_address, a.state, a.city, a.postal_code)
	FROM Student s LEFT JOIN Address a
		ON s.address_id = a.address_id
)
SELECT s.first_name, s.last_name, s.address, d.department_name
FROM StudentCTE s 
LEFT JOIN Department d ON
	s.department_id = d.department_id

-- SOLUTION NUMBER 7
SELECT * FROM STUDENT 
WHERE department_id = 1;

-- SOLUTION NUMBER 8
UPDATE Address
SET city = 'New York'
WHERE address_id = (
    SELECT address_id
    FROM student
    WHERE first_name = 'Jane'
);

-- SOLUTION NUMBER 09
DELETE FROM Student
WHERE first_name = 'Jane'

-- SOLUTION NUMBER 11
SELECT COUNT(*) as number_of_students, d.department_name
FROM Student s
JOIN Department d
	ON s.department_id = d.department_id
GROUP BY department_name

-- SOLUTION NUMBER 12
SELECT s.first_name, s.last_name, a.city 
FROM Student s
JOIN Address a
 ON s.address_id = a.address_id
WHERE city = 'Springfield'
