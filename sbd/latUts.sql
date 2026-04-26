-- Active: 1765006836152@@localhost@3306@lat_UTS_SBD
create database lat_UTS_SBD;

create table produk (
    id_produk CHAR(3) PRIMARY KEY,
    nama_produk varchar(15),
    harga int,
    stok int
);

create table pesanan (
    id_pesanan CHAR(3) PRIMARY KEY,
    tgl_pesanan DATE NOT NULL,
    id_produk CHAR(3),
    jml_pesanan int not null,
    constraint fk_produk
    FOREIGN KEY (id_produk)
    REFERENCES produk(id_produk)
);



INSERT INTO produk VALUES
('A01', 'Keyboard', 100000, 50),
('A02', 'Mouse', 50000, 30);

INSERT INTO pesanan VALUES
('P01', '2024-04-01', 'A01', 2),
('P02', '2024-04-02', 'A02', 1),
('P03', '2024-04-03', 'A02', 4);

/* Stored procedure digunakan untuk menyimpan syntax yang seringg digunakan */

DELIMITER//

CREATE PROCEDURE sp_input_produk(id_produk char(3), nama_produk varchar(15), harga int, stok int)
BEGIN 
INSERT INTO produk VALUES (id_produk, nama_produk, harga, stok);
SELECT*FROM produk;
END//
DELIMITER;

DELIMITER //

CREATE PROCEDURE sp_input_pesanan(p_id_pesanan CHAR(3), p_tgl_pesanan DATE, p_id_produk CHAR(3), p_jml_pesanan int)
BEGIN 
INSERT INTO pesanan VALUES (p_id_pesanan, p_tgl_pesanan, p_id_produk, p_jml_pesanan);
SELECT * FROM pesanan;
END //
DELIMITER;
/* End of Stored Procedure */

