
--Anything with a $ in front of it is just a placeholder for whatever value you would like to put in.

--Employee:

INSERT INTO Employee (employee_ID, first_name, last_name, birthday) VALUES ($id,$FirstName,$LastName,$Birthdate);
SELECT * FROM Employee; --displays all employees
SELECT first_name , last_name FROM Employee WHERE birthday <= DATE_SUB(curdate(),INTERVAL 21 YEAR);--returns all employees who are 21 or older
SELECT first_name,last_name FROM Employee WHERE employee_ID  = $id; --displays an employee
DELETE FROM Employee WHERE employee_ID = $id;--deletes an employee based on id
SELECT Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Request_Off.description AS "Description", Request_Off.startDate AS "Start", Request_Off.endDate AS "End" FROM Request_Off JOIN Employee USING(employee_ID);--finds all employees who have requested off
UPDATE Employee SET first_name = $fname, last_name = $lname WHERE employee_ID = $id;  --this can be split into two separate queries if need be
UPDATE Employee SET birthday=$bday WHERE employee_ID = $id; --I doubt any one will change their  birthday, this is just in case the employee makes a mistake when entering in the information
UPDATE Employee SET employee_ID = $newId WHERE employee_ID = $oldId;--I doubt this will get used, but better safe than sorry
SELECT * FROM Employee WHERE MONTH(birthday) AND DAY(birthday) = MONTH(curdate()) AND DAY(curdate());--returns anyone who has a birthday today


--Availability:

INSERT INTO Availability (employee_id,days,times) VALUES ($id,$days,$times);
SELECT * FROM Availability;
DELETE FROM Availability WHERE employee_ID = $id;--deletes an availability listing based on employee id
UPDATE Avaliability SET days = $days, times = $times WHERE employee_ID = $id;--changes the current avaliability to new days and times
UPDATE Avaliability SET employee_ID =$newId WHERE employee_ID = $oldID;--probably won't need this, but it's here just in case.  Sets an avaliability to a different employee id
SELECT Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Availability.days AS "Days Available", Availability.times AS "Earliest Time Available" FROM Availability JOIN Employee USING(employee_ID);--returns the availability of all employees
SELECT Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Availability.days AS "Days Available", Availability.times AS "Earliest Time Available" FROM Availability JOIN Employee USING(employee_ID) WHERE days = $days;--similar to the last, but only searches for those open on the specified days


--Contact_Information:
INSERT INTO Contact_Information (employee_ID, phone_number, email, zip, region) VALUES ($id,$phone,$email, $zipcode, $region);
SELECT * FROM Contact_Information;
DELETE FROM Contact_Information WHERE employee_ID = $id;--deletes a contact information listing based on the employee id
UPDATE Contact_Information SET phone_number = $newPhone WHERE employee_ID = $id;--updates the phone number of the specified employee based on their id
UPDATE Contact_Information SET email = $newEmail WHERE employee_ID = $id;--updates the email belonging to the specified employee, based on their id
UPDATE Contact_Information SET zip = $newZip , region = $newRegion WHERE employee_ID = $id;--updates the zip and the region fields based on employee id
--I separated most of these since a change in phone number doesn't necessarily herald a change in email or zip code.  However a change in zipcode could mean a region change as well
UPDATE Contact_Information SET employee_ID = $newID WHERE employee_ID = $old_ID;--you know how this one works by now
SELECT Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Contact_Information.phone_number AS "Phone", Contact_Information.email AS "E-mail", Contact_Information.zip AS "Zip Code", Contact_Information.region AS "State/Region" FROM Contact_Information JOIN Employee USING (employee_ID) WHERE employee_ID = $id;
--returns all contact information on an employee based off their employee id
SELECT Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Contact_Information.email AS "E-mail" FROM Contact_Information JOIN Employee USING(employee_ID);
--returns all emails for all employees
SELECT Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Contact_Information.phone AS "Phone" FROM Contact_Information JOIN Employee USING(employee_ID);
--returns all phone numbers for all employees
SELECT Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Contact_Information.zip AS "Zip Code", Contact_Information.region AS "State/Region" FROM Contact_Information JOIN Employee USING(employee_ID);
--returns all zip and region codes for all employees
 SELECT Position.position_IDs AS "Position ID", Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Contact_Information.phone_number AS "Phone", Contact_Information.email AS "E-mail", Contact_Information.zip AS "Zip Code", Contact_Information.region AS "State/Region" FROM Contact_Information JOIN Employee JOIN Position ON Contact_Information.employee_ID = Employee.employee_ID AND Contact_Information.employee_ID = Position.employee_ID AND Employee.employee_ID = Position.employee_ID ORDER BY Position.position_IDs ASC;
--returns all employees contact info and orders them by their position
 SELECT Position.position_IDs AS "Position ID", Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Contact_Information.phone_number AS "Phone", Contact_Information.email AS "E-mail", Contact_Information.zip AS "Zip Code", Contact_Information.region AS "State/Region" FROM Contact_Information JOIN Employee JOIN Position ON Contact_Information.employee_ID = Employee.employee_ID AND Contact_Information.employee_ID = Position.employee_ID AND Employee.employee_ID = Position.employee_ID WHERE Position.position_IDs = $id ORDER BY Position.position_IDs ASC;
--same as above but only returns a employees in a specific position



--Position:
INSERT INTO Position (employee_ID, position_IDs) VALUES ($id,$position_ID);--for this I assumed that 1-manager, 2-host, 3-server,4-bus person,5-bartender
SELECT * FROM Position;
DELETE FROM Position WHERE employee_ID = $id;
SELECT Position.position_IDs AS "Position ID", Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Employee.employee_ID AS "Employee Id" FROM Employee JOIN Position USING(employee_ID) ORDER BY Position.position_IDs ASC;
--returns all employees and orders them by their position
UPDATE Position SET position_IDs = $newID WHERE employee_ID = $id;--changes the position of an employee
UPDATE Position SET employee_ID = $newID WHERE employee_ID = $oldID;--changes the employee that is listed in this specific entry

--Request_Off:

INSERT INTO Request_Off (employee_ID,description,startDate,endDate) VALUES ($id,$description,$start,$end);
SELECT * FROM Request_Off;
Delete FROM Request_Off WHERE $id = employee_ID;  --deletes the request off based on an input id
Delete FROM Request_Off WHERE endDate < curDate(); --deletes the request off if the end date has already passed
UPDATE Request_Off SET description = $newDescription WHERE employee_id = $id; --changes the description of a request off
UPDATE Request_Off SET startDate = $start , endDate = $end WHERE employee_id = $id; --changes the start and end date of the request off
UPDATE Request_Off SET employee_ID = $newID WHERE employee_ID = $oldID;--changes which employee the request off belongs to
SELECT Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Request_Off.description AS "Description", Request_Off.startDate AS "Start", Request_Off.endDate AS "End" FROM Employee JOIN Request_Off USING(employee_ID) ORDER BY Request_Off.startDate ASC;
--returns all current requests off, ordered by the start date


--Schedule:
INSERT INTO Schedule (employee_ID,days,times) VALUES ($id,$days,$times);
SELECT * FROM Schedule;
SELECT Employee.first_name AS "First Name", Employee.last_name AS "Last Name", Schedule.days AS "Days Availiable", Schedule.times AS "Start Time" FROM Schedule JOIN Employee USING(employee_ID);--shows all days that the employees have scheduled to work and what times they start
DELETE FROM Schedule WHERE employee_ID = $id;
SELECT Position.position_IDs AS "Position ID", Employee.first_name AS "First Name", Employee.last_name AS "Last Name",  Schedule.times AS "Start Time" FROM Schedule JOIN Employee JOIN Position ON Schedule.employee_ID = Employee.employee_ID AND Employee.employee_ID= Position.employee_ID AND Schedule.employee_ID = Position.employee_ID WHERE Schedule.days = $day ORDER BY Position.position_IDs ASC;
--returns all employees able to work on the given days
SELECT Position.position_IDs AS "Position ID", Employee.first_name AS "First Name", Employee.last_name AS "Last Name",  Schedule.times AS "Start Time" FROM Schedule JOIN Employee JOIN Position ON Schedule.employee_ID = Employee.employee_ID AND Employee.employee_ID= Position.employee_ID AND Schedule.employee_ID = Position.employee_ID WHERE Position.position_IDs = $posID ORDER BY Position.position_IDs ASC;
--returns all employees of a specific position that can work on the given days

--Registration_Codes:
INSERT INTO Registration_Codes(code) VALUES ($code);
SELECT * FROM Registration_Codes WHERE code = $code;
DELETE FROM Registration_Codes WHERE code = $code;
--should be all we need for the registration codes, a simple insert select and delete