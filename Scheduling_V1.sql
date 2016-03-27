CREATE TABLE Employee
(
employee_ID int,
first_name varchar(25),
last_name varchar(25),
birthday Date,
PRIMARY KEY (employee_ID)
);

INSERT INTO Employee (0,Jeremy,Warden,);

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

CREATE TABLE Position
(
employee_ID int,
position_IDs varchar(10),
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

CREATE TABLE Availability
(
employee_ID int,
days varchar(10),
times time,
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

CREATE TABLE Request_Off
(
employee_ID int,
description varchar(100),
startDate Date,
endDate Date,
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

CREATE TABLE Schedule
(
employee_ID int,
days varchar(10),
times time,
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);