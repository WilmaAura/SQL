-- Active: 1765006836152@@localhost@3306@TUGAS_15841
CREATE DATABASE TUGAS_15841;

CREATE TABLE barang (
    kode_brg CHAR(5) PRIMARY KEY,
    nama_brg VARCHAR(50) NOT NULL,
    id_kategori CHAR(3) NOT NULL,
    harga INT,
    stok INT
);

INSERT INTO barang VALUES 
("E0001", "Xiamoi Smart TV A2 32 inc", "ELK", 1800000, 10),
("E0002", "Niyako Kipas Angin 12 Inc Putih", "ELK", 195000, 15),
("E0003", "Philips Setrika Uap Ungu", "ELK", 330000, 12),
("E0004", "Mesin Cuci AQUA 1 Tabun", "ELK", 1900000, 10),
("P0001", "Velvet Junior Baju Anak", "PKN", 40000, 8),
("P0002", "Kaos Kerah Polo Shirt", "PKN", 30000, 12),
("P0003", "Seruni Blouse Panjang Putih", "PKN", 150000, 12),
("S0001", "Aerostreet 40-43 Tactical Hitam", "SPT", 189900, 12),
("S0002", "Sepatu NB New Balance 574 Legacy Black White", "SPT", 610000, 10),
("S0003", "Sepatu Adidas Metro", "SPT", 320000, 10);

/* Latihan */

SELECT kode_brg, nama_brg, harga,
IF (id_kategori = "ELK", "Diskon 10%", IF(id_kategori="PKN", "Diskon 5%", "Tidak Ada Diskon")) AS Keterangan FROM barang;

