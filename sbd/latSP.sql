-- Active: 1765006836152@@localhost@3306@latSBD_4
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

DELIMITER //
CREATE PROCEDURE show_obat()
begin
SELECT * FROM Obat;
END//
DELIMITER;

DELIMITER // 
CREATE PROCEDURE tambah_obat(Kd_obat CHAR (5),
    nama_obat VARCHAR (25),
    isi int,
    harga_satuan int,
    pabrik varchar (15))
begin
INSERT INTO Obat VALUES (Kd_obat, nama_obat, harga_satuan, pabrik);
END//
DELIMITER;

DELIMITER //
CREATE PROCEDURE update_harga_obat (harga_obat_baru int, harga_obat_lama int)
begin
UPDATE Obat set harga_satuan = harga_obat_baru WHERE harga_satuan = harga_obat_lama;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Hapus_obat (kd_obat_paramater CHAR(5))
begin
DELETE FROM `Obat`
WHERE `Kd_obat` = kd_obat_parameter;
END //

DELIMITER;


