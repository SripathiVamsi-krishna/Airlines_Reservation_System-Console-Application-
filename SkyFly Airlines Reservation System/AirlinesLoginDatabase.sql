USE airlinesreservationsystem;

/*DROP TABLE IF EXISTS LoginData;*/
CREATE TABLE LoginData (
	Name varchar(50) default null,
  email VARCHAR(255) DEFAULT  NULL,
  UserPassword VARCHAR(255) DEFAULT  NULL,
  UNIQUE KEY `email` (`email`)
);

/*DROP TABLE IF EXISTS Admins;*/
CREATE TABLE Admins (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AdminName VARCHAR(50) NOT NULL,
    AdminEmail VARCHAR(255) NOT NULL,
    AdminPassword VARCHAR(255) NOT NULL,
    UNIQUE KEY `AdminEmail` (`AdminEmail`)
);

INSERT INTO Admins (AdminName, AdminEmail, AdminPassword)
VALUES ('Sripathi Vamsi Krishna', 'sripathivamsikrishna@admin.com', 'Vamsi@1234');

/*drop table admins;*/




SELECT * FROM LoginData;

select * from admins;
