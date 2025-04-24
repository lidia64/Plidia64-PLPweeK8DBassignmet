-- Database: Clinic Management System

-- Create Patients Table
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary Key for Patient
    first_name VARCHAR(100) NOT NULL,           -- First name of the patient
    last_name VARCHAR(100) NOT NULL,            -- Last name of the patient
    date_of_birth DATE NOT NULL,                -- Patient's date of birth
    phone_number VARCHAR(15),                   -- Optional phone number
    email VARCHAR(100) UNIQUE                  -- Optional unique email
);

-- Create Doctors Table
CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary Key for Doctor
    first_name VARCHAR(100) NOT NULL,           -- First name of the doctor
    last_name VARCHAR(100) NOT NULL,            -- Last name of the doctor
    specialty VARCHAR(100),                     -- Specialty of the doctor
    email VARCHAR(100) UNIQUE                  -- Optional unique email
);

-- Create Appointments Table (Many-to-Many Relationship)
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,  -- Primary Key for Appointment
    patient_id INT,                                 -- Foreign Key to Patients
    doctor_id INT,                                  -- Foreign Key to Doctors
    appointment_date DATE NOT NULL,                 -- Date of the appointment
    appointment_time TIME NOT NULL,                 -- Time of the appointment
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id), -- Reference to Patients
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)   -- Reference to Doctors
);

-- Sample Data Insertion

-- Insert Sample Patients
INSERT INTO Patients (first_name, last_name, date_of_birth, phone_number, email)
VALUES
('John', 'Doe', '1990-06-15', '123-456-7890', 'john.doe@email.com'),
('Jane', 'Smith', '1985-04-10', '234-567-8901', 'jane.smith@email.com');

-- Insert Sample Doctors
INSERT INTO Doctors (first_name, last_name, specialty, email)
VALUES
('Dr. Sarah', 'Lee', 'Cardiology', 'dr.sarah.lee@email.com'),
('Dr. James', 'Brown', 'Dermatology', 'dr.james.brown@email.com');

-- Insert Sample Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time)
VALUES
(1, 1, '2025-04-30', '10:00:00'),
(2, 2, '2025-04-25', '14:00:00');
