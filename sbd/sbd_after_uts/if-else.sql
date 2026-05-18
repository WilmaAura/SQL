-- Active: 1765006836152@@localhost@3306@db_uts_15841
-- Active: 1765006836152@@localhost@3306@latSBD_5
/* 
    If Else digunakan sebagai beberapa berikut:
        - Validasi data: Apakah data ada
        - Klasifikasi: Memberikan label "lulus" atau "tidak lulus" 
        - Pengaturan akses: Mengecek level user sebelum mengizinkan menghapus data
*/

show tables;


desc barang;
SELECT * FROM barang;

/* Stok Sedikit = condition true, Cukup = Condition False */
SELECT kode_brg, nama_brg, htok,
if (htok < 10, "stok Sedikit", "Cukup") as status FROM barang;

CREATE PROCEDURE cekStokBarang (p_kode_brg char(5))
BEGIN
DECLARE v_stok INT; 
SELECT htok INTO v_stok FROM barang where kode_brg = p_kode_brg;
IF v_stok > 0 THEN
    SELECT "Barang Tersedia";
ELSE 
    SELECT "Barang Habis";
END IF;
END;

CALL `cekStokBarang`("E0001");

ALTER TABLE barang
CHANGE COLUMN htok stok INT;

//Menghitung ADD

//NO 2 PROCEDURE: Karena outputnya adalah kalimat : "Tersedia"

//Nilai bentuk dalam angka atau karakter: function : "Perhitungan"

//Cek diskon pakai function