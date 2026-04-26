-- Active: 1765006836152@@localhost@3306@apotek_15841

CREATE TABLE Obat (
    Kd_obat CHAR (5) PRIMARY KEY,
    nama_obat VARCHAR (25),
    isi int,
    harga_satuan int,
    pabrik varchar (15)
);

INSERT INTO Obat VALUES ("ACL20", "ACCOLATE 20 MG TABLE", 28, 9000, "Zeneca"),
("ACT15", "ACTOS 15 MG TABLET", 14, 8200, "Takeda"),
("ACT30", "ACTOS 30 MG TABLET", 20, 12300, "Takeda"),
("ADL30", "ADALAT OROS 30 MG TABLET", 30, 8100, "Bayer"),
("ADL60", "ADALAT OROS 69 MG TABLET", 30, 13200, "Bayer");


select * from Obat;

DELIMITER //
CREATE FUNCTION total_obat() RETURNS int DETERMINISTIC
begin
declare ssum INT;
select COUNT(*) AS jml_obat INTO ssum FROM Obat;
return ssum;
END//
DELIMITER;

DROP total_obat();

DELIMITER //
CREATE FUNCTION jenis_obat_pabrik (p_pabrik varchar(15)) returns int
begin
declare jml_jenis int;
select count(*) as jml into jml_jenis from Obat where pabrik = p_pabrik;
return jml_jenis;
end//
DELIMITER;
SELECT jenis_obat_pabrik('Takeda');

-- FUNCTION
DELIMITER //
CREATE FUNCTION total_obat() RETURNS INT DETERMINISTIC
begin
declare total INT;
SELECT SUM(isi) INTO total FROM Obat;
RETURN total;
END//
DELIMITER;
SELECT total_obat();

DELIMITER //
CREATE FUNCTION rerata_harga() RETURNS INT DETERMINISTIC
begin
declare rata INT;
SELECT AVG(harga_satuan) INTO rata FROM Obat;
RETURN rata;
END//

SELECT rerata_harga();
DELIMITER;

DELIMITER // 
CREATE FUNCTION jml_pabrik() RETURNS INT DETERMINISTIC
begin
declare jml INT;
SELECT COUNT(pabrik) INTO jml FROM Obat;
RETURN jml;
END//
DELIMITER;
SELECT jml_pabrik();
-- END OF FUNCTION

-- PROCEDURE
DELIMITER //
CREATE PROCEDURE show_obat()
begin
SELECT * FROM Obat;
END//
DELIMITER;
CALL show_obat();

DELIMITER // 
CREATE PROCEDURE tambah_obat(Kd_obat CHAR (5),
    nama_obat VARCHAR (25),
    isi int,
    harga_satuan int,
    pabrik varchar (15))
begin
INSERT INTO Obat VALUES (Kd_obat, nama_obat, isi,harga_satuan, pabrik);
END//
DELIMITER;
CALL tambah_obat('PN500', 'PANADOL 500 MG', 16, 11800, 'Farma');

DELIMITER //
CREATE PROCEDURE update_harga_obat (harga_obat_baru int, harga_obat_lama int)
begin
UPDATE Obat set harga_satuan = harga_obat_baru WHERE harga_satuan = harga_obat_lama;
END //
DELIMITER;

CALL update_harga_obat(9000,8500);
CALL show_obat();

DELIMITER//
CREATE PROCEDURE Hapus_obat (kd_obat_parameter CHAR(5))
begin
DELETE FROM Obat
WHERE Kd_obat = kd_obat_parameter;
END //
DELIMITER;
CALL Hapus_obat('PN500');

CALL show_obat;
DROP PROCEDURE Hapus_obat;
-- END OF PROCEDURE

show databases;
CREATE DATABASE latSBD_5;