INSERT INTO klassen
(klas_code, slb_code, cohort, opleiding_code)
VALUES ('lo9e-amo1', 'brc01', 2019, 'amo'),
       ('lo9e-amo2', 'rs001', 2019, 'amo'),
       ('lo9e-amo3', 'bkr02', 2019, 'amo');

INSERT INTO studenten
(ov_nummer, achternaam, tussenvoegsel, voorletters, voornaam, geboortedatum, postcode, plaats, gewicht, lengte, inschrijvings_datum)
VALUES (99009,'huntelaar','','KJ','Klaas-Jan','1993-07-27','2211 SG','Noordwijkerhout', 73.2, 1.86, '2018-01-01'),
	   (99219,'Vermeer','','K','Kenneth','1992-08-05','2152 EX','Nieuw-Vennep', 82.1, 1.87, '2018-01-01'),
	   (93213,'Ligt','de','M','Matthijs','1994-03-26','2465 AG','Rijsaterwoude', 67.0, 1.77, '2018-01-01'),
	   (98765,'Beek','van de','D','Donny','1993-07-13','2321 HP','Leiden', 72.5, 1.85, '2018-01-01');

INSERT INTO klassen_studenten
(ov_nummer, klas_code)
VALUES (99009, 'lo9e-amo1'),
       (99219, 'lo9e-amo2'),
       (93213, 'lo9e-amo3'),
       (98765, 'lo9e-amo3');

UPDATE studenten
SET geboortedatum = '1999-08-12'
WHERE ov_nummer = 93213;

UPDATE studenten 
SET actief = FALSE
WHERE inschrijvings_datum < 1-1-2017;

SELECT studenten.ov_nummer, CONCAT(studenten.voornaam,' ', studenten.tussenvoegsel,' ', studenten.achternaam) AS studenten, klassen.cohort,  klassen.klas_code, CONCAT(docenten.voorletters, docenten.tussenvoegsel, docenten.achternaam) AS slber
FROM studenten
INNER JOIN klassen_studenten
ON studenten.ov_nummer = klassen_studenten.ov_nummer
INNER JOIN klassen
ON klassen_studenten.klas_code = klassen.klas_code
INNER JOIN docenten
ON klassen.slb_code = docenten.docent_code
ORDER BY klas_code, studenten.achternaam 