/*
Begin database design 
*/

CREATE TABLE  Dentist (
    Dentist_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Contact_Phone_Number VARCHAR(20),
    Email VARCHAR(100),
    Specialization VARCHAR(100)
);

CREATE TABLE  Patient (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Contact_Phone_Number VARCHAR(20),
    Email VARCHAR(100),
    Mailing_Address VARCHAR(255),
    Date_of_Birth DATE
);

CREATE TABLE  Surgery (
    Surgery_ID INT PRIMARY KEY,
    Surgery_Name VARCHAR(100),
    Location_Address VARCHAR(255),
    Telephone_Number VARCHAR(20)
);

CREATE TABLE  Appointment  (
    Appointment_ID INT PRIMARY KEY,
    Appointment_Date DATE,
    Appointment_Time TIME,
    Dentist_ID INT,
    Patient_ID INT,
    Surgery_ID INT,
    Status VARCHAR(20),
    FOREIGN KEY (Dentist_ID) REFERENCES Dentist(Dentist_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Surgery_ID) REFERENCES Surgery(Surgery_ID)
);


/*
End database design 
*/


/*
Populate Databse 
*/


INSERT INTO Dentist (Dentist_ID, First_Name, Last_Name, Contact_Phone_Number, Email, Specialization) VALUES
(1, 'John', 'Doe', '123-456-7890', 'john.doe@example.com', 'General Dentistry'),
(2, 'Jane', 'Smith', '987-654-3210', 'jane.smith@example.com', 'Orthodontics'),
(3, 'Alice', 'Johnson', '555-555-5555', 'alice.johnson@example.com', 'Pediatric Dentistry');

INSERT INTO Patient (Patient_ID, First_Name, Last_Name, Contact_Phone_Number, Email, Mailing_Address, Date_of_Birth) VALUES
(1, 'Michael', 'Brown', '111-222-3333', 'michael.brown@example.com', '123 Main St, City, State', '1980-05-15'),
(2, 'Emily', 'Davis', '444-555-6666', 'emily.davis@example.com', '456 Elm St, City, State', '1992-09-20'),
(3, 'David', 'Martinez', '777-888-9999', 'david.martinez@example.com', '789 Oak St, City, State', '1975-12-10');


INSERT INTO Surgery (Surgery_ID, Surgery_Name, Location_Address, Telephone_Number) VALUES
(1, 'City Dental Clinic', '789 Broadway Ave, City, State', '555-123-4567'),
(2, 'Oak Ridge Dental Care', '456 Oak St, City, State', '555-987-6543'),
(3, 'Elm Street Dental Center', '123 Elm St, City, State', '555-222-3333');

INSERT INTO Appointment (Appointment_ID, Appointment_Date, Appointment_Time, Dentist_ID, Patient_ID, Surgery_ID, Status) VALUES
(1, '2024-04-10', '10:00:00', 1, 1, 1, 'confirmed'),
(2, '2024-04-12', '11:30:00', 2, 2, 2, 'confirmed'),
(3, '2024-04-15', '14:00:00', 3, 3, 3, 'confirmed');



INSERT INTO Surgery (Surgery_ID, Surgery_Name, Location_Address, Telephone_Number) VALUES
(4, 'City Dental Clinic', '456 Oak St, City, State', '555-444-4567');


INSERT INTO Appointment (Appointment_ID, Appointment_Date, Appointment_Time, Dentist_ID, Patient_ID, Surgery_ID, Status) VALUES
(4, '2024-04-15', '14:00:00', 3, 2, 4, 'confirmed');



/*
End Populate Databse 
*/



/*
Begin queries/Questions
*/

/*
Display the list of ALL Dentists registered in the system, sorted in ascending
order of their lastNames 
*/

select * from Dentist order by Last_Name;

/*
 Display the list of ALL Appointments for a given Dentist by their dentist_Id
number. Include in the result, the Patient information.
*/

SELECT
    A.Appointment_ID,
    A.Appointment_Date,
    A.Appointment_Time,
    P.First_Name AS Patient_First_Name,
    P.Last_Name AS Patient_Last_Name,
    P.Contact_Phone_Number AS Patient_Phone_Number,
    P.Email AS Patient_Email
FROM
    Appointment A
JOIN
    Patient P ON A.Patient_ID = P.Patient_ID
WHERE
    A.Dentist_ID = <dentist_id>;


/*
Display the list of ALL Appointments that have been scheduled at a Surgery
Location
*/
select * from Appointment a join Surgery s on a.Surgery_ID = s.Surgery_ID where s.Location_Address like "456 Oak St, City, State";

/*
Display the list of the Appointments booked for a given Patient on a given Date. 
*/
select * from Appointment a join Patient p on a.Patient_ID=p.Patient_ID where a.Appointment_Date like '2024-04-10';

/*
Begin queries/Questions
*/






