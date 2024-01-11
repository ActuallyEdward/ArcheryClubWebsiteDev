drop table Schedule;
drop table Participate;
drop table Manage;
drop table Train;
drop table Buy1;
drop table Buy2;
drop table Own;
drop table Hire;
drop table Enlist1;
drop table Enlist2;
drop table Connect1;
drop table Rent1;
drop table Rent2;
drop table Target;
drop table Bow;
drop table Equipment;
drop table Coach;
drop table Shootout;
drop table Party;
drop table Events;
drop table Admin;
drop table Members;
drop table Enthusiasts;
drop table Clubs;
drop table Places;

-- The SQL tables are directly lifted from Question #6 in Milestone #2

CREATE TABLE Places
    (places_address VARCHAR(50) PRIMARY KEY,
    places_size INTEGER);

CREATE TABLE Clubs
    (club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (club_name, club_year));

CREATE TABLE Enthusiasts
    (en_email VARCHAR(50) PRIMARY KEY,
    en_name VARCHAR(50));

CREATE TABLE Members
    (member_id VARCHAR(50) PRIMARY KEY,
    member_birthday VARCHAR(50),
    member_email VARCHAR(50),
    member_name VARCHAR(50));

CREATE TABLE Admin
    (admin_roles VARCHAR(50),
    member_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (member_id)
    REFERENCES Members);

CREATE TABLE Events
    (event_time VARCHAR(50),
    event_address VARCHAR(50),
    PRIMARY KEY (event_time, event_address));

CREATE TABLE Party
    (event_time VARCHAR(50),
    event_address VARCHAR(50),
    PRIMARY KEY (event_time, event_address),
    FOREIGN KEY (event_time, event_address) REFERENCES Events);

CREATE TABLE Shootout
    (event_time VARCHAR(50),
    event_address VARCHAR(50),
    PRIMARY KEY (event_time, event_address),
    FOREIGN KEY (event_time, event_address) REFERENCES Events);

CREATE TABLE Coach
    (coach_email VARCHAR(50),
    coach_name VARCHAR(50),
    PRIMARY KEY (coach_email, coach_name));

CREATE TABLE Equipment
    (equipment_id VARCHAR(50) PRIMARY KEY);

CREATE TABLE Bow
    (bow_type VARCHAR(50),
    equipment_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (equipment_id) REFERENCES Equipment);

CREATE TABLE Target
    (equipment_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (equipment_id) REFERENCES Equipment);

CREATE TABLE Rent1
    (places_address VARCHAR(50) PRIMARY KEY,
    rent_cost INTEGER,
    FOREIGN KEY (places_address) REFERENCES Places);

CREATE TABLE Rent2 
    (places_address VARCHAR(50),
    club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (places_address, club_name, club_year),
    FOREIGN KEY (places_address) REFERENCES Places,
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

CREATE TABLE Connect1
    (en_email VARCHAR(50),
    club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (en_email, club_name, club_year),
    FOREIGN KEY (en_email) REFERENCES Enthusiasts,
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

CREATE TABLE Enlist1
    (club_name VARCHAR(50),
    club_year INTEGER,
    fees INTEGER,
    PRIMARY KEY (club_name, club_year),
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

CREATE TABLE Enlist2
    (club_name VARCHAR(50),
    club_year INTEGER,
    member_id VARCHAR(50),
    PRIMARY KEY (club_name, club_year, member_id),
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs,
    FOREIGN KEY (member_id) REFERENCES Members);

CREATE TABLE Hire
    (club_name VARCHAR(50),
    club_year INTEGER,
    coach_email VARCHAR(50),
    coach_name VARCHAR(50),
    PRIMARY KEY (club_name, club_year, coach_email, coach_name),
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs,
    FOREIGN KEY (coach_email, coach_name) REFERENCES Coach);

CREATE TABLE Own
    (equipment_id VARCHAR(50),
    club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (equipment_id, club_name, club_year),
    FOREIGN KEY (equipment_id) REFERENCES Equipment,
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

CREATE TABLE Buy1
    (price INTEGER,
    equipment_id VARCHAR(50) PRIMARY KEY,
    FOREIGN KEY (equipment_id) REFERENCES Equipment);

CREATE TABLE Buy2
    (member_id VARCHAR(50),
    equipment_id VARCHAR(50),
    PRIMARY KEY (member_id, equipment_id),
    FOREIGN KEY (member_id) REFERENCES Members,
    FOREIGN KEY (equipment_id) REFERENCES Equipment);

CREATE TABLE Train
    (coach_email VARCHAR(50),
    coach_name VARCHAR(50),
    member_id VARCHAR(50),
    PRIMARY KEY (coach_email, coach_name, member_id),
    FOREIGN KEY (coach_email, coach_name) REFERENCES Coach,
    FOREIGN KEY (member_id) REFERENCES Members);

CREATE TABLE Manage
    (member_id VARCHAR(50),
    club_name VARCHAR(50),
    club_year INTEGER,
    PRIMARY KEY (member_id, club_name, club_year),
    FOREIGN KEY (member_id) REFERENCES Members,
    FOREIGN KEY (club_name, club_year) REFERENCES Clubs);

CREATE TABLE Participate
    (member_id VARCHAR(50),
    event_time VARCHAR(50),
    event_address VARCHAR(50),
    PRIMARY KEY (member_id, event_time, event_address),
    FOREIGN KEY (member_id) REFERENCES Members,
    FOREIGN KEY (event_time, event_address) REFERENCES Events);

CREATE TABLE Schedule
    (member_id VARCHAR(50),
    event_time VARCHAR(50),
    event_address VARCHAR(50),
    PRIMARY KEY (member_id, event_time, event_address),
    FOREIGN KEY (member_id) REFERENCES Members,
    FOREIGN KEY (event_time, event_address) REFERENCES Events);

-- Assertions (NEW)

-- CREATE ASSERTION MembersEnlist CHECK ();

-- CREATE ASSERTION ClubsEnlist CHECK ();

-- CREATE ASSERTION EnthusiastsConnect CHECK ();

-- CREATE ASSERTION ClubsManage CHECK ();

-- CREATE ASSERTION EventsParticipate CHECK ();

-- CREATE ASSERTION EventsSchedule CHECK ();

-- The table data is directly lifted from Question #7 in Milestone #2

INSERT INTO Places (places_Address, places_Size) VALUES ('1234 Main St', 200);
INSERT INTO Places (places_Address, places_Size) VALUES ('333 W Broadway', 200);
INSERT INTO Places (places_Address, places_Size) VALUES ('673 W 27th Ave', 120);
INSERT INTO Places (places_Address, places_Size) VALUES ('2221 E 33rd Ave', 145);
INSERT INTO Places (places_Address, places_Size) VALUES ('1433 Cambie St', 300);

INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2009);
INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2010);
INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2023);
INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2016);
INSERT INTO Clubs (club_name, club_year) VALUES ('UBC Archery Club', 2021);

INSERT INTO Enthusiasts (En_email, En_name) VALUES ('linuschen28@gmail.com', 'Linus Chen');
INSERT INTO Enthusiasts (En_email, En_name) VALUES ('kunglim@gmail.com', 'Kung Lim');
INSERT INTO Enthusiasts (En_email, En_name) VALUES ('edwardwang915@gmail.com', 'Edward Wang');
INSERT INTO Enthusiasts (En_email, En_name) VALUES ('johndoe@hotmail.com', 'John Doe');
INSERT INTO Enthusiasts (En_email, En_name) VALUES ('hotdogeater@student.ubc.ca', 'Alex Smith');

INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('001', '10/11/2001', 'jacobmartin@gmail.com', 'Jacob Martin');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('002', '11/28/2003', 'leonidasmax11@student.ubc.ca', 'Leonidas Max');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('101', '02/01/1999', 'marklee3@yahoo.ca', 'Mark Lee');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('026', '10/11/2001', 'michaeljackson@gmail.com', 'Jackson Michael');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('010', '07/30/2005', 'ccheung222@gmail.com', 'Carson Cheung');
INSERT INTO Members (member_id, member_Birthday, member_email, member_name) VALUES ('004', '12/25/2000', 'santasanderson@gmail.com', 'Santa Sanderson');

INSERT INTO Admin (admin_Roles, member_id) VALUES ('President', '001');
INSERT INTO Admin (admin_Roles, member_id) VALUES ('Vice President', '002');
INSERT INTO Admin (admin_Roles, member_id) VALUES ('Treasurer', '010');
INSERT INTO Admin (admin_Roles, member_id) VALUES ('Equipment Manager', '004');
INSERT INTO Admin (admin_Roles, member_id) VALUES ('Event Manager', '026');

INSERT INTO Events (event_time, event_address) VALUES ('10/31/2023 @ 7PM', '1234 Main St');
INSERT INTO Events (event_time, event_address) VALUES ('11/09/2023 @ 6PM', '1234 Main St');
INSERT INTO Events (event_time, event_address) VALUES ('12/23/2023 @ 5PM', '673 W 27th Ave');
INSERT INTO Events (event_time, event_address) VALUES ('10/27/2023 @ 11AM', '2221 E 33rd Ave');
INSERT INTO Events (event_time, event_address) VALUES ('01/09/2024 @ 7PM', '333 W Broadway');

INSERT INTO Party (event_time, event_address) VALUES ('10/31/2023 @ 7PM', '1234 Main St');
INSERT INTO Party (event_time, event_address) VALUES ('11/09/2023 @ 6PM', '1234 Main St');
INSERT INTO Party (event_time, event_address) VALUES ('01/09/2024 @ 7PM', '333 W Broadway');

INSERT INTO Shootout (event_time, event_address) VALUES ('12/23/2023 @ 5PM', '673 W 27th Ave');
INSERT INTO Shootout (event_time, event_address) VALUES ('10/27/2023 @ 11AM', '2221 E 33rd Ave');

INSERT INTO Coach (coach_email, coach_name) VALUES ('coachmike@gmail.com', 'Mike Krasinski');
INSERT INTO Coach (coach_email, coach_name) VALUES ('archerywithalex@gmail.com', 'Alex Chou');
INSERT INTO Coach (coach_email, coach_name) VALUES ('emcallister@student.ubc.ca', 'Evan McAllister');
INSERT INTO Coach (coach_email, coach_name) VALUES ('emilybow@shaw.ca', 'Emily Bowman');
INSERT INTO Coach (coach_email, coach_name) VALUES ('coachjosephng@ubc.ca', 'Joseph Ng');

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

INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Recurve bow', 'B01');
INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Recurve bow', 'B02');
INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Compound bow', 'B05');
INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Longbow', 'B04');
INSERT INTO Bow (bow_Type, equipment_id) VALUES ('Recurve bow', 'B03');

INSERT INTO Target (equipment_id) VALUES ('T01');
INSERT INTO Target (equipment_id) VALUES ('T06');
INSERT INTO Target (equipment_id) VALUES ('T20');
INSERT INTO Target (equipment_id) VALUES ('T11');
INSERT INTO Target (equipment_id) VALUES ('T12');

INSERT INTO Rent1 (rent_Cost, places_Address) VALUES (100, '1234 Main St');
INSERT INTO Rent1 (rent_Cost, places_Address) VALUES (150, '1234 Main St');
INSERT INTO Rent1 (rent_Cost, places_Address) VALUES (200, '1234 Main St');
INSERT INTO Rent1 (rent_Cost, places_Address) VALUES (175, '1234 Main St');
INSERT INTO Rent1 (rent_Cost, places_Address) VALUES (100, '1234 Main St');

INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2009, '1234 Main St');
INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2010, '1234 Main St');
INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2023, '1234 Main St');
INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2016, '1234 Main St');
INSERT INTO Rent2 (club_name, club_year, places_Address) VALUES ('UBC Archery Club', 2021, '1234 Main St');

INSERT INTO Connect1 (En_email, club_name, club_year) VALUES ('linuschen28@gmail.com', 'UBC Archery Club', 2009);
INSERT INTO Connect1 (En_email, club_name, club_year) VALUES ('kunglim@gmail.com', 'UBC Archery Club', 2010);
INSERT INTO Connect1 (En_email, club_name, club_year) VALUES ('edwardwang915@gmail.com', 'UBC Archery Club', 2023);
INSERT INTO Connect1 (En_email, club_name, club_year) VALUES ('johndoe@hotmail.com', 'UBC Archery Club', 2016);
INSERT INTO Connect1 (En_email, club_name, club_year) VALUES ('hotdogeater@student.ubc.ca', 'UBC Archery Club', 2021);

INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2009, 50);
INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2010, 75);
INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2023, 100);
INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2016, 60);
INSERT INTO Enlist1 (club_name, club_year, Fees) VALUES ('UBC Archery Club', 2021, 90);

INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2009, '001');
INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2010, '002');
INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2023, '101');
INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2016, '026');
INSERT INTO Enlist2 (club_name, club_year, member_id) VALUES ('UBC Archery Club', 2021, '010');

INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2009, 'coachmike@gmail.com', 'Mike Krasinski');
INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2010, 'archerywithalex@gmail.com', 'Alex Chou');
INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2023, 'emcallister@student.ubc.ca', 'Evan McAllister');
INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2016, 'emilybow@shaw.ca', 'Emily Bowman');
INSERT INTO Hire (club_name, club_year, coach_email, coach_name) VALUES ('UBC Archery Club', 2021, 'coachjosephng@ubc.ca', 'Joseph Ng');

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

INSERT INTO Buy1 (price, equipment_id) VALUES (200, 'B01');
INSERT INTO Buy1 (price, equipment_id) VALUES (100, 'T12');
INSERT INTO Buy1 (price, equipment_id) VALUES (150, 'T20');
INSERT INTO Buy1 (price, equipment_id) VALUES (250, 'B02');
INSERT INTO Buy1 (price, equipment_id) VALUES (300, 'T11');
INSERT INTO Buy1 (price, equipment_id) VALUES (220, 'B03');

INSERT INTO Buy2 (member_id, equipment_id) VALUES ('001', 'B01');
INSERT INTO Buy2 (member_id, equipment_id) VALUES ('002', 'T12');
INSERT INTO Buy2 (member_id, equipment_id) VALUES ('101', 'T20');
INSERT INTO Buy2 (member_id, equipment_id) VALUES ('026', 'B02');
INSERT INTO Buy2 (member_id, equipment_id) VALUES ('010', 'T11');
INSERT INTO Buy2 (member_id, equipment_id) VALUES ('004', 'B03');

INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('coachmike@gmail.com', 'Mike Krasinski', '001');
INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('archerywithalex@gmail.com', 'Alex Chou', '002');
INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('emcallister@student.ubc.ca', 'Evan McAllister', '101');
INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('emilybow@shaw.ca', 'Emily Bowman', '026');
INSERT INTO Train (coach_email, coach_name, member_id) VALUES ('coachjosephng@ubc.ca', 'Joseph Ng', '010');

INSERT INTO Manage (member_id, club_name, club_year) VALUES ('001', 'UBC Archery Club', 2009);
INSERT INTO Manage (member_id, club_name, club_year) VALUES ('002', 'UBC Archery Club', 2010);
INSERT INTO Manage (member_id, club_name, club_year) VALUES ('101', 'UBC Archery Club', 2023);
INSERT INTO Manage (member_id, club_name, club_year) VALUES ('026', 'UBC Archery Club', 2016);
INSERT INTO Manage (member_id, club_name, club_year) VALUES ('010', 'UBC Archery Club', 2021);

INSERT INTO Participate (member_id, event_time, event_address) VALUES ('001', '10/31/2023 @ 7PM', '1234 Main St');
INSERT INTO Participate (member_id, event_time, event_address) VALUES ('002', '11/09/2023 @ 6PM', '1234 Main St');
INSERT INTO Participate (member_id, event_time, event_address) VALUES ('101', '12/23/2023 @ 5PM', '673 W 27th Ave');
INSERT INTO Participate (member_id, event_time, event_address) VALUES ('026', '10/27/2023 @ 11AM', '2221 E 33rd Ave');
INSERT INTO Participate (member_id, event_time, event_address) VALUES ('010', '01/09/2024 @ 7PM', '333 W Broadway');

INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('001', '10/31/2023 @ 7PM', '1234 Main St');
INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('002', '11/09/2023 @ 6PM', '1234 Main St');
INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('101', '12/23/2023 @ 5PM', '673 W 27th Ave');
INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('026', '10/27/2023 @ 11AM', '2221 E 33rd Ave');
INSERT INTO Schedule (member_id, event_time, event_address) VALUES ('010', '01/09/2024 @ 7PM', '333 W Broadway');
