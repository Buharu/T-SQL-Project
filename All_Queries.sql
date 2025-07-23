
--- Crearea bazei de date
CREATE DATABASE adapost_catei;


--------------------------------------------------------------------------------------------------------------------------
--- Verificarea existentei bazei de date anterior create
SELECT TOP 1 * 
FROM sys.databases
ORDER BY name ASC;


--------------------------------------------------------------------------------------------------------------------------
--- utilizarea bazei de date create anterior
USE adapost_catei;
GO

--------------------------------------------------------------------------------------------------------------------------
--- verificare: daca se foloseste baza de date corecte
SELECT DB_NAME() AS BazaDeDateCurenta;


--------------------------------------------------------------------------------------------------------------------------
--- crearea tabelor necesare aplicatiei 

CREATE TABLE Caini (
    CaineID INT PRIMARY KEY IDENTITY(1,1),
    Nume NVARCHAR(50) NOT NULL,
    Rasa NVARCHAR(50),
    Varsta INT CHECK (Varsta >= 0),
    DataPrimire DATE NOT NULL,
    Adoptat BIT DEFAULT 0
);

CREATE TABLE Adoptii (
    AdoptieID INT PRIMARY KEY IDENTITY(1,1),
    CaineID INT FOREIGN KEY REFERENCES Caini(CaineID),
    NumeAdoptator NVARCHAR(100) NOT NULL,
    DataAdoptie DATE NOT NULL,
    Telefon NVARCHAR(20)
);

CREATE TABLE Tratamente (
    TratamentID INT PRIMARY KEY IDENTITY(1,1),
    CaineID INT FOREIGN KEY REFERENCES Caini(CaineID),
    Descriere NVARCHAR(250) NOT NULL,
    DataTratament DATE NOT NULL,
    Veterinar NVARCHAR(100)
);

CREATE TABLE Voluntari (
    VoluntarID INT PRIMARY KEY IDENTITY(1,1),
    Nume NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE,
    Telefon NVARCHAR(20),
    Activ BIT DEFAULT 1
);

CREATE TABLE Donatii (
    DonatieID INT PRIMARY KEY IDENTITY(1,1),
    VoluntarID INT FOREIGN KEY REFERENCES Voluntari(VoluntarID),
    Suma DECIMAL(10,2) CHECK (Suma > 0),
    DataDonatie DATE NOT NULL,
	Descriere VARCHAR(100)
);



--------------------------------------------------------------------------------------------------------------------------
-- Popularea tabeloror

INSERT INTO Caini (Nume, Rasa, Varsta, DataPrimire, Adoptat) VALUES
('Caine_1', 'Labrador', 3, '2023-06-15', 1),
('Caine_2', 'Bulldog', 5, '2023-07-20', 0),
('Caine_3', 'Beagle', 4, '2023-06-10', 1),
('Caine_4', 'Ciobanesc', 7, '2023-07-01', 0),
('Caine_5', 'Pudel', 2, '2023-05-23', 1),
('Caine_6', 'Husky', 6, '2023-06-30', 0),
('Caine_7', 'Mops', 3, '2023-07-05', 1),
('Caine_8', 'Teckel', 4, '2023-06-20', 0),
('Caine_9', 'Chow Chow', 5, '2023-07-10', 1),
('Caine_10', 'Golden', 7, '2023-05-15', 0),
('Caine_11', 'Labrador', 2, '2023-06-01', 1),
('Caine_12', 'Bulldog', 3, '2023-07-12', 0),
('Caine_13', 'Beagle', 5, '2023-06-25', 1),
('Caine_14', 'Ciobanesc', 6, '2023-07-03', 0),
('Caine_15', 'Pudel', 4, '2023-05-30', 1),
('Caine_16', 'Husky', 7, '2023-06-28', 0),
('Caine_17', 'Mops', 3, '2023-07-01', 1),
('Caine_18', 'Teckel', 5, '2023-06-18', 0),
('Caine_19', 'Chow Chow', 4, '2023-07-08', 1),
('Caine_20', 'Golden', 6, '2023-05-20', 0),
('Caine_21', 'Labrador', 5, '2023-06-02', 1),
('Caine_22', 'Bulldog', 4, '2023-07-14', 0),
('Caine_23', 'Beagle', 3, '2023-06-22', 1),
('Caine_24', 'Ciobanesc', 7, '2023-07-05', 0),
('Caine_25', 'Pudel', 2, '2023-05-27', 1),
('Caine_26', 'Husky', 6, '2023-06-29', 0),
('Caine_27', 'Mops', 5, '2023-07-03', 1),
('Caine_28', 'Teckel', 4, '2023-06-15', 0),
('Caine_29', 'Chow Chow', 3, '2023-07-09', 1),
('Caine_30', 'Golden', 7, '2023-05-18', 0),
('Caine_31', 'Labrador', 4, '2023-06-03', 1),
('Caine_32', 'Bulldog', 5, '2023-07-13', 0),
('Caine_33', 'Beagle', 6, '2023-06-21', 1),
('Caine_34', 'Ciobanesc', 3, '2023-07-06', 0),
('Caine_35', 'Pudel', 7, '2023-05-29', 1),
('Caine_36', 'Husky', 4, '2023-06-30', 0),
('Caine_37', 'Mops', 5, '2023-07-04', 1),
('Caine_38', 'Teckel', 3, '2023-06-17', 0),
('Caine_39', 'Chow Chow', 6, '2023-07-07', 1),
('Caine_40', 'Golden', 4, '2023-05-21', 0),
('Caine_41', 'Labrador', 3, '2023-06-04', 1),
('Caine_42', 'Bulldog', 7, '2023-07-12', 0),
('Caine_43', 'Beagle', 5, '2023-06-23', 1),
('Caine_44', 'Ciobanesc', 4, '2023-07-08', 0),
('Caine_45', 'Pudel', 3, '2023-05-28', 1),
('Caine_46', 'Husky', 6, '2023-06-27', 0),
('Caine_47', 'Mops', 7, '2023-07-02', 1),
('Caine_48', 'Teckel', 4, '2023-06-14', 0),
('Caine_49', 'Chow Chow', 5, '2023-07-10', 1),
('Caine_50', 'Golden', 3, '2023-05-19', 0),
('Caine_51', 'Labrador', 6, '2023-06-05', 1),
('Caine_52', 'Bulldog', 5, '2023-07-15', 0),
('Caine_53', 'Beagle', 4, '2023-06-24', 1),
('Caine_54', 'Ciobanesc', 3, '2023-07-09', 0),
('Caine_55', 'Pudel', 7, '2023-05-31', 1),
('Caine_56', 'Husky', 2, '2023-06-29', 0),
('Caine_57', 'Mops', 3, '2023-07-04', 1),
('Caine_58', 'Teckel', 5, '2023-06-16', 0),
('Caine_59', 'Chow Chow', 4, '2023-07-06', 1),
('Caine_60', 'Golden', 6, '2023-05-22', 0),
('Caine_61', 'Labrador', 3, '2023-06-06', 1),
('Caine_62', 'Bulldog', 4, '2023-07-13', 0),
('Caine_63', 'Beagle', 5, '2023-06-20', 1),
('Caine_64', 'Ciobanesc', 7, '2023-07-07', 0),
('Caine_65', 'Pudel', 3, '2023-05-29', 1),
('Caine_66', 'Husky', 6, '2023-06-28', 0),
('Caine_67', 'Mops', 5, '2023-07-02', 1),
('Caine_68', 'Teckel', 4, '2023-06-18', 0),
('Caine_69', 'Chow Chow', 3, '2023-07-08', 1),
('Caine_70', 'Golden', 7, '2023-05-23', 0),
('Caine_71', 'Labrador', 4, '2023-06-01', 1),
('Caine_72', 'Bulldog', 3, '2023-07-14', 0),
('Caine_73', 'Beagle', 6, '2023-06-22', 1),
('Caine_74', 'Ciobanesc', 5, '2023-07-04', 0),
('Caine_75', 'Pudel', 2, '2023-05-27', 1),
('Caine_76', 'Husky', 7, '2023-06-30', 0),
('Caine_77', 'Mops', 3, '2023-07-01', 1),
('Caine_78', 'Teckel', 5, '2023-06-15', 0),
('Caine_79', 'Chow Chow', 4, '2023-07-09', 1),
('Caine_80', 'Golden', 6, '2023-05-18', 0),
('Caine_81', 'Labrador', 5, '2023-06-02', 1),
('Caine_82', 'Bulldog', 4, '2023-07-13', 0),
('Caine_83', 'Beagle', 3, '2023-06-21', 1),
('Caine_84', 'Ciobanesc', 7, '2023-07-06', 0),
('Caine_85', 'Pudel', 6, '2023-05-28', 1),
('Caine_86', 'Husky', 4, '2023-06-29', 0),
('Caine_87', 'Mops', 5, '2023-07-15',1)

SELECT * 
FROM Caini;

--------------------------------------------------------------------------------------------------------------------------
INSERT INTO Adoptii (CaineID, NumeAdoptator, DataAdoptie, Telefon) VALUES
(1, 'Ion Popescu', '2024-01-15', '0712345678'),
(3, 'Maria Ionescu', '2024-02-20', '0723456789'),
(5, 'George Mihai', '2024-03-18', '0734567890'),
(7, 'Andreea Vlad', '2024-04-22', '0745678901'),
(9, 'Cristina Enache', '2024-05-12', '0756789012'),
(11, 'Alexandru Radu', '2024-01-10', '0701122334'),
(13, 'Elena Dumitrescu', '2024-02-18', '0712233445'),
(15, 'Mihai Stan', '2024-03-25', '0723344556'),
(17, 'Adriana Luca', '2024-04-30', '0734455667'),
(19, 'Raluca Nistor', '2024-05-20', '0745566778'),
(21, 'Florin Pavel', '2024-01-22', '0756677889'),
(23, 'Oana Moldovan', '2024-02-28', '0707788990'),
(25, 'Darius Marinescu', '2024-03-15', '0718899001'),
(27, 'Simona Ionescu', '2024-04-12', '0729900112'),
(29, 'Bogdan Toma', '2024-05-08', '0731011223'),
(31, 'Camelia Stoica', '2024-01-18', '0742122334'),
(33, 'Vasile Gheorghe', '2024-02-24', '0753233445'),
(35, 'Andrei Enache', '2024-03-20', '0704344556'),
(37, 'Raluca Petrescu', '2024-04-28', '0715455667'),
(39, 'Cristian Georgescu', '2024-05-22', '0726566778'),
(41, 'Elena Dobre', '2024-01-11', '0737677889'),
(43, 'Sorin Popa', '2024-02-19', '0748788990'),
(45, 'Iulia Barbu', '2024-03-26', '0759899001'),
(47, 'Alina Dumitru', '2024-04-30', '0709900112'),
(49, 'Marius Neagu', '2024-05-15', '0711011223'),
(51, 'Ioana Marinescu', '2024-01-20', '0722122334'),
(53, 'Radu Stan', '2024-02-23', '0733233445'),
(55, 'Cristina Luca', '2024-03-21', '0744344556'),
(57, 'Adrian Pavel', '2024-04-29', '0755455667'),
(59, 'Daniela Popescu', '2024-05-18', '0706566778'),
(61, 'Georgiana Toma', '2024-01-13', '0717677889'),
(63, 'Mihnea Nistor', '2024-02-17', '0728788990'),
(65, 'Elena Radu', '2024-03-27', '0739899001'),
(67, 'Sorin Petrescu', '2024-04-25', '0740900112'),
(69, 'Laura Ionescu', '2024-05-10', '0751011223'),
(71, 'Daniel Georgescu', '2024-01-19', '0702122334'),
(73, 'Alina Stoica', '2024-02-22', '0713233445'),
(75, 'Vlad Dumitrescu', '2024-03-23', '0724344556'),
(77, 'Raluca Barbu', '2024-04-27', '0735455667'),
(79, 'Mihai Pavel', '2024-05-19', '0746566778'),
(81, 'Elena Popa', '2024-01-14', '0757677889'),
(83, 'Florin Luca', '2024-02-21', '0708788990'),
(85, 'Adriana Stan', '2024-03-24', '0719899001'),
(87, 'Bogdan Nistor', '2024-04-26', '0720900112');

--------------------------------------------------------------------------------------------------------------------------
---- s-a adaugat si coloana Data inregistrarii in cadrul tabelei Voluntari
ALTER TABLE Voluntari
ADD DataInregistrarii DATE;

SELECT *
FROM Voluntari;

INSERT INTO Voluntari (Nume, Telefon, Email, DataInregistrarii) VALUES
('Ion Popescu', '0712345678', 'ion.popescu@mail.com', '2023-01-10'),
('Maria Ionescu', '0723456789', 'maria.ionescu@mail.com', '2023-02-15'),
('George Mihai', '0734567890', 'george.mihai@mail.com', '2023-03-20'),
('Andreea Vlad', '0745678901', 'andreea.vlad@mail.com', '2023-04-25'),
('Cristina Enache', '0756789012', 'cristina.enache@mail.com', '2023-05-30'),
('Alexandru Radu', '0701122334', 'alex.radu@mail.com', '2023-06-10'),
('Elena Dumitrescu', '0712233445', 'elena.dumitrescu@mail.com', '2023-07-15'),
('Mihai Stan', '0723344556', 'mihai.stan@mail.com', '2023-08-20'),
('Adriana Luca', '0734455667', 'adriana.luca@mail.com', '2023-09-25'),
('Raluca Nistor', '0745566778', 'raluca.nistor@mail.com', '2023-10-30'),
('Florin Pavel', '0756677889', 'florin.pavel@mail.com', '2023-11-05'),
('Oana Moldovan', '0707788990', 'oana.moldovan@mail.com', '2023-12-10'),
('Darius Marinescu', '0718899001', 'darius.marinescu@mail.com', '2024-01-15'),
('Simona Ionescu', '0729900112', 'simona.ionescu@mail.com', '2024-02-20'),
('Bogdan Toma', '0731011223', 'bogdan.toma@mail.com', '2024-03-25'),
('Camelia Stoica', '0742122334', 'camelia.stoica@mail.com', '2024-04-30'),
('Vasile Gheorghe', '0753233445', 'vasile.gheorghe@mail.com', '2024-05-05'),
('Andrei Enache', '0704344556', 'andrei.enache@mail.com', '2024-06-10'),
('Raluca Petrescu', '0715455667', 'raluca.petrescu@mail.com', '2024-07-15'),
('Cristian Georgescu', '0726566778', 'cristian.georgescu@mail.com', '2024-08-20'),
('Elena Dobre', '0737677889', 'elena.dobre@mail.com', '2024-09-25'),
('Sorin Popa', '0748788990', 'sorin.popa@mail.com', '2024-10-30'),
('Iulia Barbu', '0759899001', 'iulia.barbu@mail.com', '2024-11-05'),
('Alina Dumitru', '0709900112', 'alina.dumitru@mail.com', '2024-12-10'),
('Marius Neagu', '0711011223', 'marius.neagu@mail.com', '2025-01-15'),
('Ioana Marinescu', '0722122334', 'ioana.marinescu@mail.com', '2025-02-20'),
('Radu Stan', '0733233445', 'radu.stan@mail.com', '2025-03-25'),
('Cristina Luca', '0744344556', 'cristina.luca@mail.com', '2025-04-30'),
('Adrian Pavel', '0755455667', 'adrian.pavel@mail.com', '2025-05-05'),
('Daniela Popescu', '0706566778', 'daniela.popescu@mail.com', '2025-06-10'),
('Georgiana Toma', '0717677889', 'georgiana.toma@mail.com', '2025-07-15'),
('Mihnea Nistor', '0728788990', 'mihnea.nistor@mail.com', '2025-08-20'),
('Elena Radu', '0739899001', 'elena.radu@mail.com', '2025-09-25'),
('Sorin Petrescu', '0740900112', 'sorin.petrescu@mail.com', '2025-10-30'),
('Laura Ionescu', '0751011223', 'laura.ionescu@mail.com', '2025-11-05'),
('Daniel Georgescu', '0702122334', 'daniel.georgescu@mail.com', '2025-12-10'),
('Alina Stoica', '0713233445', 'alina.stoica@mail.com', '2026-01-15'),
('Vlad Dumitrescu', '0724344556', 'vlad.dumitrescu@mail.com', '2026-02-20'),
('Raluca Barbu', '0735455667', 'raluca.barbu@mail.com', '2026-03-25'),
('Mihai Pavel', '0746566778', 'mihai.pavel@mail.com', '2026-04-30'),
('Elena Popa', '0757677889', 'elena.popa@mail.com', '2026-05-05'),
('Florin Luca', '0708788990', 'florin.luca@mail.com', '2026-06-10'),
('Adriana Stan', '0719899001', 'adriana.stan@mail.com', '2026-07-15'),
('Bogdan Nistor', '0720900112', 'bogdan.nistor@mail.com', '2026-08-20'),
('Camelia Georgescu', '0731011223', 'camelia.georgescu@mail.com', '2026-09-25'),
('Radu Dobre', '0742122334', 'radu.dobre@mail.com', '2026-10-30');

SELECT *
FROM Voluntari

--------------------------------------------------------------------------------------------------------------------------
ALTER TABLE Tratamente
ADD VoluntarID INT;

INSERT INTO Tratamente (CaineID, VoluntarID, Descriere, DataTratament) VALUES
(1, 1, 'Vaccin antirabic', '2025-06-10'),
(2, 2, 'Deparazitare', '2025-06-15'),
(1, 1, 'Vaccin antirabic', '2024-12-10'),
(2, 2, 'Deparazitare', '2024-12-15'),
(3, 3, 'Tratament rani usoare', '2024-12-20'),
(4, 4, 'Vaccin antitetanos', '2024-12-25'),
(1, 1, 'Vaccin antirabic', '2024-06-10'),
(2, 2, 'Deparazitare', '2024-06-15'),
(3, 3, 'Tratament rani usoare', '2024-06-20'),
(4, 4, 'Vaccin antitetanos', '2024-06-25'),
(5, 5, 'Verificare sanatate generala', '2024-08-01'),
(6, 6, 'Tratament infectie piele', '2024-08-05'),
(1, 1, 'Vaccin antirabic', '2024-01-10'),
(2, 2, 'Deparazitare', '2024-01-15'),
(3, 3, 'Tratament rani usoare', '2024-01-20'),
(4, 4, 'Vaccin antitetanos', '2024-01-25'),
(5, 5, 'Verificare sanatate generala', '2024-02-01'),
(6, 6, 'Tratament infectie piele', '2024-02-05'),
(7, 7, 'Deparazitare interna', '2024-02-10'),
(8, 8, 'Vaccin anual', '2024-02-15'),
(9, 9, 'Tratamente antibacteriene', '2024-02-20'),
(10, 10, 'Verificare stomatologica', '2024-02-25'),
(11, 11, 'Tratament antifungic', '2024-03-01'),
(12, 12, 'Vaccin antirabic', '2024-03-05'),
(13, 13, 'Deparazitare', '2024-03-10'),
(14, 14, 'Tratament rani usoare', '2024-03-15'),
(15, 15, 'Vaccin antitetanos', '2024-03-20'),
(16, 16, 'Verificare sanatate generala', '2024-03-25'),
(17, 17, 'Tratament infectie piele', '2024-03-30'),
(18, 18, 'Deparazitare interna', '2024-04-04'),
(19, 19, 'Vaccin anual', '2024-04-09'),
(20, 20, 'Tratamente antibacteriene', '2024-04-14'),
(21, 21, 'Verificare stomatologica', '2024-04-19'),
(22, 22, 'Tratament antifungic', '2024-04-24'),
(23, 23, 'Vaccin antirabic', '2024-04-29'),
(24, 24, 'Deparazitare', '2024-05-04'),
(25, 25, 'Tratament rani usoare', '2024-05-09'),
(26, 26, 'Vaccin antitetanos', '2024-05-14'),
(27, 27, 'Verificare sanatate generala', '2024-05-19'),
(28, 28, 'Tratament infectie piele', '2024-05-24'),
(29, 29, 'Deparazitare interna', '2024-05-29'),
(30, 30, 'Vaccin anual', '2024-06-03'),
(31, 31, 'Tratamente antibacteriene', '2024-06-08'),
(32, 32, 'Verificare stomatologica', '2024-06-13'),
(33, 33, 'Tratament antifungic', '2024-06-18'),
(34, 34, 'Vaccin antirabic', '2024-06-23'),
(35, 35, 'Deparazitare', '2024-06-28'),
(36, 36, 'Tratament rani usoare', '2024-07-03'),
(37, 37, 'Vaccin antitetanos', '2024-07-08'),
(38, 38, 'Verificare sanatate generala', '2024-07-13'),
(39, 39, 'Tratament infectie piele', '2024-07-18'),
(40, 40, 'Deparazitare interna', '2024-07-23'),
(1, 5, 'Vaccin antirabic', '2023-01-15'),
(2, 8, 'Deparazitare interna', '2023-01-20'),
(3, 12, 'Tratament rani usoare', '2023-01-25'),
(4, 6, 'Verificare generala', '2023-02-01'),
(5, 10, 'Antibiotic piele', '2023-02-05'),
(6, 3, 'Control stomatologic', '2023-02-10'),
(7, 15, 'Vaccin antitetanos', '2023-02-15'),
(8, 1, 'Deparazitare externa', '2023-02-20'),
(9, 17, 'Tratament antifungic', '2023-02-25'),
(10, 9, 'Verificare sanatate generala', '2023-03-01'),
(11, 4, 'Vaccin antirabic', '2023-03-06'),
(12, 19, 'Tratament respirator', '2023-03-11'),
(13, 22, 'Curățare urechi', '2023-03-16'),
(14, 2, 'Tratament dermatologic', '2023-03-21'),
(15, 11, 'Deparazitare', '2023-03-26'),
(16, 7, 'Analize de sange', '2023-03-31'),
(17, 14, 'Vaccin gripal canin', '2023-04-05'),
(18, 13, 'Tratament ocular', '2023-04-10'),
(19, 16, 'Control anual', '2023-04-15'),
(20, 18, 'Profilaxie stomatologică', '2023-04-20'),
(21, 6, 'Vaccin antirabic', '2023-04-25'),
(22, 20, 'Deparazitare interna', '2023-04-30'),
(23, 8, 'Tratament rani usoare', '2023-05-05'),
(24, 12, 'Verificare generala', '2023-05-10'),
(25, 1, 'Antibiotic piele', '2023-05-15'),
(26, 18, 'Control stomatologic', '2023-05-20'),
(27, 7, 'Vaccin antitetanos', '2023-05-25'),
(28, 11, 'Deparazitare externa', '2023-05-30'),
(29, 5, 'Tratament antifungic', '2023-06-04'),
(30, 3, 'Verificare sanatate generala', '2023-06-09'),
(31, 14, 'Vaccin antirabic', '2023-06-14'),
(32, 17, 'Tratament respirator', '2023-06-19'),
(33, 10, 'Curățare urechi', '2023-06-24'),
(34, 13, 'Tratament dermatologic', '2023-06-29'),
(35, 4, 'Deparazitare', '2023-07-04'),
(36, 9, 'Analize de sange', '2023-07-09'),
(37, 2, 'Vaccin gripal canin', '2023-07-14'),
(38, 15, 'Tratament ocular', '2023-07-19'),
(39, 19, 'Control anual', '2023-07-24'),
(40, 16, 'Profilaxie stomatologică', '2023-07-29');


SELECT *
FROM Tratamente;

--------------------------------------------------------------------------------------------------------------------------


INSERT INTO Donatii (VoluntarID, Suma, DataDonatie, Descriere) VALUES
(1, 150.00, '2023-01-15', 'Donatie pentru hrana'),
(2, 200.50, '2023-01-17', 'Donatie pentru vaccinuri'),
(3, 100.00, '2023-01-20', 'Sprijin medical'),
(4, 250.00, '2023-01-25', 'Refacere adapost'),
(5, 75.00, '2023-01-28', 'Donatie generala'),
(6, 120.00, '2023-02-01', 'Achizitie paturi'),
(7, 90.50, '2023-02-04', 'Hrana uscata'),
(8, 300.00, '2023-02-10', 'Campanie vaccinare'),
(9, 50.00, '2023-02-14', 'Dezinfectanti'),
(10, 110.00, '2023-02-18', 'Donatie echipamente'),
(11, 60.00, '2023-02-20', 'Medicamente urgente'),
(12, 135.00, '2023-02-22', 'Sprijin veterinar'),
(13, 180.00, '2023-02-25', 'Donatie adaposturi temporare'),
(14, 220.00, '2023-03-01', 'Achizitie custi'),
(15, 45.00, '2023-03-04', 'Donatie personala'),
(16, 90.00, '2023-03-07', 'Apa si hrana umeda'),
(17, 80.00, '2023-03-10', 'Tratamente externe'),
(18, 160.00, '2023-03-15', 'Veterinar de urgenta'),
(19, 140.00, '2023-03-18', 'Renovare cabinet'),
(20, 200.00, '2023-03-20', 'Sprijin lunar'),
(21, 155.00, '2023-03-25', 'Donatie pentru intretinere'),
(22, 75.00, '2023-03-30', 'Donatie lunara'),
(23, 180.00, '2023-04-02', 'Sprijin continuu'),
(24, 210.00, '2023-04-05', 'Donatie echipamente de curatenie'),
(25, 95.00, '2023-04-07', 'Hrana speciala'),
(26, 130.00, '2023-04-10', 'Analize medicale'),
(27, 125.00, '2023-04-13', 'Cosmetica catei'),
(28, 145.00, '2023-04-15', 'Recuperare costuri tratament'),
(29, 160.00, '2023-04-17', 'Sprijin veterinar'),
(30, 50.00, '2023-04-20', 'Donatie generala'),
(31, 190.00, '2023-04-22', 'Hrana juniori'),
(32, 175.00, '2023-04-24', 'Donatie echipament curte'),
(33, 220.00, '2023-04-26', 'Vaccinuri complete'),
(34, 145.00, '2023-04-28', 'Tratamente parazitare'),
(35, 80.00, '2023-05-01', 'Donatie consumabile'),
(36, 115.00, '2023-05-03', 'Donatie produse veterinare'),
(37, 100.00, '2023-05-05', 'Donatie in memorie'),
(38, 170.00, '2023-05-07', 'Donatie pentru curatenie'),
(39, 90.00, '2023-05-09', 'Donatie de Paste'),
(40, 240.00, '2023-05-11', 'Campanie sociala'),
(1, 155.00, '2023-06-15', 'Donatie suplimentara'),
(2, 130.00, '2023-06-16', 'Costuri de transport'),
(3, 90.00, '2023-06-18', 'Hrana catei batrani'),
(4, 125.00, '2023-06-20', 'Reparatii'),
(5, 170.00, '2023-06-22', 'Donatie de vara'),
(6, 80.00, '2023-06-24', 'Curatenie'),
(7, 200.00, '2023-06-26', 'Achizitie medicamente'),
(8, 100.00, '2023-06-28', 'Reinnoire custi'),
(9, 140.00, '2023-06-30', 'Donatie extra'),
(10, 60.00, '2023-07-02', 'Hrana zilnica'),
(11, 155.00, '2023-07-04', 'Intretinere spatiu'),
(12, 100.00, '2023-07-06', 'Donatie rapida'),
(13, 120.00, '2023-07-08', 'Donatie pentru adapost'),
(14, 180.00, '2023-07-10', 'Sprijin financiar'),
(15, 90.00, '2023-07-12', 'Servicii medicale'),
(16, 200.00, '2023-07-14', 'Donatie vara'),
(17, 110.00, '2023-07-16', 'Dotare cabinet'),
(18, 105.00, '2023-07-18', 'Achizitie paturi'),
(19, 165.00, '2023-07-20', 'Analize medicale'),
(20, 130.00, '2023-07-22', 'Donatie lunara suplimentara'),
(21, 100.00, '2023-08-01', 'Donatie suplimentara pentru tratamente'),
(22, 85.00, '2023-08-02', 'Achizitie materiale curatenie'),
(23, 150.00, '2023-08-03', 'Donatie pentru custi noi'),
(24, 115.00, '2023-08-04', 'Hrana uscata extra'),
(25, 95.00, '2023-08-05', 'Sustinere financiara adapost'),
(26, 110.00, '2023-08-06', 'Analize si tratamente'),
(27, 125.00, '2023-08-07', 'Dotare cabinet veterinar'),
(28, 145.00, '2023-08-08', 'Campanie de deparazitare'),
(29, 160.00, '2023-08-09', 'Achizitie echipamente igiena'),
(30, 75.00, '2023-08-10', 'Donatie sanitara'),
(31, 180.00, '2023-08-11', 'Sprijin pentru cazuri grave'),
(32, 155.00, '2023-08-12', 'Materiale de constructie'),
(33, 170.00, '2023-08-13', 'Donatie echipament veterinar'),
(34, 105.00, '2023-08-14', 'Alimente speciale'),
(35, 90.00, '2023-08-15', 'Produse dezinfectante'),
(36, 135.00, '2023-08-16', 'Tratamente pentru catei batrani'),
(37, 140.00, '2023-08-17', 'Donatie pentru intretinere lunara'),
(38, 125.00, '2023-08-18', 'Vaccinuri suplimentare'),
(39, 95.00, '2023-08-19', 'Hrana umeda pentru catei mici'),
(40, 150.00, '2023-08-20', 'Donatie pentru sterilizari');


SELECT *
FROM Donatii

--------------------------------------------------------------------------------------------------------------------------
-- Executarea celor 20 de query-uri

-- 1: Extrageti lista tututor cainilor ce s-au aflat in adapost
SELECT *
FROM Caini;

-- 2: Extrageti lista tuturor cainilor ce au fost adoptati. Lista contine doar Numele, Rasa si numele celui ce l-a adoptat

SELECT
	c.Nume
	, c.Rasa
	, a.NumeAdoptator
FROM Caini AS c
LEFT JOIN Adoptii AS a ON a.CaineID = c.CaineID
WHERE Adoptat = 1

-- 3: Extrageti lista cateilor ce sunt prezenti inca in adapost / disponibili pentru adoptie. Extrageti numele si varsta
SELECT 
	Nume
	, Varsta
FROM Caini
WHERE Adoptat = 0

-- 4: Extrageti lista cateilor ce sunt in adapost si au primit cel putin un tratament. Lista va contine: Numele cainelui, rasa, varsta, descrierea tratamentului si data cand s-a efectuat

SELECT 
	c.Nume
	, c.Rasa
	, c.Varsta
	, t.Descriere
	, t.DataTratament
FROM Caini AS c
INNER JOIN Tratamente AS t
	ON t.CaineID = c.CaineID
WHERE Adoptat = 0

-- 5: Extrageti numarul de caini, per fiecare rasa ce au fost adoptati

SELECT 
	Rasa
	, COUNT(*) AS "Numar caini"
FROM Caini
WHERE Adoptat = 1
GROUP BY Rasa

-- 6: Extrageti istoricul de tratamente pentru cainele domnului Ion Popescu

SELECT 
	c.Nume
	, C.Rasa
	, c.Varsta
	, t.Descriere
	, t.DataTratament
FROM 
	Tratamente AS t
LEFT JOIN
	Caini AS c ON c.CaineID = t.CaineID
INNER JOIN 
	Adoptii AS a ON a.CaineID = c.CaineID
WHERE 
	a.NumeAdoptator = 'Ion Popescu'

-- 7: Extrageti lista cainilor ce au fost adoptati in ultima luna 

SELECT 
	*
FROM Adoptii
WHERE MONTH(DataAdoptie) = (SELECT MONTH(MAX(DataAdoptie)) FROM Adoptii)

-- 8: Extrageti lista tuturor voluntarilor ce au adoptat un caine

SELECT
	DISTINCT NumeAdoptator
FROM Adoptii 

-- 9: Aflati suma totala a donatiilor primite de adapost

SELECT	
	SUM(Suma) AS TotalDonatii
FROM Donatii


-- 10: Extrageti lista cainilor ce au stat mai mult de un an in adapost

SELECT *
FROM Caini AS c
WHERE DATEDIFF(DAY, DataPrimire, (SELECT DataAdoptie 
									FROM Adoptii
									WHERE CaineID = c.CaineID
								  ) 
				) > 365

-- 11: Extrageti toti voluntarii ce au facut donatii impreuna cu suma total donata

SELECT 
	v.Nume
	, SUM(d.Suma)
FROM Donatii AS d
INNER JOIN Voluntari AS v ON v.VoluntarID = d.VoluntarID
GROUP BY v.Nume

-- 12: Extrageti cainii ce nu au niciun vaccin efectuat si sunt in adapost

SELECT * FROM Caini c
WHERE NOT EXISTS (
    SELECT * FROM Tratamente t WHERE t.CaineID = c.CaineID
)
AND Adoptat = 0

-- 13: Extrageti o lista ce sa contina numele, telefonul si email celor top 5 donatorii din cadrul voluntariilor. 

SELECT TOP 5
	v.Nume
	, v.Telefon
	, v.Email
FROM Donatii AS d
INNER JOIN Voluntari AS v ON v.VoluntarID = d.VoluntarID

-- 14 Extrageti o lista pe fiecare an si luna a totalurilor de caini adoptati

SELECT  
	YEAR(a.DataAdoptie) AS An
	, MONTH(a.DataAdoptie) As Luna
	, COUNT(c.CaineID)
FROM Caini AS c
INNER JOIN Adoptii AS a ON a.CaineID = c.CaineID
WHERE c.Adoptat = 1
GROUP BY YEAR(a.DataAdoptie), MONTH(a.DataAdoptie)


-- 15: Extrageti lista cainilor ce au cel putin 2 tramente facute. Lista sa contina Numele cainelui, rasa, descriere tratamentului si numar tratamentelor

SELECT 
	c.Nume
	, c.Rasa
	, t.Descriere
	, COUNT(t.TratamentID) AS NrTratamente
FROM Caini AS c
INNER JOIN Tratamente AS t ON t.CaineID = c.CaineID
GROUP BY c.Nume
	, c.Rasa
	, t.Descriere
HAVING COUNT(t.TratamentID) > 1

-- 16: Extrageti lista cainilor: Nume si Rasa ce au in ultima luna tratamente efectuate si numele cu telefon voluntariilor

SELECT 
	DISTINCT t.CaineID
	, c.Nume
	, c.Rasa
	, v.Nume
	, v.Telefon
FROM Tratamente AS t
INNER JOIN Caini AS c ON c.CaineID = t.CaineID
INNER JOIN Adoptii AS a ON a.CaineID = c.CaineID
INNER JOIN Voluntari AS v ON v.Nume = a.NumeAdoptator
WHERE MONTH(t.DataTratament) = (SELECT MONTH(MAX(DataTratament)) FROM Tratamente)


-- 17: Extrageti lista de donatii ale voluntarului cu numele „Mihai Stan”. Lista sa contina id-ul, numele, telefonul, email si suma total donata.
SELECT
	d.VoluntarID
	, v.Nume
	, v.Telefon
	, v.Email
	, SUM(d.Suma) AS total_donatii
FROM Donatii AS d
INNER JOIN Voluntari as v ON v.VoluntarID = d.VoluntarID
WHERE v.Nume = 'Mihai Stan'
GROUP BY d.VoluntarID
	, v.Nume
	, v.Telefon
	, v.Email
ORDER BY total_donatii DESC 

-- 18: Extrageti lista celor top 5 donatorii. Lista sa contina id, numele, telefon, email si lista fiecarei date de donatii facute.

SELECT TOP 5
	d.VoluntarID
	, v.Nume
	, v.Telefon
	, v.Email
	, SUM(d.Suma) AS total_donatii
	, (
		SELECT STRING_AGG(do.DataDonatie, ', ')
		FROM Donatii AS do
		WHERE do.VoluntarID = d.VoluntarID
	) AS lista_date_donatii
FROM Donatii AS d
INNER JOIN Voluntari as v ON v.VoluntarID = d.VoluntarID
GROUP BY d.VoluntarID
	, v.Nume
	, v.Telefon
	, v.Email
ORDER BY total_donatii DESC

-- 19: Extrageti lista cateilor cu un numar de tratamente mai mare decat numarul maxim minus 2. Lista sa contina numele, rasa, lista de tratamente

WITH Max_Tratamente AS (
	SELECT TOP 1
		COUNT(*) AS numar_tratamente
	FROM Tratamente
	GROUP BY CaineID
),
Lista_caini AS (
SELECT
	c.CaineID
	, c.Nume
	, c.Rasa
	, COUNT(t.CaineID) AS numar_tratamente
FROM Caini AS c
INNER JOIN Tratamente AS t ON t.CaineID = c.CaineID
GROUP BY
	c.CaineID
	, c.Nume
	, c.Rasa
)
SELECT
	lc.Nume
	, lc.Rasa
	, (SELECT STRING_AGG(t.Descriere, ', ')
				FROM Tratamente AS t
				WHERE t.CaineID = lc.CaineID)
				 AS lista_tratamente
FROM Lista_caini AS lc
CROSS JOIN Max_Tratamente AS mt
WHERE lc.numar_tratamente = mt.numar_tratamente

-- 20: Extrageti lista cainilor cu perioada pe care au petrecut-o in adapost. 
-- Lista sa contina numele, data intrarii in adapost, data plecarii (daca inca este in adapost, se pune data current) si numarul de zile petrecute in adapost
-- Ordoneaza dupa numarul de zile petrecute descarcator

SELECT
	c.Nume
	, c.DataPrimire
	, CASE WHEN a.DataAdoptie IS NULL THEN CAST(GETDATE() AS DATE) ELSE CAST(a.DataAdoptie AS DATE) END AS DataAdoptie
	, CASE WHEN a.DataAdoptie IS NULL THEN DATEDIFF(DAY, c.DataPrimire, GETDATE())
	ELSE DATEDIFF(DAY, c.DataPrimire, a.DataAdoptie) END AS durata_in_adapost
FROM Caini As c
LEFT JOIN Adoptii AS a ON c.CaineID = a.CaineID
ORDER BY durata_in_adapost DESC
