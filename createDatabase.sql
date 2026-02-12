
-- Create Department Table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Create Address Table
CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    street_address VARCHAR(255),
    city VARCHAR(100),
    state CHAR(2),
    postal_code VARCHAR(20)
);

-- Create Student Table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birthdate DATE,
    department_id INT REFERENCES Department(department_id),
    address_id INT REFERENCES Address(address_id)
);
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Create Address Table
CREATE TABLE Address (
    address_id INT PRIMARY KEY,
    street_address VARCHAR(255),
    city VARCHAR(100),
    state CHAR(2),
    postal_code VARCHAR(20)
);

-- Create Student Table
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birthdate DATE,
    department_id INT REFERENCES Department(department_id),
    address_id INT REFERENCES Address(address_id)
);
