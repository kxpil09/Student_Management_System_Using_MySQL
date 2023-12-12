-- Create the schema and tables in the new database
DROP SCHEMA IF EXISTS school_records;
CREATE SCHEMA IF NOT EXISTS school_records;

-- Table for user authentication
DROP TABLE IF EXISTS school_records.user_authentication;
CREATE TABLE IF NOT EXISTS school_records.user_authentication (
    user_id VARCHAR(255) PRIMARY KEY,
    user_pass TEXT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    registration_date DATE,
    email_address VARCHAR(255)
);

-- Table for parent details
DROP TABLE IF EXISTS school_records.parent_info;
CREATE TABLE IF NOT EXISTS school_records.parent_info (
    guardian_id VARCHAR(255) PRIMARY KEY,
    father_first_name VARCHAR(255),
    father_last_name VARCHAR(255),
    father_email VARCHAR(255),
    father_phone VARCHAR(20),
    father_profession VARCHAR(255),
    mother_first VARCHAR(255),
    mother_last VARCHAR(255),
    mother_email VARCHAR(255),
    mother_phone VARCHAR(20),
    mother_profession VARCHAR(255)
);

-- Table for teaching staff
DROP TABLE IF EXISTS school_records.teaching_staff;
CREATE TABLE IF NOT EXISTS school_records.teaching_staff (
    instructor_id VARCHAR(255) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birth_date DATE,
    email_address VARCHAR(255),
    contact_number VARCHAR(20),
    registration_date DATE,
    registration_code VARCHAR(255) UNIQUE
);

-- Table for class details
DROP TABLE IF EXISTS school_records.class_info;
CREATE TABLE IF NOT EXISTS school_records.class_info (
    class_code VARCHAR(255) PRIMARY KEY,
    class_teacher_code VARCHAR(255) REFERENCES school_records.teaching_staff (instructor_code),
    academic_year VARCHAR(20)
);

-- Table for student details
DROP TABLE IF EXISTS school_records.student_info;
CREATE TABLE IF NOT EXISTS school_records.student_info (
    admin_id VARCHAR(255) PRIMARY KEY,
    first_given_name VARCHAR(255),
    last_given_name VARCHAR(255),
    birth_date DATE,
    class_code VARCHAR(255) REFERENCES school_records.class_info (class_code),
    roll_number VARCHAR(20),
    email_address VARCHAR(255),
    guardian_code VARCHAR(255) REFERENCES school_records.parent_info (guardian_code),
    registration_date DATE,
    registration_code VARCHAR(255) UNIQUE
);

-- Table for course subjects
DROP TABLE IF EXISTS school_records.course_subject;
CREATE TABLE IF NOT EXISTS school_records.course_subject (
    subject_code VARCHAR(255) PRIMARY KEY,
    subject_title VARCHAR(255),
    academic_year VARCHAR(20),
    subject_instructor VARCHAR(255) REFERENCES school_records.teaching_staff (instructor_code)
);

-- Table for subject mentors
DROP TABLE IF EXISTS school_records.subject_mentors;
CREATE TABLE IF NOT EXISTS school_records.subject_mentors (
    row_id SERIAL PRIMARY KEY,
    subject_code VARCHAR(255) REFERENCES school_records.course_subject (subject_code),
    instructor_code VARCHAR(255) REFERENCES school_records.teaching_staff (instructor_code),
    class_code VARCHAR(255) REFERENCES school_records.class_info (class_code)
);
-- Insert sample values into user_authentication table
INSERT INTO school_records.user_authentication (user_id, user_pass, first_name, last_name, registration_date, email_address)
VALUES
('user1', 'pass1', 'Rahul', 'Verma', '2023-01-01', 'rahul.verma@example.com'),
('user2', 'pass2', 'Pooja', 'Sharma', '2023-02-01', 'pooja.sharma@example.com'),
('user3', 'pass3', 'Amit', 'Patel', '2023-03-01', 'amit.patel@example.com'),
('user4', 'pass4', 'Anjali', 'Gupta', '2023-04-01', 'anjali.gupta@example.com'),
('user5', 'pass5', 'Raj', 'Singh', '2023-05-01', 'raj.singh@example.com');

-- Insert sample values into parent_info table
INSERT INTO school_records.parent_info (guardian_id, father_first_name, father_last_name, father_email, father_phone, father_profession, mother_first, mother_last, mother_email, mother_phone, mother_profession)
VALUES
('guardian1', 'Alok', 'Verma', 'alok.verma@example.com', '1234567890', 'Engineer', 'Sunita', 'Verma', 'sunita.verma@example.com', '9876543210', 'Doctor'),
('guardian2', 'Rajesh', 'Sharma', 'rajesh.sharma@example.com', '2345678901', 'Architect', 'Neha', 'Sharma', 'neha.sharma@example.com', '8765432109', 'Teacher'),
('guardian3', 'Kamlesh', 'Patel', 'kamlesh.patel@example.com', '3456789012', 'Scientist', 'Meera', 'Patel', 'meera.patel@example.com', '7654321098', 'Artist'),
('guardian4', 'Vinod', 'Gupta', 'vinod.gupta@example.com', '4567890123', 'Lawyer', 'Pooja', 'Gupta', 'pooja.gupta@example.com', '6543210987', 'Nurse'),
('guardian5', 'Amit', 'Singh', 'amit.singh@example.com', '5678901234', 'Entrepreneur', 'Priya', 'Singh', 'priya.singh@example.com', '5432109876', 'Chef');

-- Insert sample values into teaching_staff table
INSERT INTO school_records.teaching_staff (instructor_id, first_name, last_name, birth_date, email_address, contact_number, registration_date, registration_code)
VALUES
('instructor1', 'Meenakshi', 'Mishra', '1980-01-15', 'meenakshi.mishra@example.com', '123-456-7890', '2022-01-01', 'REG123'),
('instructor2', 'Rahul', 'Das', '1985-03-22', 'rahul.das@example.com', '234-567-8901', '2022-02-01', 'REG456'),
('instructor3', 'Sneha', 'Trivedi', '1978-07-10', 'sneha.trivedi@example.com', '345-678-9012', '2022-03-01', 'REG789'),
('instructor4', 'Rohit', 'Singh', '1982-05-18', 'rohit.singh@example.com', '456-789-0123', '2022-04-01', 'REGABC'),
('instructor5', 'Manisha', 'Yadav', '1975-11-30', 'manisha.yadav@example.com', '567-890-1234', '2022-05-01', 'REGDEF');

-- Insert sample values into class_info table
INSERT INTO school_records.class_info (class_code, class_teacher_code, academic_year)
VALUES
('class1', 'instructor1', '2023-2024'),
('class2', 'instructor2', '2023-2024'),
('class3', 'instructor3', '2023-2024'),
('class4', 'instructor4', '2023-2024'),
('class5', 'instructor5', '2023-2024');

-- Insert sample values into student_info table
INSERT INTO school_records.student_info (admin_id, first_given_name, last_given_name, birth_date, class_code, roll_number, email_address, guardian_code, registration_date, registration_code)
VALUES
('admin1', 'Suresh', 'Kumar', '2005-01-15', 'class1', '101', 'suresh.kumar@example.com', 'guardian1', '2023-01-01', 'REG001'),
('admin2', 'Priya', 'Verma', '2006-03-22', 'class2', '102', 'priya.verma@example.com', 'guardian2', '2023-02-01', 'REG002'),
('admin3', 'Vikas', 'Singh', '2007-07-10', 'class3', '103', 'vikas.singh@example.com', 'guardian3', '2023-03-01', 'REG003'),
('admin4', 'Neha', 'Gupta', '2008-05-18', 'class4', '104', 'neha.gupta@example.com', 'guardian4', '2023-04-01', 'REG004'),
('admin5', 'Arjun', 'Yadav', '2009-11-30', 'class5', '105', 'arjun.yadav@example.com', 'guardian5', '2023-05-01', 'REG005');

SELECT * FROM school_records.user_authentication;
SELECT * FROM school_records.parent_info;
SELECT * FROM school_records.teaching_staff;
SELECT * FROM school_records.class_info;
SELECT * FROM school_records.student_info;
