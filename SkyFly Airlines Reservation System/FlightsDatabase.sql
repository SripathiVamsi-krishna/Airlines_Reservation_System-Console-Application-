/*drop table Flights;*/

CREATE TABLE Flights (
    FlightId INT AUTO_INCREMENT,
    DepartureCity VARCHAR(50) NOT NULL,
    DestinationCity VARCHAR(50) NOT NULL,
    DepartureDate DATE,
    DepartureTime TIME,
    ArrivalTime TIME,
    Airlines VARCHAR(50) NOT NULL,
    FlightNumber VARCHAR(20) NOT NULL,
    EconomyPrice DECIMAL(10, 2) NOT NULL,
    BusinessPrice DECIMAL(10, 2) NOT NULL,
    PremiumPrice DECIMAL(10, 2) NOT NULL,
    EconomyAvailableSeats INT NOT NULL,
    BusinessAvailableSeats INT NOT NULL,
    PremiumAvailableSeats INT NOT NULL,
    EconomyBookedSeats INT NOT NULL DEFAULT 0,
    BusinessBookedSeats INT NOT NULL DEFAULT 0,
    PremiumBookedSeats INT NOT NULL DEFAULT 0,
    PRIMARY KEY (FlightId),
    INDEX idx_flights_airlines (Airlines)
);
/*SET SQL_SAFE_UPDATES = 0;
/*-- Update Trip 1: Mumbai to Delhi
UPDATE Flights
SET DepartureDate = DATE_ADD(DepartureDate, INTERVAL 14 DAY)
WHERE DepartureCity = 'Mumbai' AND DestinationCity = 'Delhi';

DELETE from flights;
SET SQL_SAFE_UPDATES = 1;*/
select * from Flights;






-- Trip 1: Mumbai to Delhi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Mumbai', 'Delhi', '2023-08-03', '10:00:00', '12:00:00', 'IndiGo', '6E101', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Mumbai', 'Delhi', '2023-08-03', '14:00:00', '16:00:00', 'SpiceJet', 'SG102', 1800.00, 3200.00, 4800.00, 80, 10, 5),
    ('Mumbai', 'Delhi', '2023-08-03', '18:00:00', '20:00:00', 'Air India', 'AI103', 2200.00, 3800.00, 5500.00, 120, 25, 15),
    
    -- Repeat after 2 weeks
    ('Mumbai', 'Delhi', '2023-08-17', '10:00:00', '12:00:00', 'IndiGo', '6E101', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Mumbai', 'Delhi', '2023-08-17', '14:00:00', '16:00:00', 'SpiceJet', 'SG102', 1800.00, 3200.00, 4800.00, 80, 10, 5),
    ('Mumbai', 'Delhi', '2023-08-17', '18:00:00', '20:00:00', 'Air India', 'AI103', 2200.00, 3800.00, 5500.00, 120, 25, 15);



-- Trip 2: Delhi to London
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Delhi', 'London', '2023-08-04', '10:00:00', '14:00:00', 'British Airways', 'BA201', 25000.00, 45000.00, 65000.00, 150, 30, 15),
    ('Delhi', 'London', '2023-08-04', '14:00:00', '18:00:00', 'Air India', 'AI202', 23000.00, 42000.00, 60000.00, 130, 25, 12),
    ('Delhi', 'London', '2023-08-04', '18:00:00', '22:00:00', 'Emirates', 'EK303', 27000.00, 48000.00, 69000.00, 180, 35, 20),
    
    -- Repeat after 2 weeks
    ('Delhi', 'London', '2023-08-18', '10:00:00', '14:00:00', 'British Airways', 'BA201', 25000.00, 45000.00, 65000.00, 150, 30, 15),
    ('Delhi', 'London', '2023-08-18', '14:00:00', '18:00:00', 'Air India', 'AI202', 23000.00, 42000.00, 60000.00, 130, 25, 12),
    ('Delhi', 'London', '2023-08-18', '18:00:00', '22:00:00', 'Emirates', 'EK303', 27000.00, 48000.00, 69000.00, 180, 35, 20);



-- Trip 3: London to Dubai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('London', 'Dubai', '2023-08-05', '10:00:00', '16:00:00', 'Emirates', 'EK401', 15000.00, 28000.00, 42000.00, 200, 50, 20),
    ('London', 'Dubai', '2023-08-05', '14:00:00', '20:00:00', 'Qatar Airways', 'QR502', 17000.00, 31000.00, 46000.00, 180, 45, 15),
    ('London', 'Dubai', '2023-08-05', '18:00:00', '00:00:00', 'Etihad Airways', 'EY603', 19000.00, 34000.00, 50000.00, 220, 55, 25),
    
    -- Repeat after 2 weeks
    ('London', 'Dubai', '2023-08-19', '10:00:00', '16:00:00', 'Emirates', 'EK401', 15000.00, 28000.00, 42000.00, 200, 50, 20),
    ('London', 'Dubai', '2023-08-19', '14:00:00', '20:00:00', 'Qatar Airways', 'QR502', 17000.00, 31000.00, 46000.00, 180, 45, 15),
    ('London', 'Dubai', '2023-08-19', '18:00:00', '00:00:00', 'Etihad Airways', 'EY603', 19000.00, 34000.00, 50000.00, 220, 55, 25);



-- Trip 4: Dubai to New York
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Dubai', 'New York', '2023-08-06', '10:00:00', '16:00:00', 'Emirates', 'EK801', 30000.00, 55000.00, 80000.00, 250, 60, 30),
    ('Dubai', 'New York', '2023-08-06', '14:00:00', '20:00:00', 'Etihad Airways', 'EY902', 32000.00, 58000.00, 85000.00, 230, 55, 25),
    ('Dubai', 'New York', '2023-08-06', '18:00:00', '00:00:00', 'Qatar Airways', 'QR703', 28000.00, 50000.00, 74000.00, 270, 65, 35),
    
    -- Repeat after 2 weeks
    ('Dubai', 'New York', '2023-08-20', '10:00:00', '16:00:00', 'Emirates', 'EK801', 30000.00, 55000.00, 80000.00, 250, 60, 30),
    ('Dubai', 'New York', '2023-08-20', '14:00:00', '20:00:00', 'Etihad Airways', 'EY902', 32000.00, 58000.00, 85000.00, 230, 55, 25),
    ('Dubai', 'New York', '2023-08-20', '18:00:00', '00:00:00', 'Qatar Airways', 'QR703', 28000.00, 50000.00, 74000.00, 270, 65, 35);



-- Trip 5: New York to Tokyo
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('New York', 'Tokyo', '2023-08-07', '10:00:00', '14:00:00', 'United Airlines', 'UA901', 35000.00, 62000.00, 90000.00, 300, 70, 40),
    ('New York', 'Tokyo', '2023-08-07', '14:00:00', '18:00:00', 'Japan Airlines', 'JL802', 32000.00, 58000.00, 85000.00, 280, 65, 35),
    ('New York', 'Tokyo', '2023-08-07', '18:00:00', '22:00:00', 'Delta Air Lines', 'DL703', 38000.00, 68000.00, 98000.00, 320, 75, 45),
    
    -- Repeat after 2 weeks
    ('New York', 'Tokyo', '2023-08-21', '10:00:00', '14:00:00', 'United Airlines', 'UA901', 35000.00, 62000.00, 90000.00, 300, 70, 40),
    ('New York', 'Tokyo', '2023-08-21', '14:00:00', '18:00:00', 'Japan Airlines', 'JL802', 32000.00, 58000.00, 85000.00, 280, 65, 35),
    ('New York', 'Tokyo', '2023-08-21', '18:00:00', '22:00:00', 'Delta Air Lines', 'DL703', 38000.00, 68000.00, 98000.00, 320, 75, 45);



-- Trip 10: Dubai to Singapore
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Dubai', 'Singapore', '2023-08-08', '10:00:00', '16:00:00', 'Emirates', 'EK1005', 18000.00, 32000.00, 48000.00, 200, 50, 20),
    ('Dubai', 'Singapore', '2023-08-08', '14:00:00', '20:00:00', 'Singapore Airlines', 'SQ1106', 16000.00, 30000.00, 45000.00, 180, 40, 15),
    ('Dubai', 'Singapore', '2023-08-08', '18:00:00', '00:00:00', 'Qatar Airways', 'QR807', 20000.00, 35000.00, 52000.00, 220, 55, 25),
    
    -- Repeat after 2 weeks
    ('Dubai', 'Singapore', '2023-08-22', '10:00:00', '16:00:00', 'Emirates', 'EK1005', 18000.00, 32000.00, 48000.00, 200, 50, 20),
    ('Dubai', 'Singapore', '2023-08-22', '14:00:00', '20:00:00', 'Singapore Airlines', 'SQ1106', 16000.00, 30000.00, 45000.00, 180, 40, 15),
    ('Dubai', 'Singapore', '2023-08-22', '18:00:00', '00:00:00', 'Qatar Airways', 'QR807', 20000.00, 35000.00, 52000.00, 220, 55, 25);



-- Trip 11: Tokyo to Paris
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Tokyo', 'Paris', '2023-08-09', '08:00:00', '15:00:00', 'Japan Airlines', 'JL1208', 20000.00, 35000.00, 52000.00, 200, 50, 20),
    ('Tokyo', 'Paris', '2023-08-09', '12:00:00', '19:00:00', 'Air France', 'AF909', 18000.00, 32000.00, 48000.00, 180, 40, 15),
    ('Tokyo', 'Paris', '2023-08-09', '16:00:00', '23:00:00', 'Lufthansa', 'LH110', 22000.00, 38000.00, 55000.00, 220, 55, 25),
    
    -- Repeat after 2 weeks
    ('Tokyo', 'Paris', '2023-08-23', '08:00:00', '15:00:00', 'Japan Airlines', 'JL1208', 20000.00, 35000.00, 52000.00, 200, 50, 20),
    ('Tokyo', 'Paris', '2023-08-23', '12:00:00', '19:00:00', 'Air France', 'AF909', 18000.00, 32000.00, 48000.00, 180, 40, 15),
    ('Tokyo', 'Paris', '2023-08-23', '16:00:00', '23:00:00', 'Lufthansa', 'LH110', 22000.00, 38000.00, 55000.00, 220, 55, 25);



-- Trip 12: Bangkok to Sydney
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Bangkok', 'Sydney', '2023-08-10', '09:00:00', '15:00:00', 'Thai Airways', 'TG1308', 19000.00, 34000.00, 51000.00, 200, 50, 20),
    ('Bangkok', 'Sydney', '2023-08-10', '13:00:00', '19:00:00', 'Qantas', 'QF1209', 17000.00, 31000.00, 46000.00, 180, 40, 15),
    ('Bangkok', 'Sydney', '2023-08-10', '17:00:00', '23:00:00', 'Emirates', 'EK1010', 21000.00, 36000.00, 53000.00, 220, 55, 25),
    
    -- Repeat after 2 weeks
    ('Bangkok', 'Sydney', '2023-08-24', '09:00:00', '15:00:00', 'Thai Airways', 'TG1308', 19000.00, 34000.00, 51000.00, 200, 50, 20),
    ('Bangkok', 'Sydney', '2023-08-24', '13:00:00', '19:00:00', 'Qantas', 'QF1209', 17000.00, 31000.00, 46000.00, 180, 40, 15),
    ('Bangkok', 'Sydney', '2023-08-24', '17:00:00', '23:00:00', 'Emirates', 'EK1010', 21000.00, 36000.00, 53000.00, 220, 55, 25);



-- Trip 13: London to Dubai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('London', 'Dubai', '2023-08-11', '08:00:00', '15:00:00', 'Emirates', 'EK1311', 18000.00, 32000.00, 48000.00, 200, 50, 20),
    ('London', 'Dubai', '2023-08-11', '12:00:00', '19:00:00', 'Qatar Airways', 'QR1112', 16000.00, 30000.00, 45000.00, 180, 40, 15),
    ('London', 'Dubai', '2023-08-11', '16:00:00', '23:00:00', 'British Airways', 'BA813', 20000.00, 35000.00, 52000.00, 220, 55, 25),
    
    -- Repeat after 2 weeks
    ('London', 'Dubai', '2023-08-25', '08:00:00', '15:00:00', 'Emirates', 'EK1311', 18000.00, 32000.00, 48000.00, 200, 50, 20),
    ('London', 'Dubai', '2023-08-25', '12:00:00', '19:00:00', 'Qatar Airways', 'QR1112', 16000.00, 30000.00, 45000.00, 180, 40, 15),
    ('London', 'Dubai', '2023-08-25', '16:00:00', '23:00:00', 'British Airways', 'BA813', 20000.00, 35000.00, 52000.00, 220, 55, 25);

-- Trip 14: New York to Singapore
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('New York', 'Singapore', DATE_FORMAT(NOW(), '%Y-%m-%d'), '09:00:00', '16:00:00', 'Singapore Airlines', 'SQ1414', 20000.00, 35000.00, 52000.00, 200, 50, 20),
    ('New York', 'Singapore', DATE_FORMAT(NOW(), '%Y-%m-%d'), '13:00:00', '20:00:00', 'United Airlines', 'UA1215', 18000.00, 32000.00, 48000.00, 180, 40, 15),
    ('New York', 'Singapore', DATE_FORMAT(NOW(), '%Y-%m-%d'), '17:00:00', '00:00:00', 'Cathay Pacific', 'CX1216', 22000.00, 38000.00, 55000.00, 220, 55, 25);

-- Trip 14: New York to Singapore
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('New York', 'Singapore', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '09:00:00', '16:00:00', 'Singapore Airlines', 'SQ1414', 20000.00, 35000.00, 52000.00, 200, 50, 20),
    ('New York', 'Singapore', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '13:00:00', '20:00:00', 'United Airlines', 'UA1215', 18000.00, 32000.00, 48000.00, 180, 40, 15),
    ('New York', 'Singapore', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '17:00:00', '00:00:00', 'Cathay Pacific', 'CX1216', 22000.00, 38000.00, 55000.00, 220, 55, 25);

-- Trip 15: Paris to Sydney
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Paris', 'Sydney', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '08:00:00', '15:00:00', 'Qantas', 'QF1517', 19000.00, 34000.00, 51000.00, 200, 50, 20),
    ('Paris', 'Sydney', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '12:00:00', '19:00:00', 'Air France', 'AF1218', 17000.00, 31000.00, 46000.00, 180, 40, 15),
    ('Paris', 'Sydney', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '16:00:00', '23:00:00', 'Lufthansa', 'LF1621', 20000.00, 36000.00, 52000.00, 150, 30, 10);

-- Trip 16: Mumbai to Kolkata
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Mumbai', 'Kolkata', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '08:00:00', '10:00:00', 'IndiGo', '6E1411', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Mumbai', 'Kolkata', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '12:00:00', '14:00:00', 'SpiceJet', 'SG1412', 1800.00, 3200.00, 4800.00, 80, 10, 5),
    ('Mumbai', 'Kolkata', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '16:00:00', '18:00:00', 'Air India', 'AI1413', 2200.00, 3800.00, 5500.00, 120, 25, 15);

-- Trip 17: Delhi to Bangalore
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Delhi', 'Bangalore', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '09:00:00', '11:30:00', 'IndiGo', '6E1514', 2200.00, 3800.00, 5500.00, 120, 25, 15),
    ('Delhi', 'Bangalore', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '13:00:00', '15:30:00', 'SpiceJet', 'SG1515', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Delhi', 'Bangalore', DATE_ADD(DATE_FORMAT(NOW(), '%Y-%m-%d'), INTERVAL 14 DAY), '17:00:00', '19:30:00', 'Air India', 'AI1516', 2400.00, 4000.00, 5700.00, 150, 30, 20);

-- Trip 15: Paris to Sydney
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Paris', 'Sydney', '2023-08-13', '08:00:00', '15:00:00', 'Qantas', 'QF1517', 19000.00, 34000.00, 51000.00, 200, 50, 20),
    ('Paris', 'Sydney', '2023-08-13', '12:00:00', '19:00:00', 'Air France', 'AF1218', 17000.00, 31000.00, 46000.00, 180, 40, 15),
    ('Paris', 'Sydney', '2023-08-13', '16:00:00', '23:00:00', 'Lufthansa', 'LF1621', 20000.00, 36000.00, 52000.00, 150, 30, 10);

-- Trip 16: Mumbai to Kolkata
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Mumbai', 'Kolkata', '2023-08-14', '08:00:00', '10:00:00', 'IndiGo', '6E1411', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Mumbai', 'Kolkata', '2023-08-14', '12:00:00', '14:00:00', 'SpiceJet', 'SG1412', 1800.00, 3200.00, 4800.00, 80, 10, 5),
    ('Mumbai', 'Kolkata', '2023-08-14', '16:00:00', '18:00:00', 'Air India', 'AI1413', 2200.00, 3800.00, 5500.00, 120, 25, 15);

-- Trip 17: Delhi to Bangalore
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Delhi', 'Bangalore', '2023-08-15', '09:00:00', '11:30:00', 'IndiGo', '6E1514', 2200.00, 3800.00, 5500.00, 120, 25, 15),
    ('Delhi', 'Bangalore', '2023-08-15', '13:00:00', '15:30:00', 'SpiceJet', 'SG1515', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Delhi', 'Bangalore', '2023-08-15', '17:00:00', '19:30:00', 'Air India', 'AI1516', 2400.00, 4000.00, 5700.00, 150, 30, 20);

-- Trip 18: Chennai to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Chennai', 'Mumbai', '2023-08-16', '08:00:00', '10:00:00', 'IndiGo', '6E1617', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Chennai', 'Mumbai', '2023-08-16', '12:00:00', '14:00:00', 'SpiceJet', 'SG1618', 1800.00, 3200.00, 4800.00, 80, 10, 5),
    ('Chennai', 'Mumbai', '2023-08-16', '16:00:00', '18:00:00', 'Air India', 'AI1619', 2200.00, 3800.00, 5500.00, 120, 25, 15);

-- Trip 19: Kolkata to Delhi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Kolkata', 'Delhi', '2023-08-17', '09:00:00', '11:30:00', 'IndiGo', '6E1720', 2200.00, 3800.00, 5500.00, 120, 25, 15),
    ('Kolkata', 'Delhi', '2023-08-17', '13:00:00', '15:30:00', 'SpiceJet', 'SG1721', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Kolkata', 'Delhi', '2023-08-17', '17:00:00', '19:30:00', 'Air India', 'AI1722', 2400.00, 4000.00, 5700.00, 150, 30, 20);

-- Trip 20: Bangalore to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Bangalore', 'Chennai', '2023-08-18', '08:00:00', '10:00:00', 'IndiGo', '6E1823', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Bangalore', 'Chennai', '2023-08-18', '12:00:00', '14:00:00', 'SpiceJet', 'SG1824', 1800.00, 3200.00, 4800.00, 80, 10, 5),
    ('Bangalore', 'Chennai', '2023-08-18', '16:00:00', '18:00:00', 'Air India', 'AI1825', 2200.00, 3800.00, 5500.00, 120, 25, 15);

-- Trip 21: Mumbai to Kolkata
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Mumbai', 'Kolkata', '2023-08-19', '08:00:00', '10:00:00', 'IndiGo', '6E1926', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Mumbai', 'Kolkata', '2023-08-19', '12:00:00', '14:00:00', 'SpiceJet', 'SG1927', 1800.00, 3200.00, 4800.00, 80, 10, 5),
    ('Mumbai', 'Kolkata', '2023-08-19', '16:00:00', '18:00:00', 'Air India', 'AI1928', 2200.00, 3800.00, 5500.00, 120, 25, 15);

-- Trip 22: Delhi to Bangalore
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Delhi', 'Bangalore', '2023-08-20', '09:00:00', '11:30:00', 'IndiGo', '6E2029', 2200.00, 3800.00, 5500.00, 120, 25, 15),
    ('Delhi', 'Bangalore', '2023-08-20', '13:00:00', '15:30:00', 'SpiceJet', 'SG2030', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Delhi', 'Bangalore', '2023-08-20', '17:00:00', '19:30:00', 'Air India', 'AI2031', 2400.00, 4000.00, 5700.00, 150, 30, 20);

-- Trip 23: Chennai to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Chennai', 'Mumbai', '2023-08-21', '08:00:00', '10:00:00', 'IndiGo', '6E2132', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Chennai', 'Mumbai', '2023-08-21', '12:00:00', '14:00:00', 'SpiceJet', 'SG2133', 1800.00, 3200.00, 4800.00, 80, 10, 5),
    ('Chennai', 'Mumbai', '2023-08-21', '16:00:00', '18:00:00', 'Air India', 'AI2134', 2200.00, 3800.00, 5500.00, 120, 25, 15);

INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Mumbai', 'Delhi', '2023-08-22', '10:00:00', '12:00:00', 'IndiGo', '6E101', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Mumbai', 'Delhi', '2023-08-22', '14:00:00', '16:00:00', 'SpiceJet', 'SG102', 1800.00, 3200.00, 4800.00, 80, 10, 5),
    ('Mumbai', 'Delhi', '2023-08-22', '18:00:00', '20:00:00', 'Air India', 'AI103', 2200.00, 3800.00, 5500.00, 120, 25, 15),

    -- Delhi to Mumbai
    ('Delhi', 'Mumbai', '2023-08-23', '14:00:00', '16:00:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Delhi', 'Mumbai', '2023-08-23', '16:30:00', '18:30:00', 'SpiceJet', 'SG505', 1600.00, 3100.00, 4600.00, 90, 25, 12),
    ('Delhi', 'Mumbai', '2023-08-23', '19:00:00', '21:00:00', 'IndiGo', '6E707', 1700.00, 3300.00, 4900.00, 100, 35, 18),
    
    -- Kolkata to Chennai
    ('Kolkata', 'Chennai', '2023-08-24', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
    ('Kolkata', 'Chennai', '2023-08-24', '15:00:00', '17:00:00', 'IndiGo', '6E202', 1400.00, 3100.00, 4600.00, 110, 35, 18),
    ('Kolkata', 'Chennai', '2023-08-24', '17:30:00', '19:30:00', 'Air India', 'AI404', 1600.00, 3200.00, 4800.00, 100, 30, 15),

    -- Chennai to Kolkata
    ('Chennai', 'Kolkata', '2023-08-25', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
    ('Chennai', 'Kolkata', '2023-08-25', '11:00:00', '13:00:00', 'SpiceJet', 'SG606', 1600.00, 3100.00, 4600.00, 100, 30, 15),
    ('Chennai', 'Kolkata', '2023-08-25', '13:30:00', '15:30:00', 'IndiGo', '6E909', 1500.00, 3000.00, 4500.00, 110, 35, 18),
    
    -- Chennai to Kolkata
('Chennai', 'Kolkata', '2023-09-08', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
('Chennai', 'Kolkata', '2023-09-08', '11:00:00', '13:00:00', 'SpiceJet', 'SG606', 1600.00, 3100.00, 4600.00, 100, 30, 15),
('Chennai', 'Kolkata', '2023-09-08', '13:30:00', '15:30:00', 'IndiGo', '6E909', 1500.00, 3000.00, 4500.00, 110, 35, 18),
    
    -- Hyderabad to Bengaluru
    ('Hyderabad', 'Bengaluru', '2023-08-26', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
    ('Hyderabad', 'Bengaluru', '2023-08-26', '12:00:00', '13:45:00', 'Vistara', 'UK101', 1400.00, 2900.00, 4300.00, 140, 45, 25),
    ('Hyderabad', 'Bengaluru', '2023-08-26', '14:15:00', '16:00:00', 'SpiceJet', 'SG909', 1500.00, 3000.00, 4500.00, 130, 40, 20),
    
    -- Hyderabad to Bengaluru
('Hyderabad', 'Bengaluru', '2023-08-09', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
('Hyderabad', 'Bengaluru', '2023-08-09', '12:00:00', '13:45:00', 'Vistara', 'UK101', 1400.00, 2900.00, 4300.00, 140, 45, 25),
('Hyderabad', 'Bengaluru', '2023-08-09', '14:15:00', '16:00:00', 'SpiceJet', 'SG909', 1500.00, 3000.00, 4500.00, 130, 40, 20),

-- Bengaluru to Hyderabad
('Bengaluru', 'Hyderabad', '2023-08-10', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
('Bengaluru', 'Hyderabad', '2023-08-10', '16:30:00', '18:15:00', 'IndiGo', '6E404', 1300.00, 2800.00, 4200.00, 120, 40, 20),
('Bengaluru', 'Hyderabad', '2023-08-10', '18:45:00', '20:30:00', 'Air India', 'AI707', 1200.00, 2700.00, 4100.00, 130, 45, 25),

-- Ahmedabad to Jaipur
('Ahmedabad', 'Jaipur', '2023-08-11', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
('Ahmedabad', 'Jaipur', '2023-08-11', '13:00:00', '14:00:00', 'GoAir', 'G656', 1100.00, 2600.00, 3900.00, 110, 35, 18),
('Ahmedabad', 'Jaipur', '2023-08-11', '14:30:00', '15:30:00', 'SpiceJet', 'SG808', 1000.00, 2500.00, 3800.00, 120, 40, 20),

-- Jaipur to Ahmedabad
('Jaipur', 'Ahmedabad', '2023-08-12', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Jaipur', 'Ahmedabad', '2023-08-12', '17:30:00', '18:30:00', 'IndiGo', '6E757', 1000.00, 2500.00, 3800.00, 100, 30, 15),
('Jaipur', 'Ahmedabad', '2023-08-12', '19:00:00', '20:00:00', 'Air India', 'AI909', 900.00, 2400.00, 3700.00, 110, 35, 18),

-- Lucknow to Varanasi
('Lucknow', 'Varanasi', '2023-08-13', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
('Lucknow', 'Varanasi', '2023-08-13', '15:30:00', '16:45:00', 'SpiceJet', 'SG404', 800.00, 2300.00, 3500.00, 130, 45, 25),
('Lucknow', 'Varanasi', '2023-08-13', '17:15:00', '18:30:00', 'IndiGo', '6E505', 700.00, 2200.00, 3400.00, 140, 50, 30),

-- Varanasi to Lucknow
('Varanasi', 'Lucknow', '2023-08-14', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
('Varanasi', 'Lucknow', '2023-08-14', '12:15:00', '13:30:00', 'Air India', 'AI404', 850.00, 2400.00, 3600.00, 110, 40, 20),
('Varanasi', 'Lucknow', '2023-08-14', '14:00:00', '15:15:00', 'GoAir', 'G606', 750.00, 2300.00, 3500.00, 120, 45, 25),

-- Mumbai to Kolkata
('Mumbai', 'Kolkata', '2023-08-15', '09:00:00', '12:00:00', 'Vistara', 'UK101', 2200.00, 3800.00, 5500.00, 100, 20, 10),
('Mumbai', 'Kolkata', '2023-08-15', '12:30:00', '15:30:00', 'IndiGo', '6E202', 2000.00, 3500.00, 5000.00, 90, 25, 12),
('Mumbai', 'Kolkata', '2023-08-15', '16:00:00', '19:00:00', 'Air India', 'AI707', 1800.00, 3200.00, 4800.00, 80, 30, 15),

-- Kolkata to Mumbai
('Kolkata', 'Mumbai', '2023-08-16', '14:00:00', '17:00:00', 'IndiGo', '6E303', 1800.00, 3300.00, 4900.00, 80, 30, 15),
('Kolkata', 'Mumbai', '2023-08-16', '17:30:00', '20:30:00', 'SpiceJet', 'SG505', 1600.00, 3100.00, 4600.00, 90, 25, 12),
('Kolkata', 'Mumbai', '2023-08-16', '21:00:00', '00:00:00', 'Air India', 'AI404', 1700.00, 3300.00, 4900.00, 100, 35, 18),


-- Delhi to Chennai
('Delhi', 'Chennai', '2023-08-17', '12:30:00', '15:30:00', 'SpiceJet', 'SG303', 1800.00, 3200.00, 4800.00, 120, 40, 20),
('Delhi', 'Chennai', '2023-08-17', '16:00:00', '19:00:00', 'IndiGo', '6E404', 1600.00, 3100.00, 4600.00, 110, 35, 18),
('Delhi', 'Chennai', '2023-08-17', '19:30:00', '22:30:00', 'Air India', 'AI606', 1400.00, 3000.00, 4400.00, 100, 30, 15),

-- Chennai to Delhi
('Chennai', 'Delhi', '2023-08-18', '08:30:00', '11:30:00', 'GoAir', 'G411', 1700.00, 3200.00, 4800.00, 90, 25, 12),
('Chennai', 'Delhi', '2023-08-18', '12:00:00', '15:00:00', 'IndiGo', '6E505', 1500.00, 3100.00, 4700.00, 100, 30, 15),
('Chennai', 'Delhi', '2023-08-18', '15:30:00', '18:30:00', 'SpiceJet', 'SG707', 1300.00, 3000.00, 4600.00, 110, 35, 18),

-- Hyderabad to Bengaluru
('Hyderabad', 'Bengaluru', '2023-08-19', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1500.00, 3000.00, 4500.00, 150, 50, 30),
('Hyderabad', 'Bengaluru', '2023-08-19', '12:00:00', '13:45:00', 'IndiGo', '6E808', 1400.00, 2900.00, 4400.00, 140, 45, 25),
('Hyderabad', 'Bengaluru', '2023-08-19', '14:15:00', '16:00:00', 'SpiceJet', 'SG909', 1300.00, 2800.00, 4300.00, 130, 40, 20),

-- Bengaluru to Hyderabad
('Bengaluru', 'Hyderabad', '2023-08-20', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
('Bengaluru', 'Hyderabad', '2023-08-20', '16:30:00', '18:15:00', 'Air India', 'AI101', 1300.00, 2800.00, 4200.00, 120, 40, 20),
('Bengaluru', 'Hyderabad', '2023-08-20', '18:45:00', '20:30:00', 'IndiGo', '6E202', 1200.00, 2700.00, 4100.00, 130, 45, 25),

-- Ahmedabad to Jaipur
('Ahmedabad', 'Jaipur', '2023-08-21', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
('Ahmedabad', 'Jaipur', '2023-08-21', '13:00:00', '14:00:00', 'IndiGo', '6E404', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Ahmedabad', 'Jaipur', '2023-08-21', '14:30:00', '15:30:00', 'SpiceJet', 'SG505', 1000.00, 2500.00, 3800.00, 80, 20, 10),

-- Jaipur to Ahmedabad
('Jaipur', 'Ahmedabad', '2023-08-22', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Jaipur', 'Ahmedabad', '2023-08-22', '17:30:00', '18:30:00', 'GoAir', 'G606', 1000.00, 2500.00, 3800.00, 100, 30, 15),
('Jaipur', 'Ahmedabad', '2023-08-22', '19:00:00', '20:00:00', 'Vistara', 'UK707', 900.00, 2400.00, 3700.00, 110, 35, 18),

-- Lucknow to Varanasi
('Lucknow', 'Varanasi', '2023-08-23', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
('Lucknow', 'Varanasi', '2023-08-23', '15:30:00', '16:45:00', 'Air India', 'AI808', 800.00, 2300.00, 3500.00, 110, 35, 18),
('Lucknow', 'Varanasi', '2023-08-23', '17:15:00', '18:30:00', 'SpiceJet', 'SG909', 700.00, 2200.00, 3400.00, 100, 30, 15),

-- Varanasi to Lucknow
('Varanasi', 'Lucknow', '2023-08-24', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
('Varanasi', 'Lucknow', '2023-08-24', '12:15:00', '13:30:00', 'Air India', 'AI808', 850.00, 2400.00, 3600.00, 110, 40, 20),
('Varanasi', 'Lucknow', '2023-08-24', '14:00:00', '15:15:00', 'GoAir', 'G909', 750.00, 2300.00, 3500.00, 120, 45, 25),

-- Mumbai to Delhi
('Mumbai', 'Delhi', '2023-08-25', '10:00:00', '12:00:00', 'IndiGo', '6E101', 2000.00, 3500.00, 5000.00, 100, 20, 10),
('Mumbai', 'Delhi', '2023-08-25', '12:30:00', '14:30:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
('Mumbai', 'Delhi', '2023-08-25', '15:00:00', '17:00:00', 'Vistara', 'UK303', 1600.00, 3100.00, 4600.00, 90, 25, 12),

    -- Bengaluru to Hyderabad
    ('Bengaluru', 'Hyderabad', '2023-08-27', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
    ('Bengaluru', 'Hyderabad', '2023-08-27', '16:30:00', '18:15:00', 'IndiGo', '6E404', 1300.00, 2800.00, 4200.00, 120, 40, 20),
    ('Bengaluru', 'Hyderabad', '2023-08-27', '18:45:00', '20:30:00', 'Air India', 'AI707', 1200.00, 2700.00, 4100.00, 130, 45, 25),
    
    -- Ahmedabad to Jaipur
    ('Ahmedabad', 'Jaipur', '2023-08-28', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
    ('Ahmedabad', 'Jaipur', '2023-08-28', '13:00:00', '14:00:00', 'GoAir', 'G656', 1100.00, 2600.00, 3900.00, 110, 35, 18),
    ('Ahmedabad', 'Jaipur', '2023-08-28', '14:30:00', '15:30:00', 'SpiceJet', 'SG808', 1000.00, 2500.00, 3800.00, 120, 40, 20),
    
    -- Jaipur to Ahmedabad
    ('Jaipur', 'Ahmedabad', '2023-08-29', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
    ('Jaipur', 'Ahmedabad', '2023-08-29', '17:30:00', '18:30:00', 'IndiGo', '6E757', 1000.00, 2500.00, 3800.00, 100, 30, 15),
    ('Jaipur', 'Ahmedabad', '2023-08-29', '19:00:00', '20:00:00', 'Air India', 'AI909', 900.00, 2400.00, 3700.00, 110, 35, 18),
    
    -- Lucknow to Varanasi
    ('Lucknow', 'Varanasi', '2023-08-30', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
    ('Lucknow', 'Varanasi', '2023-08-30', '15:30:00', '16:45:00', 'SpiceJet', 'SG404', 800.00, 2300.00, 3500.00, 130, 45, 25),
    ('Lucknow', 'Varanasi', '2023-08-30', '17:15:00', '18:30:00', 'IndiGo', '6E505', 700.00, 2200.00, 3400.00, 140, 50, 30),
    
    -- Varanasi to Lucknow
    ('Varanasi', 'Lucknow', '2023-08-31', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
    ('Varanasi', 'Lucknow', '2023-08-31', '12:15:00', '13:30:00', 'Air India', 'AI404', 850.00, 2400.00, 3600.00, 110, 40, 20),
    ('Varanasi', 'Lucknow', '2023-08-31', '14:00:00', '15:15:00', 'GoAir', 'G606', 750.00, 2300.00, 3500.00, 120, 45, 25),
    
    -- Mumbai to Kolkata
    ('Mumbai', 'Kolkata', '2023-08-01', '09:00:00', '12:00:00', 'Vistara', 'UK101', 2200.00, 3800.00, 5500.00, 100, 20, 10),
    ('Mumbai', 'Kolkata', '2023-08-01', '12:30:00', '15:30:00', 'IndiGo', '6E202', 2000.00, 3500.00, 5000.00, 90, 25, 12),
    ('Mumbai', 'Kolkata', '2023-08-01', '16:00:00', '19:00:00', 'Air India', 'AI707', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    
    -- Kolkata to Mumbai
    ('Kolkata', 'Mumbai', '2023-08-02', '14:00:00', '17:00:00', 'IndiGo', '6E303', 1800.00, 3300.00, 4900.00, 80, 30, 15),
    ('Kolkata', 'Mumbai', '2023-08-02', '17:30:00', '20:30:00', 'SpiceJet', 'SG505', 1600.00, 3100.00, 4600.00, 90, 25, 12),
    ('Kolkata', 'Mumbai', '2023-08-02', '21:00:00', '00:00:00', 'Air India', 'AI404', 1700.00, 3300.00, 4900.00, 100, 35, 18),

-- Delhi to Chennai
    ('Delhi', 'Chennai', '2023-08-03', '12:30:00', '15:30:00', 'SpiceJet', 'SG303', 1800.00, 3200.00, 4800.00, 120, 40, 20),
    ('Delhi', 'Chennai', '2023-08-03', '16:00:00', '19:00:00', 'IndiGo', '6E404', 1600.00, 3100.00, 4600.00, 110, 35, 18),
    ('Delhi', 'Chennai', '2023-08-03', '19:30:00', '22:30:00', 'Air India', 'AI606', 1400.00, 3000.00, 4400.00, 100, 30, 15),

-- Chennai to Delhi
    ('Chennai', 'Delhi', '2023-08-04', '08:30:00', '11:30:00', 'GoAir', 'G411', 1700.00, 3200.00, 4800.00, 90, 25, 12),
    ('Chennai', 'Delhi', '2023-08-04', '12:00:00', '15:00:00', 'IndiGo', '6E505', 1500.00, 3100.00, 4700.00, 100, 30, 15),
    ('Chennai', 'Delhi', '2023-08-04', '15:30:00', '18:30:00', 'SpiceJet', 'SG707', 1300.00, 3000.00, 4600.00, 110, 35, 18),

-- Hyderabad to Bengaluru
    ('Hyderabad', 'Bengaluru', '2023-08-05', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1500.00, 3000.00, 4500.00, 150, 50, 30),
    ('Hyderabad', 'Bengaluru', '2023-08-05', '12:00:00', '13:45:00', 'IndiGo', '6E808', 1400.00, 2900.00, 4400.00, 140, 45, 25),
    ('Hyderabad', 'Bengaluru', '2023-08-05', '14:15:00', '16:00:00', 'SpiceJet', 'SG909', 1300.00, 2800.00, 4300.00, 130, 40, 20),

-- Bengaluru to Hyderabad
    ('Bengaluru', 'Hyderabad', '2023-08-06', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
    ('Bengaluru', 'Hyderabad', '2023-08-06', '16:30:00', '18:15:00', 'Air India', 'AI101', 1300.00, 2800.00, 4200.00, 120, 40, 20),
    ('Bengaluru', 'Hyderabad', '2023-08-06', '18:45:00', '20:30:00', 'IndiGo', '6E202', 1200.00, 2700.00, 4100.00, 130, 45, 25),

-- Ahmedabad to Jaipur
    ('Ahmedabad', 'Jaipur', '2023-08-07', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
    ('Ahmedabad', 'Jaipur', '2023-08-07', '13:00:00', '14:00:00', 'IndiGo', '6E404', 1100.00, 2600.00, 3900.00, 90, 25, 12),
    ('Ahmedabad', 'Jaipur', '2023-08-07', '14:30:00', '15:30:00', 'SpiceJet', 'SG505', 1000.00, 2500.00, 3800.00, 80, 20, 10),

-- Jaipur to Ahmedabad
    ('Jaipur', 'Ahmedabad', '2023-08-08', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
    ('Jaipur', 'Ahmedabad', '2023-08-08', '17:30:00', '18:30:00', 'GoAir', 'G606', 1000.00, 2500.00, 3800.00, 100, 30, 15),
    ('Jaipur', 'Ahmedabad', '2023-08-08', '19:00:00', '20:00:00', 'Vistara', 'UK707', 900.00, 2400.00, 3700.00, 110, 35, 18),

-- Lucknow to Varanasi
    ('Lucknow', 'Varanasi', '2023-08-09', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
    ('Lucknow', 'Varanasi', '2023-08-09', '15:30:00', '16:45:00', 'Air India', 'AI808', 800.00, 2300.00, 3500.00, 110, 35, 18),
    ('Lucknow', 'Varanasi', '2023-08-09', '17:15:00', '18:30:00', 'SpiceJet', 'SG909', 700.00, 2200.00, 3400.00, 100, 30, 15),

-- Varanasi to Lucknow
    ('Varanasi', 'Lucknow', '2023-08-10', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
    ('Varanasi', 'Lucknow', '2023-08-10', '12:15:00', '13:30:00', 'Air India', 'AI808', 850.00, 2400.00, 3600.00, 110, 40, 20),
    ('Varanasi', 'Lucknow', '2023-08-10', '14:00:00', '15:15:00', 'GoAir', 'G909', 750.00, 2300.00, 3500.00, 120, 45, 25),

-- Mumbai to Delhi
('Mumbai', 'Delhi', '2023-08-11', '10:00:00', '12:00:00', 'IndiGo', '6E101', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Mumbai', 'Delhi', '2023-08-11', '12:30:00', '14:30:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Mumbai', 'Delhi', '2023-08-11', '15:00:00', '17:00:00', 'Vistara', 'UK303', 1600.00, 3100.00, 4600.00, 90, 25, 12);
-- Delhi to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Delhi', 'Mumbai', '2023-08-12', '14:00:00', '16:00:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Delhi', 'Mumbai', '2023-08-12', '16:30:00', '18:30:00', 'IndiGo', '6E404', 1600.00, 3100.00, 4700.00, 90, 35, 18),
    ('Delhi', 'Mumbai', '2023-08-12', '19:00:00', '21:00:00', 'SpiceJet', 'SG707', 1400.00, 3000.00, 4600.00, 100, 40, 20);

-- Kolkata to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Kolkata', 'Chennai', '2023-08-13', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
    ('Kolkata', 'Chennai', '2023-08-13', '15:00:00', '17:00:00', 'IndiGo', '6E505', 1300.00, 2900.00, 4400.00, 110, 35, 18),
    ('Kolkata', 'Chennai', '2023-08-13', '17:30:00', '19:30:00', 'Air India', 'AI707', 1100.00, 2800.00, 4300.00, 100, 30, 15);
    
-- Delhi to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Delhi', 'Chennai', '2023-08-03', '12:30:00', '15:30:00', 'SpiceJet', 'SG303', 1800.00, 3200.00, 4800.00, 120, 40, 20),
('Delhi', 'Chennai', '2023-08-03', '16:00:00', '19:00:00', 'IndiGo', '6E505', 1600.00, 3100.00, 4700.00, 90, 35, 18),
('Delhi', 'Chennai', '2023-08-03', '19:30:00', '22:30:00', 'Air India', 'AI707', 1400.00, 3000.00, 4600.00, 100, 30, 15);

-- Chennai to Delhi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Chennai', 'Delhi', '2023-08-04', '08:30:00', '11:30:00', 'GoAir', 'G411', 1700.00, 3200.00, 4800.00, 90, 25, 12),
('Chennai', 'Delhi', '2023-08-04', '12:00:00', '15:00:00', 'SpiceJet', 'SG505', 1500.00, 3100.00, 4700.00, 80, 30, 15),
('Chennai', 'Delhi', '2023-08-04', '15:30:00', '18:30:00', 'IndiGo', '6E707', 1300.00, 3000.00, 4600.00, 100, 35, 18);

-- Hyderabad to Bengaluru
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Hyderabad', 'Bengaluru', '2023-08-05', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1500.00, 3000.00, 4500.00, 150, 50, 30),
('Hyderabad', 'Bengaluru', '2023-08-05', '12:00:00', '13:45:00', 'IndiGo', '6E808', 1400.00, 2900.00, 4400.00, 160, 55, 35),
('Hyderabad', 'Bengaluru', '2023-08-05', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1300.00, 2800.00, 4300.00, 110, 35, 18);

-- Bengaluru to Hyderabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Bengaluru', 'Hyderabad', '2023-08-06', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
('Bengaluru', 'Hyderabad', '2023-08-06', '16:30:00', '18:15:00', 'IndiGo', '6E606', 1300.00, 2800.00, 4200.00, 120, 40, 20),
('Bengaluru', 'Hyderabad', '2023-08-06', '18:45:00', '20:30:00', 'AirAsia', 'AK808', 1200.00, 2700.00, 4100.00, 100, 30, 15);

-- Ahmedabad to Jaipur
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Ahmedabad', 'Jaipur', '2023-08-07', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
('Ahmedabad', 'Jaipur', '2023-08-07', '13:00:00', '14:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Ahmedabad', 'Jaipur', '2023-08-07', '14:30:00', '15:30:00', 'GoAir', 'G707', 1000.00, 2500.00, 3800.00, 80, 20, 10);

-- Jaipur to Ahmedabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Jaipur', 'Ahmedabad', '2023-08-08', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Jaipur', 'Ahmedabad', '2023-08-08', '17:30:00', '18:30:00', 'GoAir', 'G808', 1000.00, 2500.00, 3800.00, 80, 20, 10),
('Jaipur', 'Ahmedabad', '2023-08-08', '19:00:00', '20:00:00', 'Air India', 'AI101', 900.00, 2400.00, 3700.00, 70, 15, 8);

-- Lucknow to Varanasi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Lucknow', 'Varanasi', '2023-08-09', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
('Lucknow', 'Varanasi', '2023-08-09', '15:30:00', '16:45:00', 'IndiGo', '6E303', 800.00, 2300.00, 3500.00, 110, 35, 18),
('Lucknow', 'Varanasi', '2023-08-09', '17:15:00', '18:30:00', 'SpiceJet', 'SG909', 700.00, 2200.00, 3400.00, 100, 30, 15);

-- Varanasi to Lucknow
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Varanasi', 'Lucknow', '2023-08-10', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
('Varanasi', 'Lucknow', '2023-08-10', '12:15:00', '13:30:00', 'SpiceJet', 'SG505', 850.00, 2400.00, 3600.00, 90, 30, 15),
('Varanasi', 'Lucknow', '2023-08-10', '14:00:00', '15:15:00', 'GoAir', 'G404', 750.00, 2300.00, 3500.00, 80, 25, 12);

-- Mumbai to Delhi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Mumbai', 'Delhi', '2023-08-11', '10:00:00', '12:00:00', 'IndiGo', '6E101', 2000.00, 3500.00, 5000.00, 100, 20, 10),
('Mumbai', 'Delhi', '2023-08-11', '12:30:00', '14:30:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
('Mumbai', 'Delhi', '2023-08-11', '15:00:00', '17:00:00', 'SpiceJet', 'SG707', 1600.00, 3100.00, 4700.00, 90, 35, 18);

-- Delhi to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Delhi', 'Mumbai', '2023-08-12', '14:00:00', '16:00:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
('Delhi', 'Mumbai', '2023-08-12', '16:30:00', '18:30:00', 'IndiGo', '6E303', 1600.00, 3100.00, 4700.00, 90, 35, 18),
('Delhi', 'Mumbai', '2023-08-12', '19:00:00', '21:00:00', 'SpiceJet', 'SG909', 1400.00, 3000.00, 4600.00, 100, 30, 15);

-- Kolkata to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Kolkata', 'Chennai', '2023-08-13', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
('Kolkata', 'Chennai', '2023-08-13', '15:00:00', '17:00:00', 'IndiGo', '6E707', 1300.00, 2900.00, 4400.00, 110, 35, 18),
('Kolkata', 'Chennai', '2023-08-13', '17:30:00', '19:30:00', 'Air India', 'AI909', 1100.00, 2800.00, 4300.00, 100, 30, 15);

-- Chennai to Kolkata
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Chennai', 'Kolkata', '2023-08-14', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
('Chennai', 'Kolkata', '2023-08-14', '11:00:00', '13:00:00', 'SpiceJet', 'SG909', 1500.00, 3100.00, 4700.00, 80, 30, 15),
('Chennai', 'Kolkata', '2023-08-14', '13:30:00', '15:30:00', 'IndiGo', '6E404', 1300.00, 3000.00, 4600.00, 70, 25, 12);
    
    
    -- Hyderabad to Bengaluru
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Hyderabad', 'Bengaluru', '2023-08-15', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
    ('Hyderabad', 'Bengaluru', '2023-08-15', '10:15:00', '11:45:00', 'IndiGo', '6E909', 1400.00, 2900.00, 4300.00, 120, 40, 25),
    ('Hyderabad', 'Bengaluru', '2023-08-15', '11:00:00', '12:30:00', 'SpiceJet', 'SG707', 1500.00, 3000.00, 4400.00, 100, 30, 20);

-- Bengaluru to Hyderabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Bengaluru', 'Hyderabad', '2023-08-16', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
    ('Bengaluru', 'Hyderabad', '2023-08-16', '14:45:00', '16:30:00', 'AirAsia', 'AK606', 1300.00, 2800.00, 4200.00, 100, 30, 15),
    ('Bengaluru', 'Hyderabad', '2023-08-16', '15:30:00', '17:00:00', 'IndiGo', '6E707', 1200.00, 2700.00, 4000.00, 90, 25, 12);


INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Delhi', 'Mumbai', '2023-08-26', '14:00:00', '16:00:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Delhi', 'Mumbai', '2023-08-26', '16:30:00', '18:30:00', 'IndiGo', '6E404', 1600.00, 3100.00, 4700.00, 90, 35, 18),
    ('Delhi', 'Mumbai', '2023-08-26', '19:00:00', '21:00:00', 'SpiceJet', 'SG707', 1400.00, 3000.00, 4600.00, 100, 40, 20);

-- Kolkata to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Kolkata', 'Chennai', '2023-08-27', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
    ('Kolkata', 'Chennai', '2023-08-27', '15:00:00', '17:00:00', 'IndiGo', '6E505', 1300.00, 2900.00, 4400.00, 110, 35, 18),
    ('Kolkata', 'Chennai', '2023-08-27', '17:30:00', '19:30:00', 'Air India', 'AI707', 1100.00, 2800.00, 4300.00, 100, 30, 15);

-- Delhi to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Delhi', 'Chennai', '2023-08-19', '12:30:00', '15:30:00', 'SpiceJet', 'SG303', 1800.00, 3200.00, 4800.00, 120, 40, 20),
('Delhi', 'Chennai', '2023-08-19', '16:00:00', '19:00:00', 'IndiGo', '6E505', 1600.00, 3100.00, 4700.00, 90, 35, 18),
('Delhi', 'Chennai', '2023-08-19', '19:30:00', '22:30:00', 'Air India', 'AI707', 1400.00, 3000.00, 4600.00, 100, 30, 15);

-- Chennai to Delhi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Chennai', 'Delhi', '2023-08-20', '08:30:00', '11:30:00', 'GoAir', 'G411', 1700.00, 3200.00, 4800.00, 90, 25, 12),
('Chennai', 'Delhi', '2023-08-20', '12:00:00', '15:00:00', 'SpiceJet', 'SG505', 1500.00, 3100.00, 4700.00, 80, 30, 15),
('Chennai', 'Delhi', '2023-08-20', '15:30:00', '18:30:00', 'IndiGo', '6E707', 1300.00, 3000.00, 4600.00, 100, 35, 18);

-- Hyderabad to Bengaluru
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Hyderabad', 'Bengaluru', '2023-08-21', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1500.00, 3000.00, 4500.00, 150, 50, 30),
('Hyderabad', 'Bengaluru', '2023-08-21', '12:00:00', '13:45:00', 'IndiGo', '6E808', 1400.00, 2900.00, 4400.00, 160, 55, 35),
('Hyderabad', 'Bengaluru', '2023-08-21', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1300.00, 2800.00, 4300.00, 110, 35, 18);

-- Bengaluru to Hyderabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Bengaluru', 'Hyderabad', '2023-08-22', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
('Bengaluru', 'Hyderabad', '2023-08-22', '16:30:00', '18:15:00', 'IndiGo', '6E606', 1300.00, 2800.00, 4200.00, 120, 40, 20),
('Bengaluru', 'Hyderabad', '2023-08-22', '18:45:00', '20:30:00', 'AirAsia', 'AK808', 1200.00, 2700.00, 4100.00, 100, 30, 15);

-- Ahmedabad to Jaipur
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Ahmedabad', 'Jaipur', '2023-08-23', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
('Ahmedabad', 'Jaipur', '2023-08-23', '13:00:00', '14:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Ahmedabad', 'Jaipur', '2023-08-23', '14:30:00', '15:30:00', 'GoAir', 'G707', 1000.00, 2500.00, 3800.00, 80, 20, 10);

-- Jaipur to Ahmedabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Jaipur', 'Ahmedabad', '2023-08-24', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Jaipur', 'Ahmedabad', '2023-08-24', '17:30:00', '18:30:00', 'GoAir', 'G808', 1000.00, 2500.00, 3800.00, 80, 20, 10),
('Jaipur', 'Ahmedabad', '2023-08-24', '19:00:00', '20:00:00', 'Air India', 'AI101', 900.00, 2400.00, 3700.00, 70, 15, 8);

-- Lucknow to Varanasi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Lucknow', 'Varanasi', '2023-08-25', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
('Lucknow', 'Varanasi', '2023-08-25', '15:30:00', '16:45:00', 'IndiGo', '6E303', 800.00, 2300.00, 3500.00, 110, 35, 18),
('Lucknow', 'Varanasi', '2023-08-25', '17:15:00', '18:30:00', 'SpiceJet', 'SG909', 700.00, 2200.00, 3400.00, 100, 30, 15);

-- Varanasi to Lucknow
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Varanasi', 'Lucknow', '2023-08-26', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
('Varanasi', 'Lucknow', '2023-08-26', '12:15:00', '13:30:00', 'SpiceJet', 'SG505', 850.00, 2400.00, 3600.00, 90, 30, 15),
('Varanasi', 'Lucknow', '2023-08-26', '14:00:00', '15:15:00', 'GoAir', 'G404', 750.00, 2300.00, 3500.00, 80, 25, 12);

-- Mumbai to Delhi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Mumbai', 'Delhi', '2023-08-27', '10:00:00', '12:00:00', 'IndiGo', '6E101', 2000.00, 3500.00, 5000.00, 100, 20, 10),
('Mumbai', 'Delhi', '2023-08-27', '12:30:00', '14:30:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
('Mumbai', 'Delhi', '2023-08-27', '15:00:00', '17:00:00', 'SpiceJet', 'SG707', 1600.00, 3100.00, 4700.00, 90, 35, 18);

-- Delhi to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Delhi', 'Mumbai', '2023-08-28', '14:00:00', '16:00:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
('Delhi', 'Mumbai', '2023-08-28', '16:30:00', '18:30:00', 'IndiGo', '6E303', 1600.00, 3100.00, 4700.00, 90, 35, 18),
('Delhi', 'Mumbai', '2023-08-28', '19:00:00', '21:00:00', 'SpiceJet', 'SG909', 1400.00, 3000.00, 4600.00, 100, 30, 15);

-- Kolkata to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Kolkata', 'Chennai', '2023-08-29', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
('Kolkata', 'Chennai', '2023-08-29', '15:00:00', '17:00:00', 'IndiGo', '6E707', 1300.00, 2900.00, 4400.00, 110, 35, 18),
('Kolkata', 'Chennai', '2023-08-29', '17:30:00', '19:30:00', 'Air India', 'AI909', 1100.00, 2800.00, 4300.00, 100, 30, 15);

-- Chennai to Kolkata
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Chennai', 'Kolkata', '2023-08-30', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
('Chennai', 'Kolkata', '2023-08-30', '11:00:00', '13:00:00', 'SpiceJet', 'SG909', 1500.00, 3100.00, 4700.00, 80, 30, 15),
('Chennai', 'Kolkata', '2023-08-30', '13:30:00', '15:30:00', 'IndiGo', '6E404', 1300.00, 3000.00, 4600.00, 70, 25, 12);

-- Hyderabad to Bengaluru
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Hyderabad', 'Bengaluru', '2023-08-31', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
('Hyderabad', 'Bengaluru', '2023-08-31', '10:15:00', '11:45:00', 'IndiGo', '6E909', 1400.00, 2900.00, 4300.00, 120, 40, 25),
('Hyderabad', 'Bengaluru', '2023-08-31', '11:00:00', '12:30:00', 'SpiceJet', 'SG707', 1500.00, 3000.00, 4400.00, 100, 30, 20);

-- Bengaluru to Hyderabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Bengaluru', 'Hyderabad', '2023-09-01', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
('Bengaluru', 'Hyderabad', '2023-09-01', '14:45:00', '16:30:00', 'AirAsia', 'AK606', 1300.00, 2800.00, 4200.00, 100, 30, 15),
('Bengaluru', 'Hyderabad', '2023-09-01', '15:30:00', '17:00:00', 'IndiGo', '6E707', 1200.00, 2700.00, 4000.00, 90, 25, 12);

-- Ahmedabad to Jaipur
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Ahmedabad', 'Jaipur', '2023-08-17', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
    ('Ahmedabad', 'Jaipur', '2023-08-17', '12:00:00', '13:00:00', 'SpiceJet', 'SG202', 1100.00, 2600.00, 3900.00, 90, 25, 12),
    ('Ahmedabad', 'Jaipur', '2023-08-17', '13:30:00', '14:30:00', 'IndiGo', '6E303', 1000.00, 2500.00, 3800.00, 80, 20, 10);

-- Jaipur to Ahmedabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Jaipur', 'Ahmedabad', '2023-08-18', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
    ('Jaipur', 'Ahmedabad', '2023-08-18', '16:30:00', '17:30:00', 'Air India', 'AI606', 1000.00, 2500.00, 3800.00, 80, 20, 10),
    ('Jaipur', 'Ahmedabad', '2023-08-18', '17:45:00', '18:45:00', 'IndiGo', '6E404', 900.00, 2400.00, 3700.00, 70, 15, 8);

-- Lucknow to Varanasi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Lucknow', 'Varanasi', '2023-08-19', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
    ('Lucknow', 'Varanasi', '2023-08-19', '14:15:00', '15:30:00', 'Vistara', 'UK606', 800.00, 2300.00, 3500.00, 110, 35, 18),
    ('Lucknow', 'Varanasi', '2023-08-19', '15:45:00', '17:00:00', 'IndiGo', '6E808', 700.00, 2200.00, 3400.00, 100, 30, 15);

-- Varanasi to Lucknow
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Varanasi', 'Lucknow', '2023-08-20', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
    ('Varanasi', 'Lucknow', '2023-08-20', '11:00:00', '12:15:00', 'GoAir', 'G505', 850.00, 2400.00, 3600.00, 90, 30, 15),
    ('Varanasi', 'Lucknow', '2023-08-20', '12:30:00', '13:45:00', 'Vistara', 'UK202', 750.00, 2300.00, 3500.00, 80, 25, 12);

-- Mumbai to Kolkata
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Mumbai', 'Kolkata', '2023-08-21', '09:00:00', '12:00:00', 'Vistara', 'UK101', 2200.00, 3800.00, 5500.00, 100, 20, 10),
    ('Mumbai', 'Kolkata', '2023-08-21', '09:30:00', '12:30:00', 'IndiGo', '6E303', 2100.00, 3700.00, 5400.00, 90, 18, 9),
    ('Mumbai', 'Kolkata', '2023-08-21', '10:15:00', '13:15:00', 'Air India', 'AI707', 2000.00, 3600.00, 5300.00, 80, 16, 8);

-- Kolkata to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Kolkata', 'Mumbai', '2023-08-22', '14:00:00', '17:00:00', 'IndiGo', '6E202', 2000.00, 3500.00, 5000.00, 80, 30, 15),
    ('Kolkata', 'Mumbai', '2023-08-22', '14:30:00', '17:30:00', 'SpiceJet', 'SG808', 1900.00, 3400.00, 4900.00, 70, 25, 12),
    ('Kolkata', 'Mumbai', '2023-08-22', '15:15:00', '18:15:00', 'AirAsia', 'AK505', 1800.00, 3300.00, 4800.00, 60, 20, 10);

-- Delhi to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Delhi', 'Chennai', '2023-08-23', '12:30:00', '15:30:00', 'SpiceJet', 'SG303', 1800.00, 3200.00, 4800.00, 120, 40, 20),
    ('Delhi', 'Chennai', '2023-08-23', '13:00:00', '16:00:00', 'IndiGo', '6E606', 1700.00, 3100.00, 4700.00, 110, 35, 18),
    ('Delhi', 'Chennai', '2023-08-23', '13:45:00', '16:45:00', 'Air India', 'AI909', 1600.00, 3000.00, 4600.00, 100, 30, 15);

-- Chennai to Delhi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Chennai', 'Delhi', '2023-08-24', '10:00:00', '13:00:00', 'Vistara', 'UK808', 1600.00, 3000.00, 4600.00, 100, 35, 18),
    ('Chennai', 'Delhi', '2023-08-24', '10:30:00', '13:30:00', 'IndiGo', '6E101', 1500.00, 2900.00, 4500.00, 90, 30, 15),
    ('Chennai', 'Delhi', '2023-08-24', '11:15:00', '14:15:00', 'AirAsia', 'AK404', 1400.00, 2800.00, 4400.00, 80, 25, 12);

-- Goa to Kochi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Goa', 'Kochi', '2023-08-25', '15:30:00', '17:00:00', 'IndiGo', '6E606', 1200.00, 2700.00, 4100.00, 100, 30, 15),
    ('Goa', 'Kochi', '2023-08-25', '16:00:00', '17:30:00', 'SpiceJet', 'SG707', 1100.00, 2600.00, 4000.00, 90, 25, 12),
    ('Goa', 'Kochi', '2023-08-25', '16:45:00', '18:15:00', 'Vistara', 'UK909', 1000.00, 2500.00, 3900.00, 80, 20, 10);

-- Kochi to Goa
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Kochi', 'Goa', '2023-08-26', '11:00:00', '12:30:00', 'AirAsia', 'AK505', 1100.00, 2600.00, 4000.00, 90, 30, 15),
    ('Kochi', 'Goa', '2023-08-26', '11:30:00', '13:00:00', 'IndiGo', '6E303', 1000.00, 2500.00, 3900.00, 80, 25, 12),
    ('Kochi', 'Goa', '2023-08-26', '12:15:00', '13:45:00', 'SpiceJet', 'SG404', 900.00, 2400.00, 3800.00, 70, 20, 10);

    
    


-- Hyderabad to Bengaluru
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Hyderabad', 'Bengaluru', '2023-08-25', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1500.00, 3000.00, 4500.00, 150, 50, 30),
    ('Hyderabad', 'Bengaluru', '2023-08-25', '10:00:00', '11:45:00', 'IndiGo', '6E606', 1400.00, 2900.00, 4400.00, 120, 40, 20),
    ('Hyderabad', 'Bengaluru', '2023-08-25', '10:30:00', '12:15:00', 'Vistara', 'UK505', 1300.00, 2800.00, 4300.00, 100, 35, 18);

-- Bengaluru to Hyderabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Bengaluru', 'Hyderabad', '2023-08-26', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
    ('Bengaluru', 'Hyderabad', '2023-08-26', '14:30:00', '16:15:00', 'AirAsia', 'AK808', 1300.00, 2800.00, 4200.00, 90, 30, 15),
    ('Bengaluru', 'Hyderabad', '2023-08-26', '15:00:00', '16:45:00', 'IndiGo', '6E707', 1200.00, 2700.00, 4100.00, 80, 25, 12);

-- Ahmedabad to Jaipur
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Ahmedabad', 'Jaipur', '2023-08-27', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
    ('Ahmedabad', 'Jaipur', '2023-08-27', '11:45:00', '12:45:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
    ('Ahmedabad', 'Jaipur', '2023-08-27', '12:00:00', '13:00:00', 'IndiGo', '6E404', 1000.00, 2500.00, 3800.00, 80, 20, 10);

-- Jaipur to Ahmedabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Jaipur', 'Ahmedabad', '2023-08-28', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
    ('Jaipur', 'Ahmedabad', '2023-08-28', '16:15:00', '17:15:00', 'Air India', 'AI606', 1000.00, 2500.00, 3800.00, 80, 20, 10),
    ('Jaipur', 'Ahmedabad', '2023-08-28', '16:30:00', '17:30:00', 'IndiGo', '6E303', 900.00, 2400.00, 3700.00, 70, 18, 9);

-- Lucknow to Varanasi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Lucknow', 'Varanasi', '2023-08-29', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
    ('Lucknow', 'Varanasi', '2023-08-29', '14:00:00', '15:15:00', 'IndiGo', '6E404', 800.00, 2300.00, 3500.00, 110, 35, 18),
    ('Lucknow', 'Varanasi', '2023-08-29', '14:15:00', '15:30:00', 'AirAsia', 'AK707', 700.00, 2200.00, 3400.00, 100, 30, 15);

-- Varanasi to Lucknow
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Varanasi', 'Lucknow', '2023-08-30', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
    ('Varanasi', 'Lucknow', '2023-08-30', '10:45:00', '12:00:00', 'GoAir', 'G808', 850.00, 2400.00, 3600.00, 90, 30, 15),
    ('Varanasi', 'Lucknow', '2023-08-30', '11:00:00', '12:15:00', 'AirAsia', 'AK606', 750.00, 2300.00, 3500.00, 80, 25, 12);

-- Mumbai to Delhi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Mumbai', 'Delhi', '2023-08-31', '10:00:00', '12:00:00', 'IndiGo', '6E101', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Mumbai', 'Delhi', '2023-08-31', '10:15:00', '12:15:00', 'Air India', 'AI202', 1900.00, 3400.00, 4900.00, 90, 18, 9),
    ('Mumbai', 'Delhi', '2023-08-31', '10:30:00', '12:30:00', 'SpiceJet', 'SG303', 1800.00, 3300.00, 4800.00, 80, 15, 8);

-- Delhi to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Delhi', 'Mumbai', '2023-09-01', '14:00:00', '16:00:00', 'Air India', 'AI202', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Delhi', 'Mumbai', '2023-09-01', '14:15:00', '16:15:00', 'IndiGo', '6E303', 1700.00, 3100.00, 4700.00, 70, 25, 12),
    ('Delhi', 'Mumbai', '2023-09-01', '14:30:00', '16:30:00', 'SpiceJet', 'SG606', 1600.00, 3000.00, 4600.00, 60, 20, 10);

-- Kolkata to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Kolkata', 'Chennai', '2023-09-02', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
    ('Kolkata', 'Chennai', '2023-09-02', '12:45:00', '14:45:00', 'AirAsia', 'AK808', 1400.00, 2900.00, 4400.00, 110, 35, 18),
    ('Kolkata', 'Chennai', '2023-09-02', '13:00:00', '15:00:00', 'GoAir', 'G707', 1300.00, 2800.00, 4300.00, 100, 30, 15);

-- Chennai to Kolkata
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Chennai', 'Kolkata', '2023-09-03', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
    ('Chennai', 'Kolkata', '2023-09-03', '08:45:00', '10:45:00', 'IndiGo', '6E606', 1600.00, 3100.00, 4700.00, 80, 20, 10),
    ('Chennai', 'Kolkata', '2023-09-03', '09:00:00', '11:00:00', 'SpiceJet', 'SG909', 1500.00, 3000.00, 4600.00, 70, 18, 9);

-- Hyderabad to Bengaluru
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Hyderabad', 'Bengaluru', '2023-09-04', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
    ('Hyderabad', 'Bengaluru', '2023-09-04', '10:00:00', '11:45:00', 'IndiGo', '6E606', 1200.00, 2700.00, 4100.00, 140, 45, 25),
    ('Hyderabad', 'Bengaluru', '2023-09-04', '10:30:00', '12:15:00', 'Vistara', 'UK505', 1100.00, 2600.00, 4000.00, 130, 40, 20);

-- Bengaluru to Hyderabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('Bengaluru', 'Hyderabad', '2023-09-05', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
    ('Bengaluru', 'Hyderabad', '2023-09-05', '14:30:00', '16:15:00', 'AirAsia', 'AK808', 1300.00, 2800.00, 4200.00, 100, 30, 15),
    ('Bengaluru', 'Hyderabad', '2023-09-05', '14:45:00', '16:30:00', 'IndiGo', '6E707', 1200.00, 2700.00, 4100.00, 90, 25, 12);

    
    -- Ahmedabad to Jaipur
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Ahmedabad', 'Jaipur', '2023-09-06', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
('Ahmedabad', 'Jaipur', '2023-09-06', '11:45:00', '12:45:00', 'SpiceJet', 'SG202', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Ahmedabad', 'Jaipur', '2023-09-06', '12:00:00', '13:00:00', 'IndiGo', '6E303', 1000.00, 2500.00, 3800.00, 80, 20, 10);

-- Jaipur to Ahmedabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Jaipur', 'Ahmedabad', '2023-09-07', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Jaipur', 'Ahmedabad', '2023-09-07', '16:15:00', '17:15:00', 'Air India', 'AI404', 1000.00, 2500.00, 3800.00, 80, 20, 10),
('Jaipur', 'Ahmedabad', '2023-09-07', '16:30:00', '17:30:00', 'IndiGo', '6E707', 900.00, 2400.00, 3700.00, 70, 18, 9);

-- Lucknow to Varanasi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Lucknow', 'Varanasi', '2023-09-08', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
('Lucknow', 'Varanasi', '2023-09-08', '14:00:00', '15:15:00', 'IndiGo', '6E808', 800.00, 2300.00, 3500.00, 110, 35, 18),
('Lucknow', 'Varanasi', '2023-09-08', '14:15:00', '15:30:00', 'Vistara', 'UK505', 700.00, 2200.00, 3400.00, 100, 30, 15);

-- Varanasi to Lucknow
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Varanasi', 'Lucknow', '2023-09-09', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
('Varanasi', 'Lucknow', '2023-09-09', '10:45:00', '12:00:00', 'GoAir', 'G909', 850.00, 2400.00, 3600.00, 90, 30, 15),
('Varanasi', 'Lucknow', '2023-09-09', '11:00:00', '12:15:00', 'Vistara', 'UK606', 750.00, 2300.00, 3500.00, 80, 25, 12);

-- Mumbai to Kolkata
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Mumbai', 'Kolkata', '2023-09-10', '09:00:00', '12:00:00', 'Vistara', 'UK101', 2200.00, 3800.00, 5500.00, 100, 20, 10),
('Mumbai', 'Kolkata', '2023-09-10', '09:15:00', '12:15:00', 'IndiGo', '6E202', 2000.00, 3500.00, 5000.00, 90, 18, 9),
('Mumbai', 'Kolkata', '2023-09-10', '09:30:00', '12:30:00', 'Air India', 'AI909', 1800.00, 3400.00, 4800.00, 80, 15, 8);

-- Kolkata to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Kolkata', 'Mumbai', '2023-09-11', '14:00:00', '17:00:00', 'IndiGo', '6E202', 2000.00, 3500.00, 5000.00, 80, 30, 15),
('Kolkata', 'Mumbai', '2023-09-11', '14:15:00', '17:15:00', 'Air India', 'AI606', 1800.00, 3400.00, 4800.00, 70, 25, 12),
('Kolkata', 'Mumbai', '2023-09-11', '14:30:00', '17:30:00', 'Vistara', 'UK404', 1600.00, 3300.00, 4600.00, 60, 20, 10);

-- Delhi to Chennai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Delhi', 'Chennai', '2023-09-12', '12:30:00', '15:30:00', 'SpiceJet', 'SG303', 1800.00, 3200.00, 4800.00, 120, 40, 20),
('Delhi', 'Chennai', '2023-09-12', '12:45:00', '15:45:00', 'GoAir', 'G606', 1700.00, 3100.00, 4700.00, 110, 35, 18),
('Delhi', 'Chennai', '2023-09-12', '13:00:00', '16:00:00', 'Vistara', 'UK808', 1600.00, 3000.00, 4600.00, 100, 30, 15);

-- Chennai to Delhi
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Chennai', 'Delhi', '2023-09-13', '08:30:00', '11:30:00', 'GoAir', 'G411', 1700.00, 3200.00, 4800.00, 90, 25, 12),
('Chennai', 'Delhi', '2023-09-13', '08:45:00', '11:45:00', 'IndiGo', '6E303', 1600.00, 3100.00, 4700.00, 80, 20, 10),
('Chennai', 'Delhi', '2023-09-13', '09:00:00', '12:00:00', 'SpiceJet', 'SG808', 1500.00, 3000.00, 4600.00, 70, 18, 9);

-- Hyderabad to Bengaluru
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Hyderabad', 'Bengaluru', '2023-09-14', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1500.00, 3000.00, 4500.00, 150, 50, 30),
('Hyderabad', 'Bengaluru', '2023-09-14', '10:00:00', '11:45:00', 'IndiGo', '6E808', 1400.00, 2900.00, 4400.00, 140, 45, 28),
('Hyderabad', 'Bengaluru', '2023-09-14', '10:15:00', '12:00:00', 'Vistara', 'UK909', 1300.00, 2800.00, 4300.00, 130, 40, 25);

-- Bengaluru to Hyderabad
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
('Bengaluru', 'Hyderabad', '2023-09-15', '15:30:00', '17:15:00', 'IndiGo', '6E707', 1400.00, 2900.00, 4400.00, 130, 45, 28),
('Bengaluru', 'Hyderabad', '2023-09-15', '15:45:00', '17:30:00', 'AirAsia', 'AK303', 1300.00, 2800.00, 4300.00, 120, 40, 25),
('Bengaluru', 'Hyderabad', '2023-09-15', '16:00:00', '17:45:00', 'Vistara', 'UK505', 1200.00, 2700.00, 4200.00, 110, 35, 22);


    
    INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
-- Kolkata to Chennai
('Kolkata', 'Chennai', '2023-09-22', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
('Kolkata', 'Chennai', '2023-09-22', '14:45:00', '16:45:00', 'IndiGo', '6E707', 1400.00, 2900.00, 4400.00, 130, 45, 28),
('Kolkata', 'Chennai', '2023-09-22', '17:00:00', '19:00:00', 'AirAsia', 'AK303', 1300.00, 2800.00, 4300.00, 120, 40, 25),

-- Chennai to Kolkata
('Chennai', 'Kolkata', '2023-09-23', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
('Chennai', 'Kolkata', '2023-09-23', '10:45:00', '12:45:00', 'IndiGo', '6E909', 1600.00, 3100.00, 4700.00, 100, 30, 18),
('Chennai', 'Kolkata', '2023-09-23', '13:00:00', '15:00:00', 'Vistara', 'UK707', 1500.00, 3000.00, 4600.00, 110, 35, 22),

-- Hyderabad to Bengaluru
('Hyderabad', 'Bengaluru', '2023-09-24', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
('Hyderabad', 'Bengaluru', '2023-09-24', '11:45:00', '13:30:00', 'Vistara', 'UK505', 1200.00, 2700.00, 4100.00, 140, 48, 27),
('Hyderabad', 'Bengaluru', '2023-09-24', '13:45:00', '15:30:00', 'SpiceJet', 'SG909', 1100.00, 2600.00, 4000.00, 130, 45, 25),

-- Bengaluru to Hyderabad
('Bengaluru', 'Hyderabad', '2023-09-25', '14:15:00', '16:00:00', 'Vistara', 'UK909', 1400.00, 2900.00, 4300.00, 110, 35, 18),
('Bengaluru', 'Hyderabad', '2023-09-25', '16:15:00', '18:00:00', 'AirAsia', 'AK303', 1300.00, 2800.00, 4200.00, 120, 40, 22),
('Bengaluru', 'Hyderabad', '2023-09-25', '18:15:00', '20:00:00', 'IndiGo', '6E707', 1200.00, 2700.00, 4100.00, 130, 45, 25),

-- Ahmedabad to Jaipur
('Ahmedabad', 'Jaipur', '2023-09-26', '11:30:00', '12:30:00', 'Air India', 'AI303', 1200.00, 2700.00, 4000.00, 100, 30, 15),
('Ahmedabad', 'Jaipur', '2023-09-26', '12:45:00', '13:45:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Ahmedabad', 'Jaipur', '2023-09-26', '14:00:00', '15:00:00', 'IndiGo', '6E909', 1000.00, 2500.00, 3800.00, 80, 20, 10),

-- Jaipur to Ahmedabad
('Jaipur', 'Ahmedabad', '2023-09-27', '16:00:00', '17:00:00', 'SpiceJet', 'SG505', 1100.00, 2600.00, 3900.00, 90, 25, 12),
('Jaipur', 'Ahmedabad', '2023-09-27', '17:15:00', '18:15:00', 'Air India', 'AI707', 1000.00, 2500.00, 3800.00, 80, 20, 10),
('Jaipur', 'Ahmedabad', '2023-09-27', '18:30:00', '19:30:00', 'IndiGo', '6E505', 900.00, 2400.00, 3700.00, 70, 15, 8),

-- Lucknow to Varanasi
('Lucknow', 'Varanasi', '2023-09-28', '13:45:00', '15:00:00', 'GoAir', 'G656', 900.00, 2400.00, 3600.00, 120, 40, 20),
('Lucknow', 'Varanasi', '2023-09-28', '15:15:00', '16:30:00', 'IndiGo', '6E707', 800.00, 2300.00, 3500.00, 110, 35, 18),
('Lucknow', 'Varanasi', '2023-09-28', '16:45:00', '18:00:00', 'SpiceJet', 'SG909', 700.00, 2200.00, 3400.00, 100, 30, 15),

-- Varanasi to Lucknow
('Varanasi', 'Lucknow', '2023-09-29', '10:30:00', '11:45:00', 'IndiGo', '6E707', 950.00, 2500.00, 3700.00, 100, 35, 18),
('Varanasi', 'Lucknow', '2023-09-29', '12:00:00', '13:15:00', 'GoAir', 'G656', 850.00, 2400.00, 3600.00, 90, 30, 15),
('Varanasi', 'Lucknow', '2023-09-29', '13:30:00', '14:45:00', 'Air India', 'AI909', 750.00, 2300.00, 3500.00, 80, 25, 12),

-- Mumbai to Kolkata
('Mumbai', 'Kolkata', '2023-09-30', '09:00:00', '12:00:00', 'Vistara', 'UK101', 2200.00, 3800.00, 5500.00, 100, 20, 10),
('Mumbai', 'Kolkata', '2023-09-30', '12:15:00', '15:15:00', 'AirAsia', 'AK303', 2100.00, 3700.00, 5400.00, 90, 18, 8),
('Mumbai', 'Kolkata', '2023-09-30', '15:30:00', '18:30:00', 'IndiGo', '6E707', 2000.00, 3600.00, 5300.00, 80, 16, 6),

-- Kolkata to Mumbai
('Kolkata', 'Mumbai', '2023-10-01', '14:00:00', '17:00:00', 'IndiGo', '6E202', 2000.00, 3500.00, 5000.00, 80, 30, 15),
('Kolkata', 'Mumbai', '2023-10-01', '17:15:00', '20:15:00', 'Vistara', 'UK303', 1900.00, 3400.00, 4900.00, 90, 35, 18),
('Kolkata', 'Mumbai', '2023-10-01', '20:30:00', '23:30:00', 'AirAsia', 'AK505', 1800.00, 3300.00, 4800.00, 100, 40, 20),

-- Delhi to Chennai
('Delhi', 'Chennai', '2023-10-02', '12:30:00', '15:30:00', 'SpiceJet', 'SG303', 1800.00, 3200.00, 4800.00, 120, 40, 20),
('Delhi', 'Chennai', '2023-10-02', '15:45:00', '18:45:00', 'GoAir', 'G707', 1700.00, 3100.00, 4700.00, 110, 35, 18),
('Delhi', 'Chennai', '2023-10-02', '19:00:00', '22:00:00', 'AirAsia', 'AK303', 1600.00, 3000.00, 4600.00, 100, 30, 15),

-- Chennai to Delhi
('Chennai', 'Delhi', '2023-10-03', '13:00:00', '16:00:00', 'IndiGo', '6E101', 2200.00, 3800.00, 5500.00, 130, 45, 25),
('Chennai', 'Delhi', '2023-10-03', '16:15:00', '19:15:00', 'Vistara', 'UK505', 2100.00, 3700.00, 5400.00, 120, 40, 22),
('Chennai', 'Delhi', '2023-10-03', '19:30:00', '22:30:00', 'GoAir', 'G707', 2000.00, 3600.00, 5300.00, 110, 35, 20);


    
    
    
    
    
    -- Internation Flights Data --
    
    
    -- Delhi to London
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Delhi', 'London', '2023-08-22', '09:00:00', '14:00:00', 'Air India', 'AI101', 18000.00, 30000.00, 40000.00, 200, 50, 20),
('Delhi', 'London', '2023-08-22', '10:00:00', '15:00:00', 'Emirates', 'EK202', 20000.00, 32000.00, 42000.00, 180, 45, 18),
('Delhi', 'London', '2023-08-22', '11:00:00', '16:00:00', 'British Airways', 'BA303', 19000.00, 31000.00, 41000.00, 190, 48, 22);

-- London to New York
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('London', 'New York', '2023-08-23', '15:00:00', '18:00:00', 'British Airways', 'BA234', 22000.00, 35000.00, 50000.00, 150, 30, 10),
('London', 'New York', '2023-08-23', '16:00:00', '19:00:00', 'Delta Air Lines', 'DL345', 24000.00, 37000.00, 52000.00, 140, 35, 15),
('London', 'New York', '2023-08-23', '17:00:00', '20:00:00', 'American Airlines', 'AA456', 23000.00, 36000.00, 51000.00, 160, 40, 20);

-- Dubai to Sydney
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Dubai', 'Sydney', '2023-08-24', '10:30:00', '22:00:00', 'Emirates', 'EK567', 25000.00, 40000.00, 60000.00, 300, 60, 30),
('Dubai', 'Sydney', '2023-08-24', '11:30:00', '23:00:00', 'Qantas', 'QF678', 26000.00, 41000.00, 61000.00, 280, 55, 28),
('Dubai', 'Sydney', '2023-08-24', '12:30:00', '00:00:00', 'Etihad Airways', 'EY789', 24000.00, 39000.00, 59000.00, 320, 65, 35);

-- Frankfurt to Tokyo
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Frankfurt', 'Tokyo', '2023-08-25', '11:00:00', '06:00:00', 'Lufthansa', 'LH321', 20000.00, 35000.00, 50000.00, 180, 40, 15),
('Frankfurt', 'Tokyo', '2023-08-25', '12:00:00', '07:00:00', 'Japan Airlines', 'JL432', 22000.00, 37000.00, 52000.00, 160, 35, 12),
('Frankfurt', 'Tokyo', '2023-08-25', '13:00:00', '08:00:00', 'All Nippon Airways', 'NH543', 21000.00, 36000.00, 51000.00, 170, 38, 18);

-- Doha to Singapore
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Doha', 'Singapore', '2023-08-26', '14:30:00', '23:30:00', 'Qatar Airways', 'QR456', 18000.00, 32000.00, 45000.00, 200, 50, 20),
('Doha', 'Singapore', '2023-08-26', '15:30:00', '00:30:00', 'Singapore Airlines', 'SQ567', 20000.00, 35000.00, 48000.00, 180, 45, 18),
('Doha', 'Singapore', '2023-08-26', '16:30:00', '01:30:00', 'Cathay Pacific', 'CX678', 19000.00, 33000.00, 46000.00, 190, 48, 22);

-- Paris to Los Angeles
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Paris', 'Los Angeles', '2023-08-27', '09:45:00', '15:30:00', 'Air France', 'AF789', 22000.00, 38000.00, 55000.00, 180, 40, 15),
('Paris', 'Los Angeles', '2023-08-27', '10:45:00', '16:30:00', 'Delta Air Lines', 'DL890', 24000.00, 40000.00, 57000.00, 160, 35, 12),
('Paris', 'Los Angeles', '2023-08-27', '11:45:00', '17:30:00', 'United Airlines', 'UA901', 23000.00, 39000.00, 56000.00, 170, 38, 18);

-- Singapore to Sydney
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Singapore', 'Sydney', '2023-08-28', '10:15:00', '18:00:00', 'Singapore Airlines', 'SQ987', 19000.00, 33000.00, 47000.00, 160, 35, 12),
('Singapore', 'Sydney', '2023-08-28', '11:15:00', '19:00:00', 'Qantas', 'QF678', 21000.00, 36000.00, 49000.00, 140, 30, 10),
('Singapore', 'Sydney', '2023-08-28', '12:15:00', '20:00:00', 'Virgin Australia', 'VA789', 20000.00, 35000.00, 48000.00, 150, 33, 15);

-- Tokyo to Seoul
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Tokyo', 'Seoul', '2023-08-29', '12:30:00', '14:30:00', 'Korean Air', 'KE123', 15000.00, 28000.00, 42000.00, 220, 55, 25),
('Tokyo', 'Seoul', '2023-08-29', '13:30:00', '15:30:00', 'Asiana Airlines', 'OZ234', 16000.00, 29000.00, 43000.00, 200, 50, 20),
('Tokyo', 'Seoul', '2023-08-29', '14:30:00', '16:30:00', 'Japan Airlines', 'JL345', 15500.00, 28500.00, 42500.00, 210, 53, 23);

-- New York to Toronto
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('New York', 'Toronto', '2023-08-30', '08:00:00', '10:00:00', 'Air Canada', 'AC456', 12000.00, 24000.00, 36000.00, 250, 60, 30),
('New York', 'Toronto', '2023-08-30', '09:00:00', '11:00:00', 'WestJet', 'WS567', 13000.00, 25000.00, 37000.00, 230, 55, 25),
('New York', 'Toronto', '2023-08-30', '10:00:00', '12:00:00', 'American Airlines', 'AA678', 12500.00, 24500.00, 36500.00, 240, 58, 28);

-- Sydney to Melbourne
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Sydney', 'Melbourne', '2023-08-31', '14:15:00', '16:00:00', 'Qantas', 'QF123', 8000.00, 18000.00, 28000.00, 280, 65, 35),
('Sydney', 'Melbourne', '2023-08-31', '15:15:00', '17:00:00', 'Virgin Australia', 'VA234', 8500.00, 18500.00, 28500.00, 260, 60, 30),
('Sydney', 'Melbourne', '2023-08-31', '16:15:00', '18:00:00', 'Jetstar', 'JQ345', 8200.00, 18200.00, 28200.00, 270, 63, 33);


-- Los Angeles to San Francisco
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Los Angeles', 'San Francisco', '2023-08-10', '11:15:00', '12:30:00', 'United Airlines', 'UA789', 9000.00, 18000.00, 27000.00, 200, 50, 20),
('Los Angeles', 'San Francisco', '2023-08-10', '12:15:00', '13:30:00', 'American Airlines', 'AA234', 8500.00, 17500.00, 26500.00, 180, 40, 15),
('Los Angeles', 'San Francisco', '2023-08-10', '13:15:00', '14:30:00', 'Southwest Airlines', 'WN345', 8200.00, 17200.00, 26200.00, 190, 43, 18);

-- Beijing to Shanghai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Beijing', 'Shanghai', '2023-08-11', '13:30:00', '15:30:00', 'China Eastern Airlines', 'MU456', 10000.00, 20000.00, 30000.00, 180, 40, 15),
('Beijing', 'Shanghai', '2023-08-11', '14:30:00', '16:30:00', 'Air China', 'CA567', 10500.00, 20500.00, 30500.00, 170, 38, 18),
('Beijing', 'Shanghai', '2023-08-11', '15:30:00', '17:30:00', 'Hainan Airlines', 'HU678', 10200.00, 20200.00, 30200.00, 175, 39, 17);

-- Delhi to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Delhi', 'Mumbai', '2023-08-12', '16:00:00', '18:00:00', 'IndiGo', '6E202', 7000.00, 14000.00, 21000.00, 250, 60, 30),
('Delhi', 'Mumbai', '2023-08-12', '17:00:00', '19:00:00', 'Air India', 'AI345', 7500.00, 14500.00, 21500.00, 240, 58, 28),
('Delhi', 'Mumbai', '2023-08-12', '18:00:00', '20:00:00', 'Vistara', 'UK456', 7200.00, 14200.00, 21200.00, 245, 59, 27);

-- London to Dubai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('London', 'Dubai', '2023-08-13', '10:30:00', '16:00:00', 'Emirates', 'EK789', 15000.00, 28000.00, 42000.00, 200, 50, 20),
('London', 'Dubai', '2023-08-13', '11:30:00', '17:00:00', 'British Airways', 'BA234', 15500.00, 28500.00, 42500.00, 190, 48, 18),
('London', 'Dubai', '2023-08-13', '12:30:00', '18:00:00', 'Qantas', 'QF345', 15200.00, 28200.00, 42200.00, 195, 49, 19);

-- Tokyo to Hong Kong
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Tokyo', 'Hong Kong', '2023-08-14', '12:45:00', '15:00:00', 'Japan Airlines', 'JL789', 13000.00, 25000.00, 37000.00, 220, 55, 25),
('Tokyo', 'Hong Kong', '2023-08-14', '13:45:00', '16:00:00', 'Cathay Pacific', 'CX123', 13500.00, 25500.00, 37500.00, 210, 53, 23),
('Tokyo', 'Hong Kong', '2023-08-14', '14:45:00', '17:00:00', 'Hong Kong Airlines', 'HX234', 13200.00, 25200.00, 37200.00, 215, 54, 24);

-- New York to Chicago
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('New York', 'Chicago', '2023-08-15', '09:00:00', '11:00:00', 'American Airlines', 'AA456', 8000.00, 16000.00, 24000.00, 200, 50, 20),
('New York', 'Chicago', '2023-08-15', '10:00:00', '12:00:00', 'United Airlines', 'UA567', 8500.00, 16500.00, 24500.00, 190, 48, 18),
('New York', 'Chicago', '2023-08-15', '11:00:00', '13:00:00', 'Delta Air Lines', 'DL678', 8200.00, 16200.00, 24200.00, 195, 49, 19);

-- Dubai to Bangkok
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Dubai', 'Bangkok', '2023-08-16', '11:30:00', '16:00:00', 'Emirates', 'EK123', 17000.00, 32000.00, 48000.00, 180, 40, 15),
('Dubai', 'Bangkok', '2023-08-16', '12:30:00', '17:00:00', 'Thai Airways', 'TG234', 17500.00, 32500.00, 48500.00, 170, 38, 14),
('Dubai', 'Bangkok', '2023-08-16', '13:30:00', '18:00:00', 'Qatar Airways', 'QR345', 17200.00, 32200.00, 48200.00, 175, 39, 15);

-- Paris to Madrid
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Paris', 'Madrid', '2023-08-17', '14:15:00', '16:00:00', 'Air France', 'AF202', 10000.00, 20000.00, 30000.00, 180, 40, 15),
('Paris', 'Madrid', '2023-08-17', '15:15:00', '17:00:00', 'Iberia', 'IB567', 10500.00, 20500.00, 30500.00, 170, 38, 14),
('Paris', 'Madrid', '2023-08-17', '16:15:00', '18:00:00', 'Ryanair', 'FR678', 10200.00, 20200.00, 30200.00, 175, 39, 15);

-- Singapore to Kuala Lumpur
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Singapore', 'Kuala Lumpur', '2023-08-18', '08:45:00', '10:00:00', 'Singapore Airlines', 'SQ456', 7000.00, 14000.00, 21000.00, 250, 60, 30),
('Singapore', 'Kuala Lumpur', '2023-08-18', '09:45:00', '11:00:00', 'Malaysia Airlines', 'MH789', 7500.00, 14500.00, 21500.00, 240, 58, 28),
('Singapore', 'Kuala Lumpur', '2023-08-18', '10:45:00', '12:00:00', 'AirAsia', 'AK123', 7200.00, 14200.00, 21200.00, 245, 59, 27);

-- Sydney to Brisbane
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Sydney', 'Brisbane', '2023-08-19', '11:15:00', '12:30:00', 'Qantas', 'QF789', 6000.00, 12000.00, 18000.00, 200, 50, 20),
('Sydney', 'Brisbane', '2023-08-19', '12:15:00', '13:30:00', 'Virgin Australia', 'VA234', 5500.00, 11500.00, 17500.00, 190, 48, 18),
('Sydney', 'Brisbane', '2023-08-19', '13:15:00', '14:30:00', 'Jetstar', 'JQ345', 5200.00, 11200.00, 17200.00, 195, 49, 19);

-- Los Angeles to Las Vegas
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Los Angeles', 'Las Vegas', '2023-08-20', '13:30:00', '14:30:00', 'Southwest Airlines', 'WN123', 5000.00, 10000.00, 15000.00, 180, 40, 15),
('Los Angeles', 'Las Vegas', '2023-08-20', '14:30:00', '15:30:00', 'Delta Air Lines', 'DL234', 5500.00, 10500.00, 15500.00, 170, 38, 14),
('Los Angeles', 'Las Vegas', '2023-08-20', '15:30:00', '16:30:00', 'American Airlines', 'AA345', 5200.00, 10200.00, 15200.00, 175, 39, 15);




-- Delhi to Mumbai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Delhi', 'Mumbai', '2023-08-21', '16:00:00', '18:00:00', 'Air India', 'AI202', 7000.00, 14000.00, 21000.00, 250, 60, 30),
('Delhi', 'Mumbai', '2023-08-21', '17:00:00', '19:00:00', 'IndiGo', '6E345', 7500.00, 14500.00, 21500.00, 240, 58, 28),
('Delhi', 'Mumbai', '2023-08-21', '18:00:00', '20:00:00', 'SpiceJet', 'SG456', 7200.00, 14200.00, 21200.00, 245, 59, 27);

-- London to Dubai
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('London', 'Dubai', '2023-08-22', '10:30:00', '16:00:00', 'Emirates', 'EK789', 15000.00, 28000.00, 42000.00, 200, 50, 20),
('London', 'Dubai', '2023-08-22', '11:30:00', '17:00:00', 'British Airways', 'BA234', 15500.00, 28500.00, 42500.00, 190, 48, 18),
('London', 'Dubai', '2023-08-22', '12:30:00', '18:00:00', 'Qatar Airways', 'QR345', 15200.00, 28200.00, 42200.00, 195, 49, 19);

-- Tokyo to Hong Kong
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Tokyo', 'Hong Kong', '2023-08-23', '12:45:00', '15:00:00', 'Japan Airlines', 'JL789', 13000.00, 25000.00, 37000.00, 220, 55, 25),
('Tokyo', 'Hong Kong', '2023-08-23', '13:45:00', '16:00:00', 'Cathay Pacific', 'CX234', 13500.00, 25500.00, 37500.00, 210, 53, 23),
('Tokyo', 'Hong Kong', '2023-08-23', '14:45:00', '17:00:00', 'All Nippon Airways', 'NH345', 13200.00, 25200.00, 37200.00, 215, 54, 24);

-- New York to Chicago
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('New York', 'Chicago', '2023-08-24', '09:00:00', '11:00:00', 'American Airlines', 'AA456', 8000.00, 16000.00, 24000.00, 200, 50, 20),
('New York', 'Chicago', '2023-08-24', '10:00:00', '12:00:00', 'United Airlines', 'UA234', 8500.00, 16500.00, 24500.00, 190, 48, 18),
('New York', 'Chicago', '2023-08-24', '11:00:00', '13:00:00', 'Delta Air Lines', 'DL345', 8200.00, 16200.00, 24200.00, 195, 49, 19);

-- Dubai to Bangkok
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Dubai', 'Bangkok', '2023-08-25', '11:30:00', '16:00:00', 'Emirates', 'EK123', 17000.00, 32000.00, 48000.00, 180, 40, 15),
('Dubai', 'Bangkok', '2023-08-25', '12:30:00', '17:00:00', 'Thai Airways', 'TG234', 17500.00, 32500.00, 48500.00, 170, 38, 14),
('Dubai', 'Bangkok', '2023-08-25', '13:30:00', '18:00:00', 'Qatar Airways', 'QR345', 17200.00, 32200.00, 48200.00, 175, 39, 15);

-- Paris to Madrid
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Paris', 'Madrid', '2023-08-26', '14:15:00', '16:00:00', 'Air France', 'AF202', 10000.00, 20000.00, 30000.00, 180, 40, 15),
('Paris', 'Madrid', '2023-08-26', '15:15:00', '17:00:00', 'Iberia', 'IB234', 10500.00, 20500.00, 30500.00, 170, 38, 14),
('Paris', 'Madrid', '2023-08-26', '16:15:00', '18:00:00', 'Air Europa', 'UX345', 10200.00, 20200.00, 30200.00, 175, 39, 15);

-- Singapore to Kuala Lumpur
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Singapore', 'Kuala Lumpur', '2023-08-27', '08:45:00', '10:00:00', 'Singapore Airlines', 'SQ456', 7000.00, 14000.00, 21000.00, 250, 60, 30),
('Singapore', 'Kuala Lumpur', '2023-08-27', '09:45:00', '11:00:00', 'Malaysia Airlines', 'MH234', 7500.00, 14500.00, 21500.00, 240, 58, 28),
('Singapore', 'Kuala Lumpur', '2023-08-27', '10:45:00', '12:00:00', 'AirAsia', 'AK345', 7200.00, 14200.00, 21200.00, 245, 59, 27);

-- Sydney to Brisbane
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Sydney', 'Brisbane', '2023-08-28', '11:15:00', '12:30:00', 'Qantas', 'QF789', 6000.00, 12000.00, 18000.00, 200, 50, 20),
('Sydney', 'Brisbane', '2023-08-28', '12:15:00', '13:30:00', 'Virgin Australia', 'VA234', 6500.00, 12500.00, 18500.00, 190, 48, 18),
('Sydney', 'Brisbane', '2023-08-28', '13:15:00', '14:30:00', 'Jetstar', 'JQ345', 6200.00, 12200.00, 18200.00, 195, 49, 19);

-- Los Angeles to Las Vegas
INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES ('Los Angeles', 'Las Vegas', '2023-08-29', '13:30:00', '14:30:00', 'Southwest Airlines', 'WN123', 5000.00, 10000.00, 15000.00, 180, 40, 15),
('Los Angeles', 'Las Vegas', '2023-08-29', '14:30:00', '15:30:00', 'Delta Air Lines', 'DL234', 5500.00, 10500.00, 15500.00, 170, 38, 14),
('Los Angeles', 'Las Vegas', '2023-08-29', '15:30:00', '16:30:00', 'American Airlines', 'AA345', 5200.00, 10200.00, 15200.00, 175, 39, 15);
    
-- Mix of national and international flights --


INSERT INTO Flights (DepartureCity, DestinationCity, DepartureDate, DepartureTime, ArrivalTime, Airlines, FlightNumber, EconomyPrice, BusinessPrice, PremiumPrice, EconomyAvailableSeats, BusinessAvailableSeats, PremiumAvailableSeats)
VALUES
    ('London', 'Delhi', '2023-08-22', '10:00:00', '16:00:00', 'Air India', 'AI101', 15000.00, 28000.00, 42000.00, 200, 50, 20),
    ('Dubai', 'Mumbai', '2023-08-23', '14:00:00', '18:00:00', 'Emirates', 'EK202', 13000.00, 25000.00, 37000.00, 180, 40, 15),
    ('Bangkok', 'Chennai', '2023-08-24', '12:30:00', '16:30:00', 'Thai Airways', 'TG303', 12000.00, 24000.00, 36000.00, 180, 40, 15),
    ('Singapore', 'Kolkata', '2023-08-25', '08:30:00', '12:30:00', 'Singapore Airlines', 'SQ811', 14000.00, 26000.00, 39000.00, 220, 55, 25),
    ('Sydney', 'Hyderabad', '2023-08-26', '09:45:00', '18:00:00', 'Qantas', 'QF707', 18000.00, 32000.00, 48000.00, 200, 50, 20),
    ('London', 'Mumbai', '2023-08-27', '16:00:00', '18:00:00', 'Air India', 'AI202', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Dubai', 'Delhi', '2023-08-28', '14:00:00', '16:00:00', 'IndiGo', '6E101', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Bangkok', 'Kolkata', '2023-08-29', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
    ('Singapore', 'Chennai', '2023-08-30', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
    ('Sydney', 'Hyderabad', '2023-08-31', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
    ('London', 'Delhi', '2023-09-01', '10:00:00', '16:00:00', 'Air India', 'AI101', 15000.00, 28000.00, 42000.00, 200, 50, 20),
    ('Dubai', 'Mumbai', '2023-09-02', '14:00:00', '18:00:00', 'Emirates', 'EK202', 13000.00, 25000.00, 37000.00, 180, 40, 15),
    ('Bangkok', 'Chennai', '2023-09-03', '12:30:00', '16:30:00', 'Thai Airways', 'TG303', 12000.00, 24000.00, 36000.00, 180, 40, 15),
    ('Singapore', 'Kolkata', '2023-09-04', '08:30:00', '12:30:00', 'Singapore Airlines', 'SQ811', 14000.00, 26000.00, 39000.00, 220, 55, 25),
    ('Sydney', 'Hyderabad', '2023-09-05', '09:45:00', '18:00:00', 'Qantas', 'QF707', 18000.00, 32000.00, 48000.00, 200, 50, 20),
    ('London', 'Mumbai', '2023-09-06', '16:00:00', '18:00:00', 'Air India', 'AI202', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Dubai', 'Delhi', '2023-09-07', '14:00:00', '16:00:00', 'IndiGo', '6E101', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Bangkok', 'Kolkata', '2023-09-08', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
    ('Singapore', 'Chennai', '2023-09-09', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
    ('Sydney', 'Hyderabad', '2023-09-10', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
    ('London', 'Delhi', '2023-09-11', '10:00:00', '16:00:00', 'Air India', 'AI101', 15000.00, 28000.00, 42000.00, 200, 50, 20),
    ('Dubai', 'Mumbai', '2023-09-12', '14:00:00', '18:00:00', 'Emirates', 'EK202', 13000.00, 25000.00, 37000.00, 180, 40, 15),
    ('Bangkok', 'Chennai', '2023-09-13', '12:30:00', '16:30:00', 'Thai Airways', 'TG303', 12000.00, 24000.00, 36000.00, 180, 40, 15),
    ('Singapore', 'Kolkata', '2023-09-14', '08:30:00', '12:30:00', 'Singapore Airlines', 'SQ811', 14000.00, 26000.00, 39000.00, 220, 55, 25),
    ('Sydney', 'Hyderabad', '2023-09-15', '09:45:00', '18:00:00', 'Qantas', 'QF707', 18000.00, 32000.00, 48000.00, 200, 50, 20),
    ('London', 'Mumbai', '2023-09-16', '16:00:00', '18:00:00', 'Air India', 'AI202', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Dubai', 'Delhi', '2023-09-17', '14:00:00', '16:00:00', 'IndiGo', '6E101', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Bangkok', 'Kolkata', '2023-09-18', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
    ('Singapore', 'Chennai', '2023-09-19', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
    ('Sydney', 'Hyderabad', '2023-09-20', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
    ('London', 'Delhi', '2023-09-21', '10:00:00', '16:00:00', 'Air India', 'AI101', 15000.00, 28000.00, 42000.00, 200, 50, 20),
    ('Dubai', 'Mumbai', '2023-09-22', '14:00:00', '18:00:00', 'Emirates', 'EK202', 13000.00, 25000.00, 37000.00, 180, 40, 15),
    ('Bangkok', 'Chennai', '2023-09-23', '12:30:00', '16:30:00', 'Thai Airways', 'TG303', 12000.00, 24000.00, 36000.00, 180, 40, 15),
    ('Singapore', 'Kolkata', '2023-09-24', '08:30:00', '12:30:00', 'Singapore Airlines', 'SQ811', 14000.00, 26000.00, 39000.00, 220, 55, 25),
    ('Sydney', 'Hyderabad', '2023-09-25', '09:45:00', '18:00:00', 'Qantas', 'QF707', 18000.00, 32000.00, 48000.00, 200, 50, 20),
    ('London', 'Mumbai', '2023-09-26', '16:00:00', '18:00:00', 'Air India', 'AI202', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Dubai', 'Delhi', '2023-09-27', '14:00:00', '16:00:00', 'IndiGo', '6E101', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Bangkok', 'Kolkata', '2023-09-28', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
    ('Singapore', 'Chennai', '2023-09-29', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
    ('Sydney', 'Hyderabad', '2023-09-30', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
    ('London', 'Delhi', '2023-09-30', '10:00:00', '16:00:00', 'Air India', 'AI101', 15000.00, 28000.00, 42000.00, 200, 50, 20),
    ('Dubai', 'Mumbai', '2023-10-01', '14:00:00', '18:00:00', 'Emirates', 'EK202', 13000.00, 25000.00, 37000.00, 180, 40, 15),
    ('Bangkok', 'Chennai', '2023-10-02', '12:30:00', '16:30:00', 'Thai Airways', 'TG303', 12000.00, 24000.00, 36000.00, 180, 40, 15),
    ('Singapore', 'Kolkata', '2023-10-03', '08:30:00', '12:30:00', 'Singapore Airlines', 'SQ811', 14000.00, 26000.00, 39000.00, 220, 55, 25),
    ('Sydney', 'Hyderabad', '2023-10-04', '09:45:00', '18:00:00', 'Qantas', 'QF707', 18000.00, 32000.00, 48000.00, 200, 50, 20),
    ('London', 'Mumbai', '2023-10-05', '16:00:00', '18:00:00', 'Air India', 'AI202', 2000.00, 3500.00, 5000.00, 100, 20, 10),
    ('Dubai', 'Delhi', '2023-10-06', '14:00:00', '16:00:00', 'IndiGo', '6E101', 1800.00, 3200.00, 4800.00, 80, 30, 15),
    ('Bangkok', 'Kolkata', '2023-10-07', '12:30:00', '14:30:00', 'SpiceJet', 'SG303', 1500.00, 3000.00, 4500.00, 120, 40, 20),
    ('Singapore', 'Chennai', '2023-10-08', '08:30:00', '10:30:00', 'GoAir', 'G811', 1700.00, 3200.00, 4800.00, 90, 25, 12),
    ('Sydney', 'Hyderabad', '2023-10-09', '09:45:00', '11:30:00', 'AirAsia', 'AK707', 1300.00, 2800.00, 4200.00, 150, 50, 30),
    ('London', 'Delhi', '2023-10-10', '10:00:00', '16:00:00', 'Air India', 'AI101', 15000.00, 28000.00, 42000.00, 200, 50, 20),
    ('Dubai', 'Mumbai', '2023-10-11', '14:00:00', '18:00:00', 'Emirates', 'EK202', 13000.00, 25000.00, 37000.00, 180, 40, 15),
    ('Bangkok', 'Chennai', '2023-10-12', '12:30:00', '16:30:00', 'Thai Airways', 'TG303', 12000.00, 24000.00, 36000.00, 180, 40, 15),
    ('Singapore', 'Kolkata', '2023-10-13', '08:30:00', '12:30:00', 'Singapore Airlines', 'SQ811', 14000.00, 26000.00, 39000.00, 220, 55, 25),
    ('Sydney', 'Hyderabad', '2023-10-14', '09:45:00', '18:00:00', 'Qantas', 'QF707', 18000.00, 32000.00, 48000.00, 200, 50, 20);

SELECT * FROM Flights;



