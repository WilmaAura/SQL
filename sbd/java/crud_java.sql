-- Active: 1765006836152@@localhost@3306@obat

CREATE TABLE obat (
    kode_obat CHAR(15) PRIMARY KEY,
    nama_obat VARCHAR(50),
    satuan_obat CHAR(10),
    jml_stok int,
    jml_min int,
    expired_date date,
    supplier CHAR (15)
);
