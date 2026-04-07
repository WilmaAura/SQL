-- Active: 1765006836152@@localhost@3306@latSBD_3
create database latSBD_3;

create table pelanggan(
    ID char(3) PRIMARY KEY,
    nama varchar(25) NOT NULL,
    kota varchar(25) NOT NULL,
    gaji int
);

INSERT INTO pelanggan (ID, nama, kota, gaji) VALUES
('001', 'Nathan', 'Surabaya', 5000000),
('002', 'Andini', 'Solo', 9000000),
('003', 'Sita', 'Bandung', 8000000),
('004', 'Soni', 'Bekasi', 5000000),
('005', 'Dedi', 'Palembang', 6000000);

SELECT * FROM pelanggan;

DELIMITER // 
CREATE PROCEDURE SP1()
BEGIN
SELECT * FROM pelanggan;
END//
DELIMITER;

CALL SP1;

DELIMITER//

CREATE PROCEDURE SP2(ID CHAR(3), nama varchar(25), kota varchar(25), gaji int)  
BEGIN
INSERT INTO pelanggan VALUES (ID, nama, kota, gaji);
SELECT * FROM pelanggan;
END//
DELIMITER;

CALL SP2('008', 'Roni', 'Magelang', 10000000);

DELIMITER //
CREATE PROCEDURE SP3(gaji_lama int, gaji_baru int)
BEGIN
UPDATE pelanggan set gaji = gaji_baru where gaji = gaji_lama;
SELECT nama, gaji FROM pelanggan;
END//
DELIMITER;

CALL SP3(5000000, 5500000);

DROP PROCEDURE SP3;

SHOW PROCEDURE status;

create database latSBD_4