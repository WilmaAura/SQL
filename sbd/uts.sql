-- Active: 1765006836152@@localhost@3306@db_uts_15841

CREATE database db_uts_15841;

create table barang (
    kode_brg CHAR(5) PRIMARY KEY,
    nama_brg VARCHAR(50) NOT NULL,
    id_kategori CHAR(3),
    harga INT,
    htok INT,
    CONSTRAINT fk_kategori FOREIGN KEY (id_kategori) references kategori(id_kategori)
);

CREATE TABLE kategori(
    id_kategori CHAR(3) PRIMARY KEY,
    nama_kategori VARCHAR(30) NOT NULL
);


CREATE TABLE statistik (
    id CHAR(2) PRIMARY KEY,
    keterangan VARCHAR(20) NOT NULL,
    jumlah INT NOT NULL
);

INSERT INTO barang VALUES 
('E0001', 'Xiomi Smart TV A2 32 inc', 'ELK', 1800000, 10),
('E0002', 'Miyako Kipas Angin 12 Inc Putih', 'ELK', 195000, 15),
('E0003', 'Philips Setrika Uap Ungu', 'ELK', 330000, 12),
('E0004', 'Mesin Cuci AQUA 1 Tabung', 'ELK', 1900000, 10),
('P0001', 'Velvet Junior Baju Anak', 'PKN', 40000, 8),
('P0002', 'Kaos Kerah Polo Shirt', 'PKN', 30000, 12),
('P0003', 'Seruni Blouse Panjang Putih', 'PKN', 150000, 12),
('S0001', 'Aerostreet 40-43 Tactical Hitam', 'SPT', 189900, 12),
('S0002', 'Sepatu NB New Balance 574 Legacy Black White', 'SPT', 610000, 10),
('S0003', 'Sepatu Adidas', 'SPT', 300000, 10);


INSERT INTO kategori VALUES
('ELK', 'Elektronika'),
('PKN', 'Pakaian'),
('SPT', 'Sepatu');

INSERT INTO statistik VALUES
('01', 'Barang', 10),
('02', 'Kategori', 3);

DELIMITER //
CREATE PROCEDURE update_harga( harga_baru int, k_kode_brg CHAR(5))
BEGIN 
UPDATE barang SET harga = harga_baru WHERE kode_brg = k_kode_brg;
SELECT kode_brg, nama_brg, harga FROM barang;
END //
DELIMiTER;

call update_harga(320000, "S0003");

DELIMITER//
CREATE FUNCTION rerata_brg_kategori(id_kat CHAR(3)) RETURNS INT DETERMINISTIC
begin
declare rerata INT;
SELECT AVG(harga) INTO rerata FROM barang WHERE id_kategori = id_kat ;
RETURN rerata;
END//
DELIMITER;
SELECT rerata_brg_kategori("ELK");

DELIMITER//
CREATE FUNCTION stok_brg_kategori(f_id_kategori CHAR(3)) RETURNS INT DETERMINISTIC
begin
declare jumlah INT;
SELECT SUM(htok) INTO jumlah from barang WHERE id_kategori = f_id_kategori; 
return jumlah;
END//
DELIMITER;

SELECT stok_brg_kategori("ELK");



CREATE TRIGGER tambah_barang
AFTER INSERT ON barang
FOR EACH ROW
begin
UPDATE statistik SET jumlah = jumlah+1 WHERE keterangan = "Barang";
END //
