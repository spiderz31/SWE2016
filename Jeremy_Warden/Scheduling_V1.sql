CREATE TABLE Employee
(
employee_ID int,
fname varchar(25),
lname varchar(25),
bday Date,
PRIMARY KEY (employee_ID)
);

CREATE TABLE Contact
(
employee_ID int,
phone varchar(10),
email varchar(50),
zip varchar(5),
PRIMARY KEY (employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID)
);

CREATE TABLE Position
(
position_ID int,
position_title varchar(20),
PRIMARY KEY (position_ID),
PRIMARY KEY (day),
);

CREATE TABLE Has_Position
(
employee_ID int,
position_ID int,
PRIMARY KEY (position_ID,employee_ID),
FOREIGN KEY (employee_ID) REFERENCES Employee(employee_ID),
FOREIGN KEY (position_ID) REFERENCES Position(position_ID_ID)
);

CREATE TABLE Availability
(
day varchar(10),
time time,
PRIMARY KEY (time),
PRIMARY KEY (day),
);

CREATE TABLE Employee_Has_Availability
(
employee_ID int,
day varchar(3),
time time,
PRIMARY KEY (employee_ID,day,time),
FOREIGN KEY (day) REFERENCES Availability(day),
FOREIGN KEY (time) REFERENCES Availability(time)
);