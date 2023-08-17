CREATE TABLE SignUpData (
  ID INT AUTO_INCREMENT,
  NAME VARCHAR(50) NOT NULL,
  AGE INT NOT NULL,
  email VARCHAR(50) NOT NULL,
  UserPassword VARCHAR(50) NOT NULL,
  PRIMARY KEY (ID),
  MobileNo VARCHAR(10) NOT NULL
  
);
ALTER TABLE SignUpData ADD INDEX idx_signupdata_name (NAME),
ADD INDEX idx_signupdata_email (email),
ADD INDEX idx_signupdata_mobile (MobileNo);


DROP TRIGGER IF EXISTS sync_login_data;

DELIMITER //

CREATE TRIGGER sync_login_data
AFTER INSERT ON SignUpData
FOR EACH ROW
BEGIN
  INSERT INTO LoginData (Name, email, UserPassword) VALUES (NEW.Name, NEW.email, NEW.UserPassword);
END//

DELIMITER ;

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (1, 'Vamsi Krishna', 21, 'sripathivamsikrishna@gmail.com', 'V@amsi123', '9390305704');

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (2, 'Arjun Suravaram', 21, 'arjunsuravaram@gmail.com', 'A@rjun456', '9177509117');

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (3, 'Krishna Vamsi', 20, 'krishnasripathivamsi@gmail.com', 'K@rishna@789', '1234567890');

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (4, 'Prabhas Raju', 42, 'prabhasuppalapati@gmail.com', 'Prabhas@25', '2345169780');

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (5, 'Vishwadeep', 35, 'vishwadeep@gmail.com', 'vishwa@35', '5426788120');

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (6, 'Raghava', 37, 'raghava@gmail.com', 'raghava@37', '9012345678');

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (7, 'Rama', 40, 'ram@gmail.com', 'ram@40', '9870123645');

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (8, 'Lakshman', 39, 'lakshman@gmail.com', 'lakshman@39', '9461532807');

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (9, 'Arjuna', 38, 'arjuna@gmail.com', 'Arjun@38', '8717243394');

INSERT INTO SignUpData (ID, NAME, AGE, email, UserPassword, MobileNo)
VALUES (10, 'Bheem', 40, 'bheema@gmail.com', 'Bheema@40', '9792948724');




select * from signupdata;