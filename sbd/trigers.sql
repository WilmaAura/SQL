-- Active: 1765006836152@@localhost@3306@latSBD_5
CREATE table siswa(
    id char(3) primary key,
    nama varchar(30),
    makul1 int,
    makul2 int,
    makul3 int,
    rerata int
);

INSERT INTO siswa values 
('001','Nathan',90,80,70,80),
('002','Andini',85,90,80,85),
('003','Sita', 100,80,90,90);

SELECT * FROM siswa;

CREATE TRIGGER nilai_rerata
BEFORE INSERT
ON siswa
FOR EACH ROW
SET New.Rerata = (New.Makul1 + New.Makul2 + New.Makul3) /3;
-- SET: Menyatakan nilai

INSERT INTO siswa VALUES ('004', 'Soni', 80,80,80,0);
SELECT * FROM siswa;

CREATE TABLE statistik(
    ID CHAR(2) PRIMARY KEY,
    Keterangan VARCHAR(20),
    Jumlah INT
);

INSERT INTO statistik VALUES 
('01', 'SISWA', 4),
('02', 'GURU', 2);

SELECT * FROM statistik;

CREATE TRIGGER Jumlah_Siswa
AFTER INSERT
ON siswa
FOR EACH ROW
UPDATE statistik SET Jumlah = Jumlah+1 WHERE ID = '01';

SELECT * FROM statistik;

INSERT INTO siswa values('005','Dedi', 70, 75, 80, 0);

CREATE TRIGGER update_makul3
BEFORE UPDATE ON siswa
FOR EACH ROW 
SET New.Rerata = (Old.Makul1 + Old.Makul2 + New.Makul3) /3;

UPDATE siswa SET makul3 = 85 WHERE ID = "001";

CREATE TRIGGER update_makul
BEFORE UPDATE ON siswa
FOR EACH ROW
SET New.Rerata = (New.Makul1+New.Makul2+New.Makul3)/3;

DROP TRIGGER update_makul;

update siswa SET 
makul1 = 90,
makul2 = 90,
makul3 = 80 WHERE id="001";

SELECT * FROM siswa; 