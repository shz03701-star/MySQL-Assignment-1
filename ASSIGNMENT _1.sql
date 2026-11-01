-- (I) TABLE CREATION
CREATE DATABASE EMPLOYEE;

USE EMPLOYEE;

create table Department(
department_id int PRIMARY KEY ,
department_name varchar(100)
);

create table Location(
location_id int PRIMARY KEY,
location varchar(30)
);

create table Employees(
employee_id int PRIMARY KEY,
employee_name varchar(50),
gender enum('m','f'),
age int,
hire_date date,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2)
);

show tables;

describe department;
describe employees;
describe location;


-- (II) TABLE ALTERATION
-- 1. ADD NEW COLUMN
alter table employeeS add email varchar(100);

-- 2.MODIFY RANGE
alter table employees modify column designation varchar(250);

-- 3. DROP COLUMN
ALTER TABLE EMPLOYEES DROP AGE;

-- 4. RENAME COLUMN
ALTER TABLE EMPLOYEES RENAME COLUMN HIRE_DATE TO DATE_OF_JOINING;


-- (III) TABLE RENAMING
-- 1. 
RENAME TABLE DEPARTMENT TO DEPARTMENTS_INFO;
-- 2. 
RENAME TABLE LOCATION TO LOCATIONS;


-- (IV) TABLE TRUNCATING
TRUNCATE TABLE EMPLOYEES;


-- (V) DATABASE & TABLE DROPPING
DROP TABLE EMPLOYEES;
DROP DATABASE EMPLOYEE;


-- CONSTRAINTS

-- 1. DATABASE RECREATION

CREATE DATABASE EMPLOYEE;
USE EMPLOYEE;

create table Department(
department_id int PRIMARY KEY ,
department_name varchar(100)
);

create table Location(
location_id int PRIMARY KEY,
location varchar(30)
);

create table Employees(
employee_id int PRIMARY KEY,
employee_name varchar(50),
gender enum('m','f'),
age int,
hire_date date,
designation varchar(100),
department_id int,
location_id int,
salary decimal(10,2)
);

-- 2. DEPARTMENTS TABLE

ALTER TABLE DEPARTMENT MODIFY COLUMN DEPARTMENT_NAME varchar(100) NOT NULL UNIQUE;

-- 3. LOCATION TABLE

ALTER TABLE LOCATION MODIFY COLUMN LOCATION_ID int AUTO_INCREMENT;
ALTER TABLE LOCATION MODIFY COLUMN LOCATION varchar(30) NOT NULL UNIQUE;

-- 4. EMPLOYEES TABLE

ALTER TABLE EMPLOYEES MODIFY COLUMN EMPLOYEE_ID int AUTO_INCREMENT;
ALTER TABLE EMPLOYEES MODIFY COLUMN EMPLOYEE_NAME varchar(50) NOT NULL;
ALTER TABLE EMPLOYEES MODIFY COLUMN age int CHECK(AGE>=18);
ALTER TABLE EMPLOYEES MODIFY COLUMN hire_date date DEFAULT ('Current_date');
ALTER TABLE EMPLOYEES 
ADD FOREIGN KEY (DEPARTMENT_ID)
        REFERENCES DEPARTMENT(DEPARTMENT_ID),
ADD FOREIGN KEY (LOCATION_ID)
        REFERENCES LOCATION(LOCATION_ID)
;