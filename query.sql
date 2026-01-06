-- Active: 1765006836152@@localhost@3306@koleksi_buku15841
SHOW TABLES;

desc buku15841;
desc penerbit15841;

SELECT * FROM view1_15841;

SELECT * FROM view2_15841;

SELECT * FROM view3_15841;

SELECT * FROM view4_15841;

SELECT * FROM view5_15841;

SELECT * FROM view6_15841;



CREATE VIEW view5_15841 AS SELECT n.nama_neg_pembuat
FROM negara15841 n
LEFT JOIN penerbit15841 p
    ON p.negara_id = n.negara_id
WHERE p.penerbit_id IS NULL;

CREATE VIEW view6_15841 AS SELECT n.nama_neg_pembuat, p.nama AS nama_penerbit from negara15841 n
LEFT JOIN penerbit15841 p ON p.negara_id = n.negara_id;

