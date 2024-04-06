CREATE TABLE Dentist (
    Dentist_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Contact_Phone_Number VARCHAR(20),
    Email VARCHAR(100),
    Specialization VARCHAR(100)
);

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Contact_Phone_Number VARCHAR(20),
    Email VARCHAR(100),
    Mailing_Address VARCHAR(255),
    Date_of_Birth DATE
);

CREATE TABLE Surgery (
    Surgery_ID INT PRIMARY KEY,
    Surgery_Name VARCHAR(100),
    Location_Address VARCHAR(255),
    Telephone_Number VARCHAR(20)
);

CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Appointment_Date DATE,
    Appointment_Time TIME,
    Dentist_ID INT,
    Patient_ID INT,
    Status VARCHAR(20),
    FOREIGN KEY (Dentist_ID) REFERENCES Dentist(Dentist_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);
