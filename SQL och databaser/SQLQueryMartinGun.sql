CREATE DATABASE Martinsbutik; -- Skapar database med CREATE DATABASE ...;

USE Martinsbutik; -- Anv�nder USE Database namnet f�r att kunna l�gga till saker i den databasen samt �ndra.

-- CREATE TABLE F�R ATT SKAPA TABELL SOM HETER KUNDER
CREATE TABLE kunder (
		KunderID int NOT NULL IDENTITY PRIMARY KEY, -- KunderID �r primary key som identifieras med int NOT NULL IDENTITY PRIMARY KEY
		F�rnamn varchar(50), -- varchar(50) betyder lagrar h�gst 50 tecken.
		Efternamn varchar(50),
		Adress varchar(50),
		Telefon varchar(20),
);

SELECT * FROM kunder; -- V�ljer allt = (*) fr�n kunder.
-- Med insert into kan jag v�lja vart jag vill l�gga till saker. tabbelnamnet(vilken column,)
-- l�gger till v�rlden som jag vill ha i min database med Values('');
INSERT INTO Kunder(F�rnamn,Efternamn,Adress,Telefon)
VALUES('Martin','Gun','�ngermannagatan 1','074900295');
INSERT INTO Kunder(F�rnamn,Efternamn,Adress,Telefon)
VALUES('Martin','Gun','�ngermannagatan 1','074900295');
INSERT INTO Kunder(F�rnamn,Efternamn,Adress,Telefon)
VALUES('Martin','Martinsson','Blackeberg 12','074924295');
INSERT INTO Kunder(F�rnamn,Efternamn,Adress,Telefon)
VALUES('Martina','Erkisson','sturegatan 13','074933295');
INSERT INTO Kunder(F�rnamn,Efternamn,Adress,Telefon)
VALUES('Martina','Martinasson','Loggatan 19','074900266');
INSERT INTO Kunder(F�rnamn,Efternamn,Adress,Telefon)
VALUES('Olaf','olafsson','drakev�gen 29','074913565');


SELECT * FROM kunder; -- V�ljer alla fr�n kunder.

-- Om jag vill UPDATERAR n�got anv�nder jag UPDATE tabell SET Vilken Column.
UPDATE kunder SET F�rnamn = 'Erik',	Efternamn = 'Eriksson', Adress = 'Mariagatan 20', Telefon = '0792555334' WHERE KunderID = 1;

SELECT * FROM kunder WHERE KunderID=1; -- d�r kunderid �r 1 visar bara den.

-- CREATE TABLE F�R ATT SKAPA TABELL SOM HETER Frakt

CREATE TABLE Frakt (
		FraktID int NOT NULL IDENTITY PRIMARY KEY, -- �r primary key som identifieras med int NOT NULL IDENTITY PRIMARY KEY
		FraktBolag varchar(50),
		Plats varchar(50),
		Mobilnummer varchar(50),
		Utskickat DATETIME, -- l�gger till en som jag vill ta bort sen med alter table drop f�r att visa CRUD
);

SELECT * FROM Frakt

ALTER TABLE Frakt
	DROP COLUMN Utskickat; -- tar bort column jag inte vill ha i frakt table.

ALTER TABLE Frakt -- L�GGER TILL NYA COLUMN I TABELLEN MED ALTER TABLE ADD
	ADD Hemleverans char(3); -- L�GGER TILL 

SELECT * FROM Frakt

-- Med insert into kan jag v�lja vart jag vill l�gga till saker. tabbelnamnet(vilken column,)
-- l�gger till v�rlden som jag vill ha i min database med Values('');
INSERT INTO Frakt(FraktBolag,Plats,Mobilnummer,Hemleverans)
VALUES('PostNord', 'Stockholm', '08-133133', 'Ja');
INSERT INTO Frakt(FraktBolag,Plats,Mobilnummer,Hemleverans)
VALUES('DHL', 'Malm�', '08-536222', 'Ja');


SELECT * FROM Frakt; --KOLLAR S� JAG HAR DEM NYA KOLUMN.

CREATE TABLE Produkt (
		ProduktID int NOT NULL IDENTITY PRIMARY KEY, -- �r primary key som identifieras med int NOT NULL IDENTITY PRIMARY KEY
		ProduktNamn varchar(50),
		Antal varchar(50),
		Pris float, -- Pris med float ifall �re ska vara med.
		Beskrivning varchar(50),
		FraktID int NOT NULL REFERENCES Frakt(FraktID), -- Foregin key in not null sen references table(ID)

);


SELECT * FROM Produkt;

-- Med insert into kan jag v�lja vart jag vill l�gga till saker. tabbelnamnet(vilken column,)
-- l�gger till v�rlden som jag vill ha i min database med Values('');
INSERT INTO Produkt(ProduktNamn,Antal,Pris,Beskrivning,FraktID)
VALUES('PEN123','10','20','Penna','1');
INSERT INTO Produkt(ProduktNamn,Antal,Pris,Beskrivning,FraktID)
VALUES('SUD123','10','10','Suddgummi','2');
INSERT INTO Produkt(ProduktNamn,Antal,Pris,Beskrivning,FraktID)
VALUES('P�rm123','10','30','p�rmfodral','1');
INSERT INTO Produkt(ProduktNamn,Antal,Pris,Beskrivning,FraktID)
VALUES('Stress123','20','20','Stressboll','2');

SELECT * FROM Produkt;


CREATE TABLE Best�llning (
		Best�llningID int NOT NULL IDENTITY PRIMARY KEY, -- �r primary key som identifieras med int NOT NULL IDENTITY PRIMARY KEY
		KunderID int NOT NULL REFERENCES Kunder(KunderID), -- Foregin key int not null sen references table(ID)
		ProduktID int NOT NULL REFERENCES Produkt(ProduktID), -- Foregin key int not null sen references table(ID)
		Best�llningsdatum DATETIME, -- DATETIME YYYY-MM-DD HH:MM:SS
		FraktID int NOT NULL REFERENCES Frakt(FraktID),-- Foregin key int not null sen references table(ID)

);

-- Med insert into kan jag v�lja vart jag vill l�gga till saker. tabbelnamnet(vilken column,)
-- l�gger till v�rlden som jag vill ha i min database med Values('');
INSERT INTO Best�llning(KunderID,ProduktID,Best�llningsdatum,FraktID)
VALUES('1', '2', '2022-12-12 18:30:15', '2');
INSERT INTO Best�llning(KunderID,ProduktID,Best�llningsdatum,FraktID)
VALUES('3', '1', '2022-12-13 19:36:35', '1');
INSERT INTO Best�llning(KunderID,ProduktID,Best�llningsdatum,FraktID)
VALUES('2', '4', '2022-12-12 11:30:11', '2');
INSERT INTO Best�llning(KunderID,ProduktID,Best�llningsdatum,FraktID)
VALUES('4', '3', '2022-12-13 19:56:39', '1');
INSERT INTO Best�llning(KunderID,ProduktID,Best�llningsdatum,FraktID)
VALUES('6', '1', '2022-12-12 22:30:16', '1');
INSERT INTO Best�llning(KunderID,ProduktID,Best�llningsdatum,FraktID)
VALUES('5', '3', '2022-12-13 12:36:25', '2');

SELECT TOP 3 * FROM Best�llning -- Tar med top 3 rader fr�n 1-3 fr�n tabllen 

-- INNER JOIN, H�r g�r jag en innerjoin f�r att se vilket fraktbolag som skickas respektiva produkter.
SELECT Frakt.*, Produkt.*
FROM Frakt
INNER JOIN Produkt ON Frakt.FraktID=Produkt.FraktID
ORDER BY Frakt.FraktBolag; -- order by s� sorterar jag i alfabetisk ordning 
-- DHL sen PostNord

-- NESTED QUERIES �r querie i en querie select from where sen ( select from where)
SELECT kunder.F�rnamn, kunder.Efternamn
FROM kunder
WHERE kunder.KunderID IN (
	SELECT Best�llning.KunderID
	FROM Best�llning
	WHERE Best�llning.FraktID < 2
);
-- kunder Martin Martinsson, Martina eriksson och olaf olafsson. har fraktid mindre �n 2 s� fraktid 1 som �r PostNord som leverant�r. 


-- DATUM f� ut specifkt datum fr�n listan best�llning

SELECT * FROM Best�llning WHERE Best�llningsdatum = '2022-12-12 18:30:15'

-- range visar listan av produkter som har prise mellan 10 och upp till 20 kr, d� f�r vi upp 3 varor d�.

SELECT * FROM Produkt
WHERE Pris BETWEEN 10 AND 20;

-- group by

SELECT Count(Best�llning.KunderID), Best�llning.ProduktID -- group by med count r�knar hur m�nga kunder har k�pt dem 4 olika varorna
FROM Best�llning
GROUP BY Best�llning.ProduktID
HAVING Best�llning.ProduktID IS NOT NULL; -- ser att 2 kunder har k�pt produkt 1, 1 kund har k�pt produkt 2, 
-- 2 kunder har k�pt produkt 3, 1 kund har k�pt proukt 4.


--  @variabel F�rnamn med att declare f�rnamn och s�tta F�rnamn Martin s� f�r jag ut alla Martin med adress och efternamn 

DECLARE @F�rnamn varchar(50)
SET @F�rnamn = 'Martin'

SELECT Efternamn, Adress,F�rnamn
FROM kunder 
WHERE F�rnamn = @F�rnamn

-- Nu med alla som har namnet f�rnamn med variable kan man bara �ndra namnet i ''

DECLARE @F�rnamn varchar(50)
SET @F�rnamn = 'Martina'

SELECT Efternamn, Adress,F�rnamn
FROM kunder 
WHERE F�rnamn = @F�rnamn

--Mattefunktion AVG

SELECT AVG(Pris)
FROM Produkt;

-- hittar det genomsnittliga priset p� alla produkter:

