--Alec Boyd, Chelsea Gary, Myra Mullis

CREATE TABLE Property(
        address VARCHAR(50) NOT NULL,
        ownerName VARCHAR(30),
        price INT,
        PRIMARY KEY(address)
);
CREATE TABLE House(
        bedrooms INT,
        bathrooms INT,
        size INT,
        address VARCHAR(50) NOT NULL,
        FOREIGN KEY(address) REFERENCES Property(address)
);
CREATE TABLE BusinessProperty(
        type CHAR(20),
        size INT,
        address VARCHAR(50) NOT NULL,
        FOREIGN KEY(address) REFERENCES Property(address)
);
CREATE TABLE Firm(
        id INT NOT NULL,
        name VARCHAR(30),
        address VARCHAR(50),
        PRIMARY KEY(id)
);
CREATE TABLE Agent(
        agentId INT NOT NULL,
        name VARCHAR(30),
        phone CHAR(12),
        firmId INT,
        dateStarted DATE,
        PRIMARY KEY(agentId),
        FOREIGN KEY(firmId) REFERENCES Firm(id)
);
CREATE TABLE Listings(
        address VARCHAR(50) NOT NULL,
        agentId INT,
        mlsNumber INT PRIMARY KEY,
        dateListed DATE,
        FOREIGN KEY(address) REFERENCES Property(address),
        FOREIGN KEY(agentId) REFERENCES Agent(agentId)
);
CREATE TABLE Buyer(
        id INT NOT NULL,
        name VARCHAR(30),
        phone CHAR(12),
        propertyType CHAR(20),
        bedrooms INT,
        bathrooms INT,
        businessPropertyType CHAR(20),
        minimumPreferredPrice INT,
        maximumPreferredPrice INT,
        PRIMARY KEY(id)
);
CREATE TABLE Works_With(
        buyerId INT,
        agentId INT,
        FOREIGN KEY (buyerId) REFERENCES Buyer(id),
        FOREIGN KEY (agentId) REFERENCES Agent(agentId)
);


-- now insert random records, at least 5 for each table
-- must insert enough records so that each query returns at least 1

-- Property ( address: VARCHAR(50), ownerName: VARCHAR(30), price INTEGER )
INSERT INTO Property
VALUES('20 Ingram Street', 'Peter Parker', 250000);

INSERT INTO Property
VALUES('742 Evergreen Terrace', 'Homer Simpson', 120000);

INSERT INTO Property
VALUES('1770 James Street', 'Charlie Brown', 90500);

INSERT INTO Property
VALUES('90 Adams Way', 'Bob Roberts', 930000);

INSERT INTO Property
VALUES('1007 Mountain Drive', 'Bruce Wayne', 4700000);

INSERT INTO Property
VALUES('100 Money Drive', 'Sam Smith', 110500);

INSERT INTO Property
VALUES('123 Main Street', 'Tim Cook', 1300500);

INSERT INTO Property
VALUES('99 Broadway Boulevard', 'Olivia Pope', 6000000);

INSERT INTO Property
VALUES('2650 Union Road', 'Leslie Knope', 800550);

INSERT INTO Property
VALUES('24 Railroad Avenue', 'Sandra Smith', 2000000);

INSERT INTO Property
VALUES('700 Spring Street', 'Linda Johnson', 4550000);



--House(bedrooms: INTEGER, bathrooms: INTEGER, size INTEGER, address: VARCHAR(50))
INSERT INTO House
VALUES( 2, 2, 1000, '20 Ingram Street');

INSERT INTO House
VALUES( 3, 2, 2500, '742 Evergreen Terrace');

INSERT INTO House
VALUES( 3, 2, 1900, '1770 James Street');

INSERT INTO House
VALUES( 5, 5, 4000, '90 Adams Way');

INSERT INTO House
VALUES( 7, 9, 9000, '1007 Mountain Drive');

INSERT INTO House
VALUES( 3, 2, 3000, '100 Money Drive');


--BusinessProperty(type: CHAR(20), size: INTEGER, address: VARCHAR(50))
INSERT INTO BusinessProperty
VALUES('store', 900, '123 Main Street');

INSERT INTO BusinessProperty
VALUES('office', 6800, '99 Broadway Boulevard');

INSERT INTO BusinessProperty
VALUES('office', 5000, '2650 Union Road');

INSERT INTO BusinessProperty
VALUES('warehouse', 25000, '24 Railroad Avenue');

INSERT INTO BusinessProperty
VALUES('hotel', 40000, '700 Spring Street');



--Firm ( id: INTEGER, name: VARCHAR(30), address VARCHAR(50) )
INSERT INTO Firm
VALUES(1000, 'Mountain Real Estate', '22 East Drive');

INSERT INTO Firm
VALUES(2000, 'Ocean Real Estate', '4523 Ocean Avenue');

INSERT INTO Firm
VALUES(3000, 'The Main Group', '9876 Main Road');

INSERT INTO Firm
VALUES(4000, 'Joe Smith Real Estate', '456 Long Drive');

INSERT INTO Firm
VALUES(5000, 'City Group', '2267 43rd Boulevard');


--Agent ( agentId: INTEGER, name VARCHAR(30), phone CHAR(12), firmId INTEGER, dateStarted DATE )
INSERT INTO Agent
VALUES(001, 'Daniel Green', '850-333-1234', 1000, '1999-05-10');

INSERT INTO Agent
VALUES(002, 'Emma Jane', '456-212-5643', 2000, '2010-11-24');

INSERT INTO Agent
VALUES(003, 'Kelly Brown', '343-567-2345', 3000, '1997-02-18');

INSERT INTO Agent
VALUES(004, 'Joe Thomas', '789-567-3232', 4000, '2020-04-23');

INSERT INTO Agent
VALUES(005, 'Kyle Lee', '850-743-3254', 5000, '2005-03-01');



--Listings ( address: VARCHAR(50), agentId: INTEGER, mlsNumber: INTEGER, dateListed DATE)
INSERT INTO Listings
VALUES('20 Ingram Street',001 ,12345, '2019-11-15');

INSERT INTO Listings
VALUES('742 Evergreen Terrace',002, 54321, '2020-03-21');

INSERT INTO Listings
VALUES('1770 James Street',003, 98765, '2018-10-29');

INSERT INTO Listings
VALUES('90 Adams Way',004, 8762, '2019-06-17');

INSERT INTO Listings
VALUES('1007 Mountain Drive',005, 54678, '2019-08-01');

INSERT INTO Listings
VALUES('100 Money Drive',005, 99234, '2018-12-01');

INSERT INTO Listings
VALUES('123 Main Street',004, 43562, '2020-01-31');

INSERT INTO Listings
VALUES('99 Broadway Boulevard',003, 789123, '2019-05-18');

INSERT INTO Listings
VALUES('2650 Union Road',002, 549812, '2017-12-03');

INSERT INTO Listings
VALUES('24 Railroad Avenue',001, 192837, '2019-03-12');

INSERT INTO Listings
VALUES('700 Spring Street',002, 11223344, '2020-02-29');



/*Buyer ( id: INTEGER, name VARCHAR(30), phone CHAR(12), propertyType: CHAR(20),
bedrooms INTEGER, bathrooms INTEGER, businessPropertyType: CHAR(20) ),
minimumPreferredPrice: INTEGER, maximumPreferredPrice: INTEGER )
*/
INSERT INTO Buyer
VALUES(123456, 'Joe Smith', '850-765-4321', 'House', 2, 2, NULL, 200000, 260000);

INSERT INTO Buyer
VALUES(903789, 'Elle Woods', '951-464-3927', 'Business', NULL, NULL, 'hotel', 3000000, 5000000);

INSERT INTO Buyer
VALUES(839589, 'Meredith Grey', '836-289-4738', 'House', 5, 5, NULL, 800000, 1000000);

INSERT INTO Buyer
VALUES(294738, 'John Johnson', '207-283-8876', 'Business', NULL, NULL, 'office', 5000000, 6500000);

INSERT INTO Buyer
VALUES(492764, 'Jane Leigh', '123-456-7890', 'House',3, 2, NULL, 80000, 130000);



--Works_With( buyerId: INTEGER, agentID:INTEGER )
INSERT INTO Works_With
VALUES(123456, 001);

INSERT INTO Works_With
VALUES(903789, 002);

INSERT INTO Works_With
VALUES(839589, 003);

INSERT INTO Works_With
VALUES(294738, 004);

INSERT INTO Works_With
VALUES(492764, 005);
