
-- We start from entity set for easier debugging:
CREATE TABLE Places
    (places_address VARCHAR(50) PRIMARY KEY,
    places_size INTEGER);

INSERT INTO Places (places_Address, places_Size) VALUES ('1234 Main St', 200);
INSERT INTO Places (places_Address, places_Size) VALUES ('333 W Broadway', 200);
INSERT INTO Places (places_Address, places_Size) VALUES ('673 W 27th Ave', 120);
INSERT INTO Places (places_Address, places_Size) VALUES ('2221 E 33rd Ave', 145);
INSERT INTO Places (places_Address, places_Size) VALUES ('1433 Cambie St', 300);

CREATE TABLE Clubs
    (club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (club_name, club_year));

INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2009);
INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2010);
INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2023);
INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2016);
INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2021);

CREATE TABLE Enthusiasts
    (en_email VARCHAR(50) PRIMARY KEY,
    en_name VARCHAR(50));

INSERT INTO Enthusiasts (En_email, En_name) VALUES ('linuschen28@gmail.com', 'Linus Chen');
INSERT INTO Enthusiasts (En_email, En_name) VALUES ('kunglim@gmail.com', 'Kung Lim');
INSERT INTO Enthusiasts (En_email, En_name) VALUES ('edwardwang915@gmail.com', 'Edward Wang');
INSERT INTO Enthusiasts (En_email, En_name) VALUES ('johndoe@hotmail.com', 'John Doe');
INSERT INTO Enthusiasts (En_email, En_name) VALUES ('hotdogeater@student.ubc.ca', 'Alex Smith');

CREATE TABLE Members
    (member_id VARCHAR(50) PRIMARY KEY,
    member_birthday VARCHAR(50),
    member_email VARCHAR(50),
    member_name VARCHAR(50));

INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('001', '2001-10-11', 'jacobmartin@gmail.com', 'Jacob Martin');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('002', '2003-11-28', 'leonidasmax11@student.ubc.ca', 'Leonidas Max');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('101', '1999-02-01', 'marklee3@yahoo.ca', 'Mark Lee');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('026', '2001-10-11', 'michaeljackson@gmail.com', 'Jackson Michael');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('010', '2005-07-30', 'ccheung222@gmail.com', 'Carson Cheung');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('004', '2000-12-25', 'santasanderson@gmail.com', 'Santa Sanderson');

CREATE TABLE Admin
    (admin_roles VARCHAR(50),
    member_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (member_id)
    REFERENCES Members);

INSERT INTO Admin (admin_Roles, member_id) VALUES ('President', '001');
INSERT INTO Admin (admin_Roles, member_id) VALUES ('Vice President', '002');
INSERT INTO Admin (admin_Roles, member_id) VALUES ('Treasurer', '010');
INSERT INTO Admin (admin_Roles, member_id) VALUES ('Equipment Manager', '004');
INSERT INTO Admin (admin_Roles, member_id) VALUES ('Event Manager', '026');

CREATE TABLE Events
    (event_time VARCHAR(50),
    event_address VARCHAR(50),
    PRIMARY KEY (event_time, event_address));

INSERT INTO Events (event_time, event_address) VALUES ('2023-10-31 @ 7PM', '1234 Main St');
INSERT INTO Events (event_time, event_address) VALUES ('2023-11-09 @ 6PM', '1234 Main St');
INSERT INTO Events (event_time, event_address) VALUES ('2023-12-23 @ 5PM', '673 W 27th Ave');
INSERT INTO Events (event_time, event_address) VALUES ('2023-10-27 @ 11AM', '2221 E 33rd Ave');
INSERT INTO Events (event_time, event_address) VALUES ('2023-01-09 @ 7PM', '333 W Broadway');

CREATE TABLE Coach
    (coach_email VARCHAR(50),
    coach_name VARCHAR(50),
    PRIMARY KEY (coach_email, coach_name));

INSERT INTO Coach (coach_email, coach_name) VALUES ('coachmike@gmail.com', 'Mike Krasinski');
INSERT INTO Coach (coach_email, coach_name) VALUES ('archerywithalex@gmail.com', 'Alex Chou');
INSERT INTO Coach (coach_email, coach_name) VALUES ('emcallister@student.ubc.ca', 'Evan McAllister');
INSERT INTO Coach (coach_email, coach_name) VALUES ('emilybow@shaw.ca', 'Emily Bowman');
INSERT INTO Coach (coach_email, coach_name) VALUES ('coachjosephng@ubc.ca', 'Joseph Ng');

CREATE TABLE Equipment
    (equipment_id VARCHAR(50) PRIMARY KEY);

INSERT INTO Equipment (equipment_id) VALUES ('B01');
INSERT INTO Equipment (equipment_id) VALUES ('T12');
INSERT INTO Equipment (equipment_id) VALUES ('T20');
INSERT INTO Equipment (equipment_id) VALUES ('B02');
INSERT INTO Equipment (equipment_id) VALUES ('T11');
INSERT INTO Equipment (equipment_id) VALUES ('B03');
INSERT INTO Equipment (equipment_id) VALUES ('B05');
INSERT INTO Equipment (equipment_id) VALUES ('B04');
INSERT INTO Equipment (equipment_id) VALUES ('T01');
INSERT INTO Equipment (equipment_id) VALUES ('T06');

CREATE TABLE Bow
    (bow_type VARCHAR(50),
    equipment_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (equipment_id) REFERENCES Equipment);

INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Recurve bow', 'B01');
INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Recurve bow', 'B02');
INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Compound bow', 'B05');
INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Longbow', 'B04');
INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Recurve bow', 'B03');

CREATE TABLE Targets
    (equipment_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (equipment_id) REFERENCES Equipment);

INSERT INTO Targets (equipment_id) VALUES ('T01');
INSERT INTO Targets (equipment_id) VALUES ('T06');
INSERT INTO Targets (equipment_id) VALUES ('T20');
INSERT INTO Targets (equipment_id) VALUES ('T11');
INSERT INTO Targets (equipment_id) VALUES ('T12');

--Starting with relationship sets:

CREATE TABLE Rent1
    (places_address VARCHAR(50),
    rent_cost INTEGER,
    PRIMARY KEY (places_address),
    FOREIGN KEY (places_address) REFERENCES Places);


INSERT INTO Rent1 (rent_Cost, places_Address) VALUES (120, '1234 Main St');


CREATE TABLE Rent2 
    (places_address VARCHAR(50),
    club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (places_address, club_name, club_year),
    FOREIGN KEY (places_address) REFERENCES Places,
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2009, '1234 Main St');
INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2010, '1234 Main St');
INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2023, '1234 Main St');
INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2016, '1234 Main St');
INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2021, '1234 Main St');

--This is the original Connect1
CREATE TABLE Contact
    (en_email VARCHAR(50),
    club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (en_email, club_name, club_year),
    FOREIGN KEY (en_email) REFERENCES Enthusiasts,
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

INSERT INTO Contact (En_email, club_name, club_year) VALUES ('linuschen28@gmail.com', 'UBC Archery Club', 2009);
INSERT INTO Contact (En_email, club_name, club_year) VALUES ('kunglim@gmail.com', 'UBC Archery Club', 2010);
INSERT INTO Contact (En_email, club_name, club_year) VALUES ('edwardwang915@gmail.com', 'UBC Archery Club', 2023);
INSERT INTO Contact (En_email, club_name, club_year) VALUES ('johndoe@hotmail.com', 'UBC Archery Club', 2016);
INSERT INTO Contact (En_email, club_name, club_year) VALUES ('hotdogeater@student.ubc.ca', 'UBC Archery Club', 2021);

--Create Assertion that all enthusiasts should contact at least 1 club:
Create Assertion CheckEnthusiasts
Check (Not Exists (select En_email from Enthusiasts) Except (select En_email from Contact));

CREATE TABLE Enlist1
    (club_name VARCHAR(50),
    club_year INTEGER,
    fees INTEGER,
    PRIMARY KEY (club_name, club_year),
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2009, 20);
INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2010, 75);
INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2023, 20);
INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2016, 60);
INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2021, 90);

--Create Assertion that all members should be in some club and all clubs should contain some members. 
CREATE ASSERTION CheckEnlist1
Check (Not Exists ((select club_name, club_year from clubs) Except (select club_name,club_year from Enlist1)));



CREATE TABLE Enlist2
    (club_name VARCHAR(50),
    club_year INTEGER,
    member_id VARCHAR(50),
    PRIMARY KEY (club_name, club_year, member_id),
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs,
    FOREIGN KEY (member_id) REFERENCES Members);

INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2009, '001');
INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2010, '002');
INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2023, '101');
INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2016, '026');
INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2021, '010');

--Create Assertion that all members should be in some club and all clubs should contain some members. 
CREATE ASSERTION CheckEnlist2
Check (Not Exists ((select club_name, club_year,member_id from clubs,Members) Except (select club_name,club_year,member_id from Enlist2)));

CREATE TABLE Hire
    (club_name VARCHAR(50),
    club_year INTEGER,
    coach_email VARCHAR(50),
    coach_name VARCHAR(50),
    PRIMARY KEY (club_name, club_year, coach_email, coach_name),
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs,
    FOREIGN KEY (coach_email, coach_name) REFERENCES Coach);

INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2009, 'coachmike@gmail.com', 'Mike Krasinski');
INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2010, 'archerywithalex@gmail.com', 'Alex Chou');
INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2023, 'emcallister@student.ubc.ca', 'Evan McAllister');
INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2016, 'emilybow@shaw.ca', 'Emily Bowman');
INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2021, 'coachjosephng@ubc.ca', 'Joseph Ng');

CREATE TABLE Own
    (equipment_id VARCHAR(50),
    club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (equipment_id, club_name, club_year),
    FOREIGN KEY (equipment_id) REFERENCES Equipment,
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('B01', 'UBC Archery Club', 2009);
INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('T12', 'UBC Archery Club', 2010);
INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('T20', 'UBC Archery Club', 2023);
INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('B02', 'UBC Archery Club', 2016);
INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('T11', 'UBC Archery Club', 2021);
INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('B03', 'UBC Archery Club', 2023);
INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('B05', 'UBC Archery Club', 2010);
INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('B04', 'UBC Archery Club', 2023);
INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('T01', 'UBC Archery Club', 2009);
INSERT INTO Own (equipment_id, club_name, club_year) VALUES ('T06', 'UBC Archery Club', 2016);

--Possible item to delete because no training secession defined. 
CREATE TABLE Train
    (coach_email VARCHAR(50),
    coach_name VARCHAR(50),
    member_id VARCHAR(50),
    PRIMARY KEY (coach_email, coach_name, member_id),
    FOREIGN KEY (coach_email, coach_name) REFERENCES Coach,
    FOREIGN KEY (member_id) REFERENCES Members);

INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('coachmike@gmail.com', 'Mike Krasinski', '001');
INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('archerywithalex@gmail.com', 'Alex Chou', '002');
INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('emcallister@student.ubc.ca', 'Evan McAllister', '101');
INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('emilybow@shaw.ca', 'Emily Bowman', '026');
INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('coachjosephng@ubc.ca', 'Joseph Ng', '010');

CREATE TABLE Manage
    (member_id VARCHAR(50),
    club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (member_id, club_name, club_year),
    FOREIGN KEY (member_id) REFERENCES Admin,
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

INSERT INTO Manage (member_id, club_name, club_year) VALUES ('001', 'UBC Archery Club', 2009);
INSERT INTO Manage (member_id, club_name, club_year) VALUES ('002', 'UBC Archery Club', 2010);
INSERT INTO Manage (member_id, club_name, club_year) VALUES ('010', 'UBC Archery Club', 2023);
INSERT INTO Manage (member_id, club_name, club_year) VALUES ('026', 'UBC Archery Club', 2016);
INSERT INTO Manage (member_id, club_name, club_year) VALUES ('010', 'UBC Archery Club', 2021);

--All clubs should be managed by some admin
CREATE ASSERTION CheckManage
Check (Not Exists ((select club_name, club_year from clubs) Except (select club_name,club_year from Manage)));

CREATE TABLE Participate
    (member_id VARCHAR(50),
    event_time VARCHAR(50),
    event_address VARCHAR(50),
    PRIMARY KEY (member_id, event_time, event_address),
    FOREIGN KEY (member_id) REFERENCES Members,
    FOREIGN KEY (event_time, event_address) REFERENCES Events);

INSERT INTO Participate (member_id, event_time, event_address) VALUES ('001', '2023-10-31 @ 7PM', '1234 Main St');
INSERT INTO Participate (member_id, event_time, event_address) VALUES ('002', '2023-11-09 @ 6PM', '1234 Main St');
INSERT INTO Participate (member_id, event_time, event_address) VALUES ('101', '2023-12-23 @ 5PM', '673 W 27th Ave');
INSERT INTO Participate (member_id, event_time, event_address) VALUES ('026', '2023-10-27 @ 11AM', '2221 E 33rd Ave');
INSERT INTO Participate (member_id, event_time, event_address) VALUES ('010', '2023-01-09 @ 7PM', '333 W Broadway');

--All Events should be participated by some members
CREATE ASSERTION CheckParticipate
CHECK (Not Exists ((select event_address, event_time from Events) Except (select event_address, event_time from Participate)));

CREATE TABLE Schedule
    (member_id VARCHAR(50),
    event_time VARCHAR(50),
    event_address VARCHAR(50),
    PRIMARY KEY (member_id, event_time, event_address),
    FOREIGN KEY (member_id) REFERENCES Admin,
    FOREIGN KEY (event_time, event_address) REFERENCES Events);

INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('001', '2023-10-31 @ 7PM', '1234 Main St');
INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('002', '2023-11-09 @ 6PM', '1234 Main St');
INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('004', '2023-12-23 @ 5PM', '673 W 27th Ave');
INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('026', '2023-10-27 @ 11AM', '2221 E 33rd Ave');
INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('010', '2023-01-09 @ 7PM', '333 W Broadway');

--All Events should be scheduled by some admins
CREATE ASSERTION CheckAdmin
Check (Not Exists ((select member_id from Admin) Except (select member_id from Schedule)));
