-- Active: 1765006836152@@localhost@3306@lat_UTS_SBD2
CREATE DATABASE lat_UTS_SBD2;
create table barang(
    kode_brg char(3) PRIMARY KEY,
    nama_brg varchar(100),
    satuan char(10),
    jml_stok int(5)
);
drop table barang;

INSERT INTO barang VALUES
('100', 'Laptop Axioo i3 4Gb', 'Unit', 20),
('200', 'Monitor LED Lenovo L24E-20 24 Inch 1080p VGA HDMI Freesync', 'Unit', 25),
('300', 'Logitech K120 USB Wired Keyboard', 'Unit', 30);

create table t_jual(
    kode_jual char(2) primary key,
    nm_konsumen char(15),
    almt_kons char(20),
    kota_kons char(15),
    tgl_jual DATE,
    kode_brg char(3),
    jml_jual int(4),
    CONSTRAINT fk_barang_jual FOREIGN KEY (kode_brg) REFERENCES barang(kode_brg)
);

create table t_beli (
    kode_beli char(2) primary key,
    nm_supplier char(15),
    tgl_beli date,
    kode_brg char(3),
    jml_beli int(4),
    CONSTRAINT fk_barang_beli FOREIGN KEY (kode_brg) REFERENCES barang (kode_brg)
);

/* Stored Procedure */

/* End of Stored Procedure */

/* Trigger */
    
/* End of Trigger */