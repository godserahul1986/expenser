USE expenser;

DROP TABLE IF EXISTS expensedetail;
DROP TABLE IF EXISTS expense;
DROP TABLE IF EXISTS user;

-- DROP DATABASE IF EXISTS expenser;
-- CREATE DATABASE expenser;

-- Table: User
CREATE TABLE IF NOT EXISTS user(
	id bigint NOT NULL auto_increment,
	username varchar(15) NOT NULL,
	passwd varchar(25) NOT NULL,
	email varchar(200) NOT NULL,
	fullname varchar(200),
	registered bool DEFAULT true,
	active bool DEFAULT true,
	deleted bool DEFAULT false,
	PRIMARY KEY (id),
	UNIQUE KEY `ak_user_username` (username),
	UNIQUE KEY `ak_user_email` (email)
);

-- Table: Expense
CREATE TABLE IF NOT EXISTS expense(
	id bigint NOT NULL auto_increment,
	expense_amount double NOT NULL DEFAULT 0,
	expense_by bigint NOT NULL,
	expense_tag varchar(200),
	expense_desc varchar(200) NOT NULL,
	expense_date timestamp NOT NULL,
	expense_split_type smallint DEFAULT 1, -- 1 for evenly, 0 for different amounts
	deleted bool DEFAULT false,
	PRIMARY KEY (id),
	FOREIGN KEY (expense_by) REFERENCES user(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

-- Table: ExpenseDetail
CREATE TABLE IF NOT EXISTS expensedetail(
	expense_id bigint NOT NULL,
	expense_shared_by bigint NOT NULL,
	expense_share_amount double NOT NULL DEFAULT 0,
	expense_settle bool DEFAULT false,
	expense_settle_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	expense_settle_comment varchar(200),
	deleted bool DEFAULT false,
	PRIMARY KEY (expense_id,expense_shared_by),
	FOREIGN KEY (expense_id) REFERENCES expense(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	FOREIGN KEY (expense_shared_by) REFERENCES user(id)
		ON DELETE CASCADE
		ON UPDATE CASCADE
);

INSERT INTO user(id,username,passwd,email,fullname) VALUES(1,'rgodse','abc123','rgodse@csulb.edu','Rahul Godse');
INSERT INTO user(id,username,passwd,email,fullname) VALUES(2,'gjain','abc123','gjain@csulb.edu','Gaurav Jain');
INSERT INTO user(id,username,passwd,email,fullname) VALUES(3,'dipeshj','abc123','djain@csulb.edu','Dipesh Jain');
INSERT INTO user(id,username,passwd,email,fullname) VALUES(4,'ankitd','abc123','adhebar@csulb.edu','Ankit Dhebar');

INSERT INTO expense(id,expense_amount,expense_by,expense_tag,expense_desc,expense_date,expense_split_type) VALUES (1,40,1,'party','friscos',TIMESTAMP(NOW()),1);
INSERT INTO expense(id,expense_amount,expense_by,expense_tag,expense_desc,expense_date,expense_split_type) VALUES (2,20,3,'travel','bus ticket',TIMESTAMP(NOW()),1);
INSERT INTO expense(id,expense_amount,expense_by,expense_tag,expense_desc,expense_date,expense_split_type) VALUES (3,80,4,'party','bbc',TIMESTAMP(NOW()),1);
INSERT INTO expense(id,expense_amount,expense_by,expense_tag,expense_desc,expense_date,expense_split_type) VALUES (4,40,2,'party','friscos',TIMESTAMP(NOW()),0);
INSERT INTO expense(id,expense_amount,expense_by,expense_tag,expense_desc,expense_date,expense_split_type) VALUES (5,30,2,'party','friscos2',TIMESTAMP(NOW()),1);
INSERT INTO expense(id,expense_amount,expense_by,expense_tag,expense_desc,expense_date,expense_split_type) VALUES (6,10,1,'party','friscos3',TIMESTAMP(NOW()),1);

INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(1,2,10);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(1,3,10);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(1,4,10);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(2,1,5);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(2,2,5);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(2,4,5);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(3,1,20);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(3,2,20);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(3,3,20);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(4,1,10);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(4,2,20);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(5,1,10);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(5,2,10);
INSERT INTO expensedetail(expense_id,expense_shared_by,expense_share_amount) VALUES(6,3,5);
