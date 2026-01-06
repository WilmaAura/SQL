use koleksi_buku15841

SHOW TABLES;

desc buku15841;
desc penerbit15841;

SELECT * FROM view1_15841;
SELECT * FROM view2_15841;
SELECT * FROM view3_15841;

SELECT n.nama_neg_pembuat AS negara
FROM negara15841 n
JOIN penerbit15841 p
    ON p.negara_id = n.negara_id
LEFT JOIN buku_penerbit15841 bp
    ON bp.penerbit_id = p.penerbit_id
GROUP BY n.nama_neg_pembuat
HAVING COUNT(bp.buku_id) = 0
ORDER BY n.nama_neg_pembuat ASC;

SELECT DISTINCT n.nama_neg_pembuat
FROM negara15841 n
JOIN penerbit15841 p 
    ON p.negara_id = n.negara_id
LEFT JOIN buku_penerbit15841 bp 
    ON bp.penerbit_id = p.penerbit_id
WHERE bp.penerbit_id IS NULL;
