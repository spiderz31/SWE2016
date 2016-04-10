CREATE TABLE Employee
(
employee_ID int,
first_name varchar(25),
last_name varchar(25),
birthday Date,
PRIMARY KEY (employee_ID)
);

INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES (0,'Jeremy','Warden','1996-11-30');
INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES (1,'Joe','Peshi','1948-06-23');
INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES (2,'Han','Chen','1995-02-14');
INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES (3,'Kaitlyn','Anderson','1994-04-19');
INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES (4,'Josh','Lewis','1994-02-21');
INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES (5,'Donkey','Kong','1963-12-24');
INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES (6,'Remilia','Scarlet','1509-06-13');
INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES (7,'Bruce','Wayne','1971-01-29');
INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES (8,'Deadpool','Awesomeguy','1948-09-19');

CREATE TABLE Contact_Information
(
employee_ID int,
phone_number varchar(10),
email varchar(50),
zip varchar(5),
region varchar (2),
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES (0,'5738765309','jeremy@whateverHisEmailIs.com', '65202', 'MO');
INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES (1,'5738490998','joe.peshi@imReallyFamous.com', '64908', 'IL');
INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES (2,'4897684430','han.chen@whateverHerEmailIs.com', '65202', 'MO');
INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES (3,'5734443344','Kaitlyn@whateverHerEmailIs.com', '65202', 'MO');
INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES (4,'5737890020','josh@whateverHisEmailIs.com', '65203', 'MO');
INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES (5,'1113987654','KRoolDroolz@bananas.com', '12345', 'AR');
INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES (6,'6669874636','remilia.scarlet@gmail.com', '48765', 'KS');
INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES (7,'4389207839','gotham@batcave.com', '98766', 'NY');
INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES (8,'2874392938','deadpool@thebestemail.best', '48732', 'LA');

CREATE TABLE Position
(
employee_ID int,
position_IDs varchar(10),
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

INSERT INTO Position (employee_ID, position_IDs) VALUES (0,'1');
INSERT INTO Position (employee_ID, position_IDs) VALUES (1,'2');
INSERT INTO Position (employee_ID, position_IDs) VALUES (2,'3');
INSERT INTO Position (employee_ID, position_IDs) VALUES (3,'4');
INSERT INTO Position (employee_ID, position_IDs) VALUES (4,'2');
INSERT INTO Position (employee_ID, position_IDs) VALUES (5,'5');
INSERT INTO Position (employee_ID, position_IDs) VALUES (6,'5');
INSERT INTO Position (employee_ID, position_IDs) VALUES (7,'3');
INSERT INTO Position (employee_ID, position_IDs) VALUES (8,'4');

CREATE TABLE Availability
(
employee_ID int,
days varchar(10),
times time,
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

INSERT INTO Availability (employee_ID,days,times) VALUES (0,'MTWTHFS','08:00:00');
INSERT INTO Availability (employee_ID,days,times) VALUES (1,'TWTHFS','12:00:00');
INSERT INTO Availability (employee_ID,days,times) VALUES (2,'MTWTHS','10:00:00');
INSERT INTO Availability (employee_ID,days,times) VALUES (3,'MTWTHFS','06:00:00');
INSERT INTO Availability (employee_ID,days,times) VALUES (4,'MTWFS','09:45:00');
INSERT INTO Availability (employee_ID,days,times) VALUES (5,'MTWTHFS','04:00:00');
INSERT INTO Availability (employee_ID,days,times) VALUES (6,'MTWTHFS','14:00:00');
INSERT INTO Availability (employee_ID,days,times) VALUES (7,'MTWTHF','11:00:00');
INSERT INTO Availability (employee_ID,days,times) VALUES (8,'MTTHFS','10:30:00');


CREATE TABLE Request_Off
(
employee_ID int,
description varchar(100),
startDate Date,
endDate Date,
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

INSERT INTO Request_Off (employee_ID,description,startDate,endDate) VALUES (6,'Bored, need a break.','2016-06-19','2016-07-31');
INSERT INTO Request_Off (employee_ID,description,startDate,endDate) VALUES (3,'Visiting uncle in Zimbabwae.','2016-08-10','2016-08-21');
INSERT INTO Request_Off (employee_ID,description,startDate,endDate) VALUES (2,'Going to the moon for a short time.','2016-06-19','2016-06-24');
INSERT INTO Request_Off (employee_ID,description,startDate,endDate) VALUES (7,'The Joker got out of prison again.','2016-10-19','2016-10-22');
INSERT INTO Request_Off (employee_ID,description,startDate,endDate) VALUES (4,'Visiting uncle in Zimbabwae.','2016-12-19','2016-12-20');

CREATE TABLE Schedule
(
employee_ID int,
days varchar(10),
times time,
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

INSERT INTO Schedule (employee_ID,days,times) VALUES (0,'MTWTHF','09:00:00');
INSERT INTO Schedule (employee_ID,days,times) VALUES (1,'TWTHFS','09:00:00');
INSERT INTO Schedule (employee_ID,days,times) VALUES (2,'MTWTHS','11:00:00');
INSERT INTO Schedule (employee_ID,days,times) VALUES (3,'MTWTHF','10:00:00');
INSERT INTO Schedule (employee_ID,days,times) VALUES (4,'MTWFS','09:30:00');
INSERT INTO Schedule (employee_ID,days,times) VALUES (5,'MTWTHS','09:00:00');
INSERT INTO Schedule (employee_ID,days,times) VALUES (6,'MTWTHF','14:00:00');
INSERT INTO Schedule (employee_ID,days,times) VALUES (7,'MTWTHF','11:00:00');
INSERT INTO Schedule (employee_ID,days,times) VALUES (8,'MTTHF','11:00:00');

--added the registration_Codes table to the file
CREATE TABLE Registration_Codes
(
code int,
PRIMARY KEY(code)
);