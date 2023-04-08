
-- @blockname Q1 Create database of your name and create the tables as specified above.
drop database if exists prashant1_bank;
create database if not EXISTS prashant1_bank;
use prashant1_bank;
CREATE table Staff(
    staff_id int AUTO_INCREMENT,
    staff_name varchar(255) not null,
    staff_address varchar(255),
    primary key(staff_id)
);
create table Branch (
    branch_id int primary key not null,
    staff_id int not null,
    branch_address varchar(255) not null,
    assets varchar(255),
    foreign key (staff_id) references Staff(staff_id) on delete cascade on update cascade
);
create table Customer(
    customer_id int primary key not null,
    customer_name varchar(50) not null,
    customer_address varchar(255),
    customer_phone numeric(13),
    customer_DOB varchar(55)
);
create table Loan(
    loan_number numeric(10) primary key not null,
    branch_id int not null,
    amount int,
    foreign key (branch_id) references Branch(branch_id) on delete cascade on update cascade
);
CREATE table Borrower(
    customer_id int primary key not null,
    branch_id int not null,
    balance int,
    foreign key (customer_id) references Customer(customer_id) on delete cascade on update cascade,
    foreign key (branch_id) references Branch(branch_id) on delete cascade on update cascade
);
CREATE table Account(
    account_number varchar(5) primary key not null,
    branch_id int not null,
    balance int,
    foreign key (branch_id) references Branch(branch_id) on delete cascade on update cascade
);
CREATE table Depositor(
    customer_id int not null,
    account_number varchar(5) not null,
    primary key (customer_id, account_number),
    foreign key (customer_id) references Customer(customer_id) on delete cascade on update cascade,
    foreign key (account_number) references Account(account_number) on delete cascade on update cascade
);


--@blockname Q2 Populate at least 10 data record in each tables. Your value should look like realistic.
INSERT INTO staff (staff_name, staff_address)
VALUES ("Prashant Manandhar", "Banepa"),
    ("Ram Smith", "Kathmandu"),
    ("Pramish Shresthar", "Banepa"),
    ("Shyam Thapa", "Kavre"),
    ("Hari Bhahadur", "Bhaktapur"),
    ("Rita Dhahal", "Canada"),
    ("Ritik Adhikari", "Kathmandu"),
    ("Sakril Baral", "Banepa"),
    ("Sita Sharma", "Kavre"),
    ("Sandip Bhahadur", "Bhaktapur"),
    ("Rajkumar Dhahal", "Canada");
INSERT INTO branch (branch_id, staff_id, branch_address, assets)
VALUES (001, 1, "Banepa", "xyz.."),
    (002, 2, "Kathmandu", "xyz.."),
    (003, 3, "Bhaktapur", "xyz.."),
    (004, 4, "Sanga", "xyz.."),
    (005, 5, "Dhulikhel", "xyz.."),
    (006, 6, "Lalitpur", "xyz.."),
    (007, 7, "Biratnagar", "xyz.."),
    (008, 8, "Canada", "xyz.."),
    (009, 9, "Pokhara", "xyz.."),
    (010, 10, "Canada", "xyz.."),
    (011, 11, "USA", "xyz..");
INSERT INTO customer (
        customer_id,
        customer_name,
        customer_address,
        customer_phone,
        customer_DOB
    )
VALUES (
        1,
        "Harper Thompson",
        "esper Peak",
        6958204371,
        "1995-07-21"
    ),
    (
        2,
        "Malik Patel",
        "Nayasadak",
        7136498250,
        "1998-03-12"
    ),
    (
        3,
        "Savannah Rodriguez",
        "Jordan",
        8372569140,
        "1991-11-29"
    ),
    (
        4,
        "Leo Wong",
        " Vietnam",
        9524710368,
        "1992-09-06"
    ),
    (
        5,
        "Lila Singh",
        "Nayasadak",
        4816302975,
        "2001-12-05"
    ),
    (
        6,
        "Elijah Green",
        " Croatia",
        5682497301,
        "1994-05-18"
    ),
    (
        7,
        "Amara Johnson",
        " China",
        2461783095,
        "2004-02-10"
    ),
    (
        8,
        "Luca Davis",
        "Bolivia",
        7849325160,
        "2005-06-30"
    ),
    (9, "Ava Kim", " Kenya", 3194578260, "1993-10-26"),
    (
        10,
        "Owen Garcia",
        " Nayasadak",
        6258740931,
        "1997-01-17"
    ),
    (
        11,
        "Isla Martinez",
        "Turkey",
        1029384756,
        "2002-08-11"
    );
INSERT INTO loan (loan_number, branch_id, amount)
VALUES (1, 001, 10000),
    (2, 005, 30000),
    (3, 001, 50000),
    (4, 009, 70000),
    (5, 003, 90000),
    (6, 001, 200000),
    (7, 003, 400000),
    (8, 001, 600000),
    (9, 006, 800000),
    (10, 010, 900000),
    (11, 008, 1200000);
INSERT INTO borrower (customer_id, branch_id, balance)
VALUES (1, 001, 100000),
    (2, 002, 700000),
    (3, 003, 800000),
    (4, 004, 19800000),
    (5, 005, 300000),
    (6, 006, 4500000),
    (7, 007, 12100000),
    (8, 008, 1600000),
    (9, 009, 18900000),
    (10, 010, 9700000),
    (11, 011, 2300000);
INSERT INTO account (account_number, branch_id, balance)
VALUES ("001A", 001, 100000),
    ("002B", 002, 700000),
    ("003A", 003, 800000),
    ("004D", 004, 19800000),
    ("005S", 005, 300000),
    ("006G", 006, 4500000),
    ("007H", 007, 12100000),
    ("008J", 008, 1600000),
    ("009L", 009, 18900000),
    ("001E", 010, 9700000),
    ("001H", 011, 2300000);
INSERT INTO depositor (customer_id, account_number)
VALUES (1, "001A"),
    (2, "002B"),
    (3, "003A"),
    (4, "004D"),
    (5, "005S"),
    (6, "006G"),
    (7, "007H"),
    (8, "008J"),
    (9, "009L"),
    (10, "001E"),
    (11, "001H");
--@blockname Display all the data of each of the tables.
SELECT *
from staff;
SELECT *
from branch;
SELECT *
from customer;
SELECT *
from loan;
SELECT *
from borrower;
SELECT *
from account;
SELECT *
from depositor;
--@blockname Q4 Add an attribute in the table staff as designation.
alter table staff
add designation varchar(50);
--@blockname Q5 Display all the data of staff.
SELECT *
from staff;
--@blockname Q6 Update your table staff with at least 2 managers, 5 Assistant, 2 officers, 1 guard.
UPDATE staff
SET designation = 'Manager'
WHERE staff_id = 1;
UPDATE staff
SET designation = 'Assistant'
WHERE staff_id = 2;
UPDATE staff
SET designation = 'Assistant'
WHERE staff_id = 3;
UPDATE staff
SET designation = 'officers'
WHERE staff_id = 4;
UPDATE staff
SET designation = 'guard'
WHERE staff_id = 5;
UPDATE staff
SET designation = 'Manager'
WHERE staff_id = 6;
UPDATE staff
SET designation = 'officers'
WHERE staff_id = 7;
UPDATE staff
SET designation = 'Assistant'
WHERE staff_id = 8;
UPDATE staff
SET designation = 'Assistant'
WHERE staff_id = 9;
UPDATE staff
SET designation = 'Assistant'
WHERE staff_id = 10;
UPDATE staff
SET designation = 'Manager'
WHERE staff_id = 11;
--@blockname Q7 Display all the data of staff
select *
from staff;
--@blockname Q8 Smith is no longer staff in the bank. Update the table/s accordingly.
delete from staff
where staff_name like "%Smith%";
--@blockname Q9 Display all the data of staff and look whether smith is still there or not.
SELECT *
from staff;
select *
from staff
where staff_name like "%Smith%";
--@blockname Q10. Find the account number who has the maximum balance.
select account_number as Max_balance_account_number
from account
WHERE balance = (
        SELECT max(balance)
        from account
    );
--@blockname Q11. Can you tell me how much balance will remain after I withdrew 5000 from my account number „005S‟.
select account_number,
    branch_id,
    balance,
    (balance -5000) as updated_balance
from account
where account_number = "005S";
--@blockname Q12. Find the youngest customer in the bank.
select *
from customer
where customer_DOB =(
        select max(customer_DOB)
        from customer
    );
--@blockname Q13. List the ID of the branches which has issued the loan amount greater than 10000.
select distinct branch_id
from loan
where amount > 10000;
--@blockname Q14. Can you list the number of the customer from address “Nayasadak”.
select *
from customer
where customer_address = "Nayasadak";
--@BLOCKNAME Q15. Drop database your name.
drop database if exists prashant1_bank