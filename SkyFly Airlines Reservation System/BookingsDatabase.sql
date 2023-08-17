/*drop table bookings;*/
CREATE TABLE Bookings (
  bookingId VARCHAR(12) PRIMARY KEY,
  flightId INT,
  passengerName VARCHAR(255),
  nationality VARCHAR(255),
  passportNumber VARCHAR(255),
  dateOfExpiry DATE,
  passportIssueCountry VARCHAR(255),
  address VARCHAR(255),
  email VARCHAR(255),
  mobileNumber VARCHAR(255),
  seatSelection VARCHAR(255),
  inFlightMeal VARCHAR(255),
  
  totalPrice DECIMAL(10, 2),
  age INT,
  FOREIGN KEY (flightId) REFERENCES Flights(flightId)
);
ALTER TABLE Bookings ADD COLUMN bookingDate DATE;

ALTER TABLE Bookings ADD COLUMN bookingStatus VARCHAR(20) NOT NULL DEFAULT 'BOOKED';

alter TABLE Bookings add column cancellationReason VARCHAR(255);

ALTER TABLE Bookings ADD COLUMN classType VARCHAR(10);
ALTER TABLE Bookings ADD COLUMN seatsBooked INT;



SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select * from Bookings;