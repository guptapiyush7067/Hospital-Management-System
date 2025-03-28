
-- Create Database
CREATE DATABASE IF NOT EXISTS hospital_db;
USE hospital_db;

-- Create Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    dob DATE,
    gender ENUM('Male', 'Female', 'Other'),
    phone_number VARCHAR(15),
    address TEXT
);

-- Create Doctors Table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    specialty VARCHAR(100),
    phone_number VARCHAR(15)
);

-- Create Appointments Table
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATETIME,
    status ENUM('Scheduled', 'Completed', 'Cancelled'),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

-- Create Treatments Table
CREATE TABLE treatments (
    treatment_id INT PRIMARY KEY AUTO_INCREMENT,
    appointment_id INT,
    treatment_description TEXT,
    medication_prescribed TEXT,
    treatment_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES appointments(appointment_id)
);

-- Insert Sample Data into Patients
INSERT INTO patients (first_name, last_name, dob, gender, phone_number, address)
VALUES 
('John', 'Doe', '1990-05-10', 'Male', '1234567890', '123 Main St'),
('Jane', 'Smith', '1985-08-20', 'Female', '9876543210', '456 Oak Ave');

-- Insert Sample Data into Doctors
INSERT INTO doctors (first_name, last_name, specialty, phone_number)
VALUES 
('Dr. Mark', 'Johnson', 'Cardiology', '1112223333'),
('Dr. Sarah', 'Williams', 'Pediatrics', '4445556666');

-- Insert Sample Data into Appointments
INSERT INTO appointments (patient_id, doctor_id, appointment_date, status)
VALUES 
(1, 1, '2025-04-01 10:00:00', 'Scheduled'),
(2, 2, '2025-04-02 11:30:00', 'Scheduled');

-- Insert Sample Data into Treatments
INSERT INTO treatments (appointment_id, treatment_description, medication_prescribed, treatment_date)
VALUES 
(1, 'Cardiac checkup and ECG', 'Aspirin', '2025-04-01'),
(2, 'Vaccination and health check', 'Multivitamins', '2025-04-02');
