-- Active: 1765006836152@@localhost@3306@office
show databases;

show tables;

create table Branch(
    branchNo char(4) primary key,
    street varchar(50),
    city varchar(20),
    postcode varchar(10)
);

create table Staff(
    staffNo varchar(10) primary key,
    fName varchar(15), 
    lname varchar(15),
    position varchar(10),
    sex char(1),
    DOB varchar(10),
    salary int,
    branchNo char(4)
);

INSERT INTO Branch VALUES
('B001', 'Jl Soekarno Hatta', 'Jakarta', '12345'),
('B002', 'Jl Setiabudi', 'Bandung', '23451'),
('B003', 'Jl Pahlawan', 'Semarang', '51234');

INSERT INTO Staff VALUES
('S001', 'Erick', 'Susanto', 'Manager', 'M', '1988-11-10', 8000000, 'B001'),
('S002', 'Ayu', 'Susanti', 'Supervisor', 'F', '1991-12-05', 6000000, 'B002'),
('S003', 'Dewangga', 'Saputro', 'Assistant', 'M', '1990-01-26', 3500000, 'B003');

alter table Staff change position position varchar(10) NOT NULL;

alter table Staff change sex sex CHAR(1) NOT NULL CHECK (sex IN('M', 'F'));

desc Staff;

drop table pegawai;


CREATE TABLE pegawai (
    nip CHAR(5) PRIMARY KEY,
    Nama VARCHAR(25) NOT NULL,
    Jns_kel CHAR(1) NOT NULL CHECK(jns_kel IN ('L', 'P')),
    Usia INT NOT NULL,
    Gaji INT,
    branchNo CHAR(4) NOT NULL, 
    Id_position INT DEFAULT 1,

    CONSTRAINT fk_branch FOREIGN KEY(branchNo) REFERENCES Branch(branchNO),
    CONSTRAINT fk_posisi FOREIGN KEY(Id_position) REFERENCES Position(ID_position)  
);



-- alter table pegawai
-- ADD CONSTRAINT fk_branch
-- FOREIGN KEY (branchNo)
-- REFERENCES Branch(BranchNo);

-- ALTER TABLE pegawai ADD COLUMN Id_position INT DEFAULT 1 AFTER Usia;
-- ALTER TABLE pegawai 
-- ADD CONSTRAINT fk_position 
-- FOREIGN KEY (Id_position) REFERENCES Position(ID_position);

-- show tables;
-- desc Position;
