--Alec Boyd, Chelsea Gary, Myra Mullis

--query 1
SELECT Listings.address
FROM House, Listings
WHERE House.address = Listings.address;

--query 2
SELECT Listings.address,Listings.mlsNumber
FROM House, Listings
WHERE House.address = Listings.address;

--query 3
SELECT Listings.address
FROM House, Listings
WHERE House.address = Listings.address AND House.bedrooms = 3 AND House.bathrooms = 2;

--query 4
SELECT Property.address, Property.price
FROM House, Property
WHERE House.address = Property.address AND House.bedrooms = 3 AND House.bathrooms = 2
AND Property.price >= 100000 AND Property.price <= 250000 ORDER BY Property.price DESC;

--query 5
SELECT Property.address, Property.price
FROM Property, BusinessProperty
WHERE Property.address = BusinessProperty.address AND BusinessProperty.type = 'office' ORDER BY Property.price DESC;

--query 6
SELECT Agent.agentId, Agent.name, Agent.phone, Firm.name, Agent.dateStarted
FROM Agent, Firm
Where Agent.firmId = Firm.id;

--query 7
SELECT Property.address, Property.ownerName, Property.price
FROM Listings, Property
WHERE Listings.agentId = 001 AND Listings.address = Property.address;

--query 8
SELECT Agent.name AS "Agent Name", Buyer.name AS "Buyer Name"
FROM Agent, Buyer, Works_With
WHERE Works_With.agentId = Agent.agentId AND Works_With.buyerId = Buyer.id ORDER BY Agent.name;

--query 9
SELECT Agent.agentId,   (SELECT COUNT(Works_With.buyerId)
                        FROM Works_With
                        WHERE Agent.agentId = Works_With.agentId)
                        AS "Number of buyers working with agent"
FROM Agent, Buyer, Works_With
WHERE Works_With.agentId = Agent.agentId AND Works_With.buyerId = Buyer.id;


--query 10
SELECT House.*, Property.price
FROM House, Buyer, Property
WHERE Buyer.id = 492764 AND
        Buyer.bedrooms = House.bedrooms AND
        Buyer.bathrooms = House.bathrooms AND
        Buyer.minimumPreferredPrice <= Property.price AND
        Buyer.maximumPreferredPrice >= Property.price AND
	House.address = Property.address
ORDER BY Property.price DESC;
