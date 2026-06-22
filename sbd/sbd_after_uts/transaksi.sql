-- Active: 1765006836152@@localhost@3306@banks
CREATE DATABASE banks;

/* 
Transaksi mencakup query:
    1. Insert
    2. Select
    3. Update
    4. Kombinasi ketiga tersebut
Commit untuk mengakhiri transaksi sql (jika tidak ada kesalahan)
Rollback membatalkan semua perubahan dan database dikembalikan seperti semula (jika terdapat command yang salah atau ingin diulang)
 */


CREATE TABLE users (
    id int primary key,
    username varchar(50) not null,
    email varchar(50)
);

/* Start transaction dan commit */
delimiter //
start TRANSACTION;
INSERT INTO users (id, username) VALUES (1, 'Andi');
UPDATE users set email='andi@example.com' WHERE id =1;
SELECT * FROM users;
commit;
//

DELIMITER //
start transaction;
insert into users (id, username) values (2, 'Wati');
update users SET email='wati@example.com' where id = 2;
SELECT * FROM users;
ROLLBACK;
//

SELECT * FROM users;

CREATE TABLE accounts(
    account_id INT AUTO_INCREMENT PRIMARY KEY,
    account_holder VARCHAR(50) NOT NULL,
    balance DECIMAL (10, 2) NOT NULL
);

CREATE TABLE transactions(
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    account_id INT NOT NULL,
    amount DECIMAL (10, 2) NOT NULL,
    transaction_type ENUM ('DEPOSIT', 'WITHDRAW') NOT NULL,
    FOREIGN KEY (account_id) REFERENCES accounts (account_id)
);

INSERT INTO accounts (account_holder, balance) 
VALUES ('ANDI', 100000.00), ('WATI', 500000.00);

select * from accounts;

DELIMITER //  -- 1. Ubah delimiter dulu

CREATE PROCEDURE transfer (IN sender_id INT, IN receiver_id INT, IN amount DECIMAL(10,2))
BEGIN 
    DECLARE rollback_message VARCHAR(255) DEFAULT 'Transaction Rolledback: Dana tidak cukup';
    DECLARE commit_message VARCHAR(2 55) DEFAULT 'Transaction Commited Successfully';

    START TRANSACTION;

    UPDATE accounts SET balance = balance - amount WHERE account_id = sender_id;
    UPDATE accounts SET balance = balance + amount WHERE account_id = receiver_id;

    IF (SELECT balance FROM accounts WHERE account_id = sender_id) < 0 THEN 
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = rollback_message; -- Pastikan nulisnya sebaris ini
    ELSE 
        INSERT INTO transactions(account_id, amount, transaction_type) VALUES (sender_id, amount, 'WITHDRAW');
        INSERT INTO transactions(account_id, amount, transaction_type) VALUES (receiver_id, amount, 'DEPOSIT');
        COMMIT;
        SELECT commit_message AS 'Result';
    END IF;
END //        -- 2. Tutup procedure dengan delimiter baru

DELIMITER ;   -- 3. Kembalikan ke delimiter semula

SELECT * FROM accounts;

call transfer(1,2,25000);

SELECT * FROM accounts;
SELECT * FROM transactions;
call transfer(1,2,900000);
SELECT * FROM transactions;

DELIMITER//

CREATE PROCEDURE Deposit (in ID int, in amount Decimal(10,2))
BEGIN

INSERT into transactions (account_id, amount) VALUES (ID, amount) ;
UPDATE accounts SET balance = balance + amount where account_id = ID;

COMMIT;
SELECT * FROM transactions;
END//

DELIMITER;

CALL Deposit();

