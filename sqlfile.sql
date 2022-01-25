CREATE TABLE Resident_Address (
                                  phone INTEGER PRIMARY KEY,
                                  address CHAR(20));

CREATE TABLE Deliveries (
                            did INTEGER PRIMARY KEY,
                            date DATE);

CREATE TABLE Side_Effects (
    Name CHAR(20) PRIMARY KEY);

CREATE TABLE Vaccine (
    company CHAR(20) PRIMARY KEY);

CREATE TABLE Vaccine_Centre (
                                name CHAR(20) PRIMARY KEY,
                                ZIP CHAR(10));

CREATE TABLE Staff (
                       eid INTEGER PRIMARY KEY,
                       name CHAR(20));

CREATE TABLE Front_Desk (
                            eid integer PRIMARY KEY,
                            Name Char(20));

CREATE TABLE Centre_Address (
                                ZIP CHAR(10) PRIMARY KEY,
                                City CHAR(20),
                                Country CHAR(20));

CREATE TABLE Induce (
                        name CHAR(20),
                        company CHAR(20),
                        PRIMARY KEY (name, company),
                        FOREIGN KEY (name) REFERENCES Side_Effects(name) ON DELETE CASCADE,
                        FOREIGN KEY (company) REFERENCES Vaccine(company) ON DELETE CASCADE);

CREATE TABLE Room_Has (
                          number INTEGER,
                          name CHAR(20),
                          PRIMARY KEY(number, name),
                          FOREIGN KEY (name) REFERENCES Vaccine_Centre(name) ON DELETE NO ACTION);

CREATE TABLE Delivers (
                          company Char(20),
                          did integer,
                          name CHAR(20),
                          PRIMARY KEY (company, did, name),
                          FOREIGN KEY (did) REFERENCES Deliveries(DID) ON DELETE CASCADE,
                          FOREIGN KEY (company) REFERENCES Vaccine(Company) ON DELETE NO ACTION,
                          FOREIGN KEY (name) REFERENCES Vaccine_Centre(Name) ON DELETE NO ACTION);

CREATE TABLE Nurse_Assigned_To (
                                   eid INTEGER PRIMARY KEY,
                                   name CHAR(20),
                                   number INTEGER NOT NULL,
                                   centreName CHAR(20) NOT NULL,
                                   FOREIGN KEY (number) REFERENCES Room_Has(number) ON DELETE NO ACTION,
                                   FOREIGN KEY (centreName) REFERENCES Vaccine_Centre(name));

CREATE TABLE Staff_Works_At (
                          name CHAR(20),
                          eid INTEGER,
                          PRIMARY KEY (name, eid),
                          FOREIGN KEY (name) REFERENCES Vaccine_Centre(name) ON DELETE NO ACTION,
                          FOREIGN KEY (eid) REFERENCES Staff(eid) ON DELETE CASCADE);

CREATE TABLE Front_Works_At (
                                name CHAR(20),
                                eid INTEGER,
                                PRIMARY KEY (name, eid),
                                FOREIGN KEY (name) REFERENCES Vaccine_Centre(name) ON DELETE NO ACTION,
                                FOREIGN KEY (eid) REFERENCES Front_Desk(eid) ON DELETE CASCADE);

CREATE TABLE Resident (
                          hin INTEGER PRIMARY KEY,
                          doseNumber INTEGER,
                          name CHAR(20),
                          age integer,
                          phone INTEGER NOT NULL,
                          FOREIGN KEY (phone) REFERENCES Resident_Address(phone) ON DELETE CASCADE);

CREATE TABLE Administers (
                             company CHAR(20),
                             eid INTEGER,
                             hin INTEGER,
                             PRIMARY KEY(company, hin, eid),
                             FOREIGN KEY (company) REFERENCES Vaccine(company) ON DELETE CASCADE,
                             FOREIGN KEY (hin) REFERENCES Resident(hin) ON DELETE CASCADE,
                             FOREIGN KEY (eid) REFERENCES Nurse_Assigned_To(eid) ON DELETE CASCADE);

CREATE TABLE Appointment_Books (
                             aid INTEGER  PRIMARY KEY AUTO_INCREMENT,
                             day DATE,
                             hin INTEGER NOT NULL,
                             FOREIGN KEY (hin) REFERENCES Resident(hin) ON DELETE NO ACTION);

CREATE TABLE Exhibit (
                         name CHAR(20),
                         hin INTEGER,
                         PRIMARY KEY (name, hin),
                         FOREIGN KEY (name) REFERENCES Side_Effects(name) ON DELETE CASCADE,
                         FOREIGN KEY (hin) REFERENCES Resident(hin) ON DELETE CASCADE);

CREATE TABLE Vaccination_Certificate_Generate (
                                                  cid INTEGER PRIMARY KEY AUTO_INCREMENT,
                                                  hin INTEGER NOT NULL,
                                                  eid INTEGER NOT NULL,
                                                  FOREIGN KEY (hin) REFERENCES Resident(hin) ON DELETE NO ACTION,
                                                  FOREIGN KEY (eid) REFERENCES Front_Desk(eid) ON DELETE NO ACTION);

INSERT INTO `resident_address` (`phone`, `address`) VALUES ('2147295980', 'V6T 1Z1');
INSERT INTO `resident_address` (`phone`, `address`) VALUES ('2147295981', 'V6T 1Z2');
INSERT INTO `resident_address` (`phone`, `address`) VALUES ('2147295982', 'V6T 1Z3');
INSERT INTO `resident_address` (`phone`, `address`) VALUES ('2147295983', 'V6T 1Z4');
INSERT INTO `resident_address` (`phone`, `address`) VALUES ('2147295984', 'V6T 1Z5');

INSERT INTO `resident` (`hin`, `doseNumber`, `name`, `age`, `phone`) VALUES ('1111', '0', 'Mahmoud Al Khatib', '21', '2147295980');
INSERT INTO `resident` (`hin`, `doseNumber`, `name`, `age`, `phone`) VALUES ('1112', '1', 'Mahitab Emara', '9', '2147295981');
INSERT INTO `resident` (`hin`, `doseNumber`, `name`, `age`, `phone`) VALUES ('1113', '2', 'Hasan Siddiqui', '21', '2147295982');
INSERT INTO `resident` (`hin`, `doseNumber`, `name`, `age`, `phone`) VALUES ('1114', '2', 'James Taylor', '76', '2147295983');
INSERT INTO `resident` (`hin`, `doseNumber`, `name`, `age`, `phone`) VALUES ('1115', '1', 'Bilal Abdallah', '91', '2147295984');

INSERT INTO `appointment` (`day`, `hin`) VALUES ('2021-06-01', '1111');
INSERT INTO `appointment` (`day`, `hin`) VALUES ('2021-06-01', '1112');
INSERT INTO `appointment` (`day`, `hin`) VALUES ('2021-06-01', '1113');
INSERT INTO `appointment` (`day`, `hin`) VALUES ('2021-06-01', '1114');
INSERT INTO `appointment` (`day`, `hin`) VALUES ('2021-06-01', '1115');

INSERT INTO `staff` (`eid`, `name`) VALUES ('3111', 'Ross Geller');
INSERT INTO `staff` (`eid`, `name`) VALUES ('3112', 'Amy Green');
INSERT INTO `staff` (`eid`, `name`) VALUES ('3113', 'Chanandler Bong');
INSERT INTO `staff` (`eid`, `name`) VALUES ('3114', 'Omar Emara');
INSERT INTO `staff` (`eid`, `name`) VALUES ('3115', 'Ahmed Samy');

INSERT INTO `front_desk` (`eid`, `Name`) VALUES ('6111', 'Geller Rose');
INSERT INTO `front_desk` (`eid`, `Name`) VALUES ('6112', 'Green Amy');
INSERT INTO `front_desk` (`eid`, `Name`) VALUES ('6113', 'Chandler Bing');
INSERT INTO `front_desk` (`eid`, `Name`) VALUES ('6114', 'Regina Phalange');
INSERT INTO `front_desk` (`eid`, `Name`) VALUES ('6115', 'Ken Adams');

INSERT INTO `vaccine_centre` (`name`, `ZIP`) VALUES ('Vaccine Centre 1', 'V6T 1W1');
INSERT INTO `vaccine_centre` (`name`, `ZIP`) VALUES ('Vaccine Centre 2', 'V6T 1W2');
INSERT INTO `vaccine_centre` (`name`, `ZIP`) VALUES ('Vaccine Centre 3', 'V6T 1W3');
INSERT INTO `vaccine_centre` (`name`, `ZIP`) VALUES ('Vaccine Centre 4', 'V6T 1W4');
INSERT INTO `vaccine_centre` (`name`, `ZIP`) VALUES ('Vaccine Centre 5', 'V6T 1W5');

INSERT INTO `staff_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 1', '3111');
INSERT INTO `staff_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 2', '3112');
INSERT INTO `staff_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 1', '3113');
INSERT INTO `staff_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 1', '3114');
INSERT INTO `staff_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 1', '3115');

INSERT INTO `front_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 1', '6111');
INSERT INTO `front_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 2', '6112');
INSERT INTO `front_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 1', '6113');
INSERT INTO `front_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 1', '6114');
INSERT INTO `front_works_at` (`name`, `eid`) VALUES ('Vaccine Centre 1', '6115');

INSERT INTO `vaccination_certificate_generate` (`hin`, `eid`) VALUES ('1111', '6111');
INSERT INTO `vaccination_certificate_generate` (`hin`, `eid`) VALUES ('1112', '6112');
INSERT INTO `vaccination_certificate_generate` (`hin`, `eid`) VALUES ('1113', '6113');
INSERT INTO `vaccination_certificate_generate` (`hin`, `eid`) VALUES ('1114', '6114');
INSERT INTO `vaccination_certificate_generate` (`hin`, `eid`) VALUES ('1115', '6115');

INSERT INTO `side_effects` (`Name`) VALUES ('headache');
INSERT INTO `side_effects` (`Name`) VALUES ('muscle ache');
INSERT INTO `side_effects` (`Name`) VALUES ('vomiting');
INSERT INTO `side_effects` (`Name`) VALUES ('fever');
INSERT INTO `side_effects` (`Name`) VALUES ('fatigue');

INSERT INTO `deliveries` (`did`, `date`) VALUES ('2111', '2021-06-01');
INSERT INTO `deliveries` (`did`, `date`) VALUES ('2112', '2021-06-01');
INSERT INTO `deliveries` (`did`, `date`) VALUES ('2113', '2021-06-04');
INSERT INTO `deliveries` (`did`, `date`) VALUES ('2114', '2021-06-03');
INSERT INTO `deliveries` (`did`, `date`) VALUES ('2115', '2021-06-02');

INSERT INTO `vaccine` (`company`) VALUES ('Pfizer');
INSERT INTO `vaccine` (`company`) VALUES ('AstraZeneca');
INSERT INTO `vaccine` (`company`) VALUES ('Moderna');
INSERT INTO `vaccine` (`company`) VALUES ('BioNTech');
INSERT INTO `vaccine` (`company`) VALUES ('Novavax');

INSERT INTO `induce` (`name`, `company`) VALUES ('headache', 'Pfizer');
INSERT INTO `induce` (`name`, `company`) VALUES ('muscle ache', 'AstraZeneca');
INSERT INTO `induce` (`name`, `company`) VALUES ('vomiting', 'Moderna');
INSERT INTO `induce` (`name`, `company`) VALUES ('fever', 'AstraZeneca');
INSERT INTO `induce` (`name`, `company`) VALUES ('fatigue', 'Pfizer');

INSERT INTO `exhibit` (`name`, `hin`) VALUES ('fever', '1111');
INSERT INTO `exhibit` (`name`, `hin`) VALUES ('vomiting', '1111');
INSERT INTO `exhibit` (`name`, `hin`) VALUES ('muscle ache', '1111');
INSERT INTO `exhibit` (`name`, `hin`) VALUES ('fatigue', '1111');
INSERT INTO `exhibit` (`name`, `hin`) VALUES ('headache', '1111');
INSERT INTO `exhibit` (`name`, `hin`) VALUES ('muscle ache', '1113');
INSERT INTO `exhibit` (`name`, `hin`) VALUES ('headache', '1113');
INSERT INTO `exhibit` (`name`, `hin`) VALUES ('headache', '1112');

INSERT INTO `centre_address` (`ZIP`, `City`, `Country`) VALUES ('V6T 1W1', 'Vancouver', 'Canada');
INSERT INTO `centre_address` (`ZIP`, `City`, `Country`) VALUES ('V6T 1W2', 'Vancouver', 'Canada');
INSERT INTO `centre_address` (`ZIP`, `City`, `Country`) VALUES ('V6T 1W3', 'Burnaby', 'Canada');
INSERT INTO `centre_address` (`ZIP`, `City`, `Country`) VALUES ('V6T 1W4', 'London', 'UK');
INSERT INTO `centre_address` (`ZIP`, `City`, `Country`) VALUES ('V6T 1W5', 'Gaza', 'Palestine');

INSERT INTO `delivers` (`company`, `did`, `name`) VALUES ('Pfizer', '2111', 'Vaccine Centre 1');
INSERT INTO `delivers` (`company`, `did`, `name`) VALUES ('Moderna', '2112', 'Vaccine Centre 2');
INSERT INTO `delivers` (`company`, `did`, `name`) VALUES ('AstraZeneca', '2113', 'Vaccine Centre 3');
INSERT INTO `delivers` (`company`, `did`, `name`) VALUES ('BioNTech', '2114', 'Vaccine Centre 4');
INSERT INTO `delivers` (`company`, `did`, `name`) VALUES ('Novavax', '2115', 'Vaccine Centre 5');

INSERT INTO `room_has` (`number`, `name`) VALUES ('5001', 'Vaccine Centre 1');
INSERT INTO `room_has` (`number`, `name`) VALUES ('5002', 'Vaccine Centre 2');
INSERT INTO `room_has` (`number`, `name`) VALUES ('5003', 'Vaccine Centre 3');
INSERT INTO `room_has` (`number`, `name`) VALUES ('5004', 'Vaccine Centre 4');
INSERT INTO `room_has` (`number`, `name`) VALUES ('5005', 'Vaccine Centre 5');

INSERT INTO `nurse_assigned_to` (`eid`, `name`, `number`, `centreName`) VALUES ('3211', 'Rachel Green', '5001', 'Vaccine Centre 1');
INSERT INTO `nurse_assigned_to` (`eid`, `name`, `number`, `centreName`) VALUES ('3212', 'Monica Geller', '5002', 'Vaccine Centre 2');
INSERT INTO `nurse_assigned_to` (`eid`, `name`, `number`, `centreName`) VALUES ('3213', 'Pheobe Buffay', '5003', 'Vaccine Centre 3');
INSERT INTO `nurse_assigned_to` (`eid`, `name`, `number`, `centreName`) VALUES ('3214', 'Jill Green', '5004', 'Vaccine Centre 4');
INSERT INTO `nurse_assigned_to` (`eid`, `name`, `number`, `centreName`) VALUES ('3215', 'Joey Tribbiani', '5005', 'Vaccine Centre 5');

INSERT INTO `administers` (`company`, `hin`, `eid`) VALUES ('Pfizer', '1114', '3211');
INSERT INTO `administers` (`company`, `hin`, `eid`) VALUES ('Moderna', '1111', '3212');
INSERT INTO `administers` (`company`, `hin`, `eid`) VALUES ('AstraZeneca', '1112', '3213');
INSERT INTO `administers` (`company`, `hin`, `eid`) VALUES ('BioNTech', '1112', '3214');
INSERT INTO `administers` (`company`, `hin`, `eid`) VALUES ('Novavax', '1115', '3215');
