-- Active: 1765006836152@@localhost@3306@db_usaha
CREATE DATABASE db_usaha;


CREATE TABLE branch (
    id_cabang CHAR(4) PRIMARY KEY,
    alamat VARCHAR(50) NOT NULL,
    kota VARCHAR(50) NOT NULL,
    kodepos INT NOT NULL   
)

CREATE TABLE staf (
    nip CHAR(3) PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    posisi VARCHAR(50) NOT NULL,
    tgl_masuk DATE NOT NULL,
    Gaji INT NOT NULL
)

desc branch;
desc staf;

INSERT INTO branch VALUES ("B001", "Imam bonjol", "Semarang", 50131);
INSERT INTO branch VALUES 
("B002","Laweyan", "Solo",57148),
("B003","Kailiurang", "Yogyakarta", 56483);

INSERT INTO staf VALUES 
("A01", "Wahyu", "Asisten", "2014-08-10", 5000000),
("M01", "Budi", "Managaer", "1996-01-01", 10000000),
("S01", "Sari", "Supervisor", "2000-02-05", 7500000);


SELECT * FROM staf;

SELECT * FROM branch;

SELECT nama, Gaji * 12 AS gaji_tahunan FROM staf;

SELECT nama, Gaji * 0.2 AS tunjangan FROM staf;

SELECT nama, Gaji, Gaji * 0.2 AS tunjangan, Gaji + (Gaji * 0.2) AS total_gaji FROM staf;

SELECT nama, tgl_masuk, YEAR(CURDATE()) - YEAR(tgl_masuk) AS masa_kerja 
FROM staf;

UPDATE staf 
SET posisi = "Manager"
WHERE nip = "M01";
SELECT * FROM staf WHERE posisi = "Manager";

SELECT nama, Gaji * 0.2 AS tunjangan FROM staf WHERE Gaji * 0.2 > 500000;

SElECT * FROM staf where posisi != "Manager";

SElECT * FROM staf where posisi = "Manager" OR posisi = "Supervisor";

SELECT nama, YEAR(CURDATE()) - YEAR(tgl_masuk) AS masa_kerja FROM staf
WHERE posisi = 'Asisten' AND YEAR(CURDATE()) - YEAR(tgl_masuk) >= 8;

SELECT * FROM staf WHERE gaji != 10000000;