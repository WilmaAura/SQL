show tables;

desc barang;
SELECT kode_brg, nama_brg, stok,
CASE 
    WHEN stok>15 THEN 'Banyak'
    WHEN stok>10 THEN 'Cukup'
    WHEN stok>5 then 'Sedikit'  
    ELSE 'Kurang'
    END as status
    from barang;

CREATE FUNCTION diskon(jml int) returns int
Begin 
    declare disc int;
    case when(jml>=100) then set disc = 10;
    WHEN (jml>=50) and (jml<100) then set disc =5;
    WHEN (jml>=20) and (jml<50) then set disc = 2;
    else set disc = 0;
end case;
return disc;
END
&&

SELECT diskon (49);

/* 
    CASE nama_kolom
    
    - WHEN nilai1 THEN hasil1
    - WHEN nilai2 then hasil2
    - when nilai3 then hasil3
        Else hasil_lain
    End
 */


CREATE DATABASE TGS_15841;
