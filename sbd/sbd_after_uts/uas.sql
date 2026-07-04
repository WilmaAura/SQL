-- Active: 1765006836152@@localhost@3306@UAS_15841
CREATE DATABASE UAS_15841;

CREATE TABLE barang (
    kode_barang CHAR(4) PRIMARY KEY,
    nama_barang VARCHAR(30) NOT NULL,
    harga_barang INT(11) NOT NULL,
    stok INT(2) NOT NULL
);
desc barang;

INSERT INTO barang VALUES 
('B001', 'Buku Tulis', 5000, 50),
('B002', 'Buku Gambar', 6000, 40),
('B003', 'Pensil 2B', 3000, 10),
('B004', 'Penggaris Plastik', 3500, 25);
SELECT * FROM barang;

CREATE TABLE jual (
    no_jual int(11) NOT NULL,
    tanggal_jual date NOT NULL,
    kode_barang  CHAR(4) NOT NULL,
    jumlah_jual int(5) NOT NULL
);
desc jual;

/* Membuat user dan hak aksesnya*/
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';
CREATE USER 'pelanggan'@'localhost' IDENTIFIED BY '123';

/* akses admin */
GRANT ALL PRIVILEGES ON UAS_15841.barang TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON UAS_15841.jual TO 'admin'@'localhost';

/* akses pelanggan */
GRANT SELECT, INSERT ON UAS_15841.barang TO 'pelanggan'@'localhost';
GRANT SELECT, INSERT ON UAS_15841.jual TO 'pelanggan'@'localhost';

REVOKE INSERT ON UAS_15841.barang FROM 'pelanggan'@'localhost';
REVOKE INSERT ON UAS_15841.jual FROM 'pelanggan'@'localhost';

SHOW GRANTS FOR 'pelanggan'@'localhost';
/* End of user */

/* Function get_diskon() */
DELIMITER //
CREATE FUNCTION get_diskon(kd_brg CHAR(4)) RETURNS INT DETERMINISTIC
BEGIN
    Declare f_nama_brg VARCHAR(30);
    declare f_diskon INT DEFAULT 0;

    SELECT nama_barang INTO f_nama_brg FROM barang
    WHERE kode_barang = kd_brg;

    CASE f_nama_brg
        WHEN 'Buku Tulis' THEN SET f_diskon = 10;
        WHEN 'Buku Gambar' THEN SET f_diskon = 10;
        WHEN 'Pensil 2B' THEN SET f_diskon = 5;
        ELSE SET f_diskon = 0;
    END CASE;

    RETURN f_diskon;
END//
DELIMITER;

SELECT nama_barang, get_diskon('B001') AS diskon FROM barang WHERE kode_barang = 'B001';
SELECT nama_barang, get_diskon('B002') AS diskon FROM barang WHERE kode_barang = 'B002';
SELECT nama_barang, get_diskon('B003') AS diskon FROM barang WHERE kode_barang = 'B003';
/* End of function */

/* Procedure jual_brg() */
DELIMITER//

CREATE PROCEDURE jual_brg(kd_brg CHAR(4), jml_jual int)
BEGIN
    DECLARE p_stok int;
    DECLARE p_new_no_jual INT;
    START TRANSACTION;

    SELECT stok into p_stok
    FROM barang 
    WHERE kode_barang = kd_brg;

    if jml_jual > p_stok THEN
        SELECT 'Stok tidak cukup!' AS pesan_rollback;
        ROLLBACK;
    ELSE   
        SELECT IFNULL(max(no_jual), 0) + 1 into p_new_no_jual FROM jual;

        UPDATE barang SET stok = stok - jml_jual
        WHERE kode_barang = kd_brg;

        INSERT INTO jual (no_jual, tanggal_jual, kode_barang, jumlah_jual) VALUES (p_new_no_jual, CURDATE(), kd_brg, jml_jual);
        SELECT "Transaksi Berhasil: Data tersimpan" AS pesan_commit;
        COMMIT;
    END IF;
END //
DELIMITER;
CALL jual_brg('B001', 12);
    SELECT * FROM barang;
SELECT * FROM jual;
call jual_brg ('B003', 2);
call jual_brg ('B003', 50);

/* End of Procedure */
