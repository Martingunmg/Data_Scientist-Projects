CREATE DATABASE Martinsbutik; -- Skapar database med CREATE DATABASE ...;

USE Martinsbutik; -- Använder USE Database namnet för att kunna lägga till saker i den databasen samt ändra.

-- CREATE TABLE FÖR ATT SKAPA TABELL SOM HETER KUNDER
CREATE TABLE kunder (
		KunderID int NOT NULL IDENTITY PRIMARY KEY, -- KunderID är primary key som identifieras med int NOT NULL IDENTITY PRIMARY KEY
		Förnamn varchar(50), -- varchar(50) betyder lagrar högst 50 tecken.
		Efternamn varchar(50),
		Adress varchar(50),
		Telefon varchar(20),
);

SELECT * FROM kunder; -- Väljer allt = (*) från kunder.
-- Med insert into kan jag välja vart jag vill lägga till saker. tabbelnamnet(vilken column,)
-- lägger till världen som jag vill ha i min database med Values('');
INSERT INTO Kunder(Förnamn,Efternamn,Adress,Telefon)
VALUES('Martin','Gun','Ångermannagatan 1','074900295');
INSERT INTO Kunder(Förnamn,Efternamn,Adress,Telefon)
VALUES('Martin','Gun','Ångermannagatan 1','074900295');
INSERT INTO Kunder(Förnamn,Efternamn,Adress,Telefon)
VALUES('Martin','Martinsson','Blackeberg 12','074924295');
INSERT INTO Kunder(Förnamn,Efternamn,Adress,Telefon)
VALUES('Martina','Erkisson','sturegatan 13','074933295');
INSERT INTO Kunder(Förnamn,Efternamn,Adress,Telefon)
VALUES('Martina','Martinasson','Loggatan 19','074900266');
INSERT INTO Kunder(Förnamn,Efternamn,Adress,Telefon)
VALUES('Olaf','olafsson','drakevägen 29','074913565');


SELECT * FROM kunder; -- Väljer alla från kunder.

-- Om jag vill UPDATERAR något använder jag UPDATE tabell SET Vilken Column.
UPDATE kunder SET Förnamn = 'Erik',	Efternamn = 'Eriksson', Adress = 'Mariagatan 20', Telefon = '0792555334' WHERE KunderID = 1;

SELECT * FROM kunder WHERE KunderID=1; -- där kunderid är 1 visar bara den.

-- CREATE TABLE FÖR ATT SKAPA TABELL SOM HETER Frakt

CREATE TABLE Frakt (
		FraktID int NOT NULL IDENTITY PRIMARY KEY, -- är primary key som identifieras med int NOT NULL IDENTITY PRIMARY KEY
		FraktBolag varchar(50),
		Plats varchar(50),
		Mobilnummer varchar(50),
		Utskickat DATETIME, -- lägger till en som jag vill ta bort sen med alter table drop för att visa CRUD
);

SELECT * FROM Frakt

ALTER TABLE Frakt
	DROP COLUMN Utskickat; -- tar bort column jag inte vill ha i frakt table.

ALTER TABLE Frakt -- LÄGGER TILL NYA COLUMN I TABELLEN MED ALTER TABLE ADD
	ADD Hemleverans char(3); -- LÄGGER TILL 

SELECT * FROM Frakt

-- Med insert into kan jag välja vart jag vill lägga till saker. tabbelnamnet(vilken column,)
-- lägger till världen som jag vill ha i min database med Values('');
INSERT INTO Frakt(FraktBolag,Plats,Mobilnummer,Hemleverans)
VALUES('PostNord', 'Stockholm', '08-133133', 'Ja');
INSERT INTO Frakt(FraktBolag,Plats,Mobilnummer,Hemleverans)
VALUES('DHL', 'Malmö', '08-536222', 'Ja');


SELECT * FROM Frakt; --KOLLAR SÅ JAG HAR DEM NYA KOLUMN.

CREATE TABLE Produkt (
		ProduktID int NOT NULL IDENTITY PRIMARY KEY, -- är primary key som identifieras med int NOT NULL IDENTITY PRIMARY KEY
		ProduktNamn varchar(50),
		Antal varchar(50),
		Pris float, -- Pris med float ifall öre ska vara med.
		Beskrivning varchar(50),
		FraktID int NOT NULL REFERENCES Frakt(FraktID), -- Foregin key in not null sen references table(ID)

);


SELECT * FROM Produkt;

-- Med insert into kan jag välja vart jag vill lägga till saker. tabbelnamnet(vilken column,)
-- lägger till världen som jag vill ha i min database med Values('');
INSERT INTO Produkt(ProduktNamn,Antal,Pris,Beskrivning,FraktID)
VALUES('PEN123','10','20','Penna','1');
INSERT INTO Produkt(ProduktNamn,Antal,Pris,Beskrivning,FraktID)
VALUES('SUD123','10','10','Suddgummi','2');
INSERT INTO Produkt(ProduktNamn,Antal,Pris,Beskrivning,FraktID)
VALUES('Pärm123','10','30','pärmfodral','1');
INSERT INTO Produkt(ProduktNamn,Antal,Pris,Beskrivning,FraktID)
VALUES('Stress123','20','20','Stressboll','2');

SELECT * FROM Produkt;


CREATE TABLE Beställning (
		BeställningID int NOT NULL IDENTITY PRIMARY KEY, -- är primary key som identifieras med int NOT NULL IDENTITY PRIMARY KEY
		KunderID int NOT NULL REFERENCES Kunder(KunderID), -- Foregin key int not null sen references table(ID)
		ProduktID int NOT NULL REFERENCES Produkt(ProduktID), -- Foregin key int not null sen references table(ID)
		Beställningsdatum DATETIME, -- DATETIME YYYY-MM-DD HH:MM:SS
		FraktID int NOT NULL REFERENCES Frakt(FraktID),-- Foregin key int not null sen references table(ID)

);

-- Med insert into kan jag välja vart jag vill lägga till saker. tabbelnamnet(vilken column,)
-- lägger till världen som jag vill ha i min database med Values('');
INSERT INTO Beställning(KunderID,ProduktID,Beställningsdatum,FraktID)
VALUES('1', '2', '2022-12-12 18:30:15', '2');
INSERT INTO Beställning(KunderID,ProduktID,Beställningsdatum,FraktID)
VALUES('3', '1', '2022-12-13 19:36:35', '1');
INSERT INTO Beställning(KunderID,ProduktID,Beställningsdatum,FraktID)
VALUES('2', '4', '2022-12-12 11:30:11', '2');
INSERT INTO Beställning(KunderID,ProduktID,Beställningsdatum,FraktID)
VALUES('4', '3', '2022-12-13 19:56:39', '1');
INSERT INTO Beställning(KunderID,ProduktID,Beställningsdatum,FraktID)
VALUES('6', '1', '2022-12-12 22:30:16', '1');
INSERT INTO Beställning(KunderID,ProduktID,Beställningsdatum,FraktID)
VALUES('5', '3', '2022-12-13 12:36:25', '2');

SELECT TOP 3 * FROM Beställning -- Tar med top 3 rader från 1-3 från tabllen 

-- INNER JOIN, Här gör jag en innerjoin för att se vilket fraktbolag som skickas respektiva produkter.
SELECT Frakt.*, Produkt.*
FROM Frakt
INNER JOIN Produkt ON Frakt.FraktID=Produkt.FraktID
ORDER BY Frakt.FraktBolag; -- order by så sorterar jag i alfabetisk ordning 
-- DHL sen PostNord

-- NESTED QUERIES är querie i en querie select from where sen ( select from where)
SELECT kunder.Förnamn, kunder.Efternamn
FROM kunder
WHERE kunder.KunderID IN (
	SELECT Beställning.KunderID
	FROM Beställning
	WHERE Beställning.FraktID < 2
);
-- kunder Martin Martinsson, Martina eriksson och olaf olafsson. har fraktid mindre än 2 så fraktid 1 som är PostNord som leverantör. 


-- DATUM få ut specifkt datum från listan beställning

SELECT * FROM Beställning WHERE Beställningsdatum = '2022-12-12 18:30:15'

-- range visar listan av produkter som har prise mellan 10 och upp till 20 kr, då får vi upp 3 varor då.

SELECT * FROM Produkt
WHERE Pris BETWEEN 10 AND 20;

-- group by

SELECT Count(Beställning.KunderID), Beställning.ProduktID -- group by med count räknar hur många kunder har köpt dem 4 olika varorna
FROM Beställning
GROUP BY Beställning.ProduktID
HAVING Beställning.ProduktID IS NOT NULL; -- ser att 2 kunder har köpt produkt 1, 1 kund har köpt produkt 2, 
-- 2 kunder har köpt produkt 3, 1 kund har köpt proukt 4.


--  @variabel Förnamn med att declare förnamn och sätta Förnamn Martin så får jag ut alla Martin med adress och efternamn 

DECLARE @Förnamn varchar(50)
SET @Förnamn = 'Martin'

SELECT Efternamn, Adress,Förnamn
FROM kunder 
WHERE Förnamn = @Förnamn

-- Nu med alla som har namnet förnamn med variable kan man bara ändra namnet i ''

DECLARE @Förnamn varchar(50)
SET @Förnamn = 'Martina'

SELECT Efternamn, Adress,Förnamn
FROM kunder 
WHERE Förnamn = @Förnamn

--Mattefunktion AVG

SELECT AVG(Pris)
FROM Produkt;

-- hittar det genomsnittliga priset på alla produkter:

