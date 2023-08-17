CREATE TABLE SpecialServices (
  id INT PRIMARY KEY AUTO_INCREMENT,
  bookingId VARCHAR(12) NOT NULL,
  specialBaggage VARCHAR(255),
  specialMeals VARCHAR(255),
  specialAssistance VARCHAR(255),
  reducedMobilityAssistance VARCHAR(255),
  animalTravelAssistance VARCHAR(255),
  FOREIGN KEY (bookingId) REFERENCES Bookings (bookingId)
);

/*drop table SpecialServices;*/

select * from specialservices;