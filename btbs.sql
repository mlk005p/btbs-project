-- create database
CREATE DATABASE BTBS;
USE BTBS;

-- bus
CREATE TABLE Bus (
    Bus_No VARCHAR(10) PRIMARY KEY,
    Category VARCHAR(20),
    Vendor_Name VARCHAR(50),
    Total_Capacity INT
);

-- staff
CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Role VARCHAR(30),
    Phone VARCHAR(15),
    Assigned_Bus_No VARCHAR(10),
    FOREIGN KEY (Assigned_Bus_No) REFERENCES Bus(Bus_No)
);

-- passenger
CREATE TABLE Passenger (
    Passenger_ID INT PRIMARY KEY,
    Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50)
);

-- route schedule
CREATE TABLE Route_Schedule (
    Trip_ID INT PRIMARY KEY,
    Bus_No VARCHAR(10),
    Trip_Date DATE,
    Source VARCHAR(50),
    Destination VARCHAR(50),
    Fare DECIMAL(10,2),
    FOREIGN KEY (Bus_No) REFERENCES Bus(Bus_No)
);

-- booking
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY,
    Passenger_ID INT,
    Trip_ID INT,
    Seat_No INT,
    Booking_Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (Passenger_ID) REFERENCES Passenger(Passenger_ID),
    FOREIGN KEY (Trip_ID) REFERENCES Route_Schedule(Trip_ID)
);

-- insert bus data
INSERT INTO Bus VALUES
('BUS101','AC','City Travels',40),
('BUS102','Non-AC','Urban Rider',45),
('BUS103','Sleeper','MetroLine',30);

-- insert staff data
INSERT INTO Staff VALUES
(1,'Ravi Kumar','Driver','9876543210','BUS101'),
(2,'Sonal Mehta','Conductor','9123456780','BUS102');

-- insert passenger data
INSERT INTO Passenger VALUES
(201,'Amit Sharma','amit@gmail.com','9856471230','Delhi'),
(202,'Priya Verma','priya@gmail.com','9945120033','Mumbai');

-- insert route data
INSERT INTO Route_Schedule VALUES
(301,'BUS101','2025-01-12','Delhi','Jaipur',550),
(302,'BUS102','2025-01-13','Mumbai','Pune',400);

-- insert booking data
INSERT INTO Booking VALUES
(401,201,301,12,'2025-01-05','Confirmed'),
(402,202,302,20,'2025-01-06','Pending');

-- queries
SELECT * FROM Bus;
SELECT * FROM Passenger WHERE City='Delhi';
SELECT * FROM Booking;