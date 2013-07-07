use app;

-- drop table if exists expensedetail;
-- drop table if exists expense;
-- drop table if exists user;

-- drop database if exists expenser;
-- create database expenser;

-- Table: User
create table user(
	id bigint not null auto_increment,
	username varchar(15) not null,
	passwd varchar(25) not null,
	email varchar(100),
	fullname char(100),
	primary key(id)
);

-- Table: Expense
create table expense(
	id bigint not null auto_increment,
	expense_amount double not null default 0,
	expense_by bigint not null,
	expense_tag varchar(100),
	expense_desc varchar(100),
	expense_split_type smallint default 1,
	primary key(id),
	foreign key(expense_by) references user(id)
);

-- Table: ExpenseDetail
create table expensedetail(
	expense_id bigint not null,
	expense_shared_by bigint not null,
	expense_share_amount double not null default 0,
	foreign key(expense_id) references expense(id),
	foreign key(expense_shared_by) references user(id),
	primary key(expense_id,expense_shared_by)
);

insert into user(username,passwd,email,fullname) values('rgodse','abc123','rgodse@csulb.edu','Rahul Godse');
insert into user(username,passwd,email,fullname) values('gjain','abc123','gjain@csulb.edu','Gaurav Jain');
insert into user(username,passwd,email,fullname) values('dipeshj','abc123','djain@csulb.edu','Dipesh Jain');
insert into user(username,passwd,email,fullname) values('ankitd','abc123','adhebar@csulb.edu','Ankit Dhebar');

insert into expense(expense_amount,expense_by,expense_tag,expense_desc,expense_split_type) values (40,1,'party','friscos',1);
insert into expense(expense_amount,expense_by,expense_tag,expense_desc,expense_split_type) values (20,3,'travel','bus ticket',1);
insert into expense(expense_amount,expense_by,expense_tag,expense_desc,expense_split_type) values (80,4,'party','bbc',1);
insert into expense(expense_amount,expense_by,expense_tag,expense_desc,expense_split_type) values (40,2,'party','friscos',0);

insert into expensedetail values(1,2,10);
insert into expensedetail values(1,3,10);
insert into expensedetail values(1,4,10);
insert into expensedetail values(1,1,10);
insert into expensedetail values(2,1,5);
insert into expensedetail values(2,2,5);
insert into expensedetail values(2,3,5);
insert into expensedetail values(2,4,5);
insert into expensedetail values(3,1,20);
insert into expensedetail values(3,2,20);
insert into expensedetail values(3,3,20);
insert into expensedetail values(3,4,20);
insert into expensedetail values(4,1,10);
insert into expensedetail values(4,2,30);

