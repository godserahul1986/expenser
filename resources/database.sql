drop table sharedetails;

drop table expenses;

drop table user;

drop database if exists expenser;

create database expenser;

use expenser;

create table user( userId int not null auto_increment, userEmail varchar(25), userLogin varchar(15) not null, userPassword varchar(25) not null, userFullName char(30), primary key(userId) )engine=InnoDB;

create table expenses( expenseId int not null auto_increment, expenseAmt int not null default 0, expenseBy int not null, expenseTag varchar(15), expenseDesc varchar(30), expenseType int(1) default 1, primary key(expenseId), foreign key(expenseBy) references user(userId) )engine=InnoDB;

create table sharedetails( expenseId int(11), expenseSharedBy int(11), expenseShareAmt int(11), foreign key(expenseId) references expenses(expenseId), foreign key(expenseSharedBy) references user(userId) )engine=InnoDB;

insert into user(userLogin,userEmail,userPassword,userFullName) values('rgodse','rgodse@csulb.edu','abc123','Rahul Godse');
insert into user(userLogin,userEmail,userPassword,userFullName) values('gjain','gjain@csulb.edu','abc123','Gaurav Jain');
insert into user(userLogin,userEmail,userPassword,userFullName) values('dipeshj','djain@csulb.edu','abc123','Dipesh Jain');
insert into user(userLogin,userEmail,userPassword,userFullName) values('ankitd','adhebar@csulb.edu','abc123','Ankit Dhebar');

insert into expenses(expenseAmt,expenseBy,expenseTag,expenseDesc,expenseType)values(40,1,'party','friscos',1);
insert into expenses(expenseAmt,expenseBy,expenseTag,expenseDesc,expenseType)values(20,3,'travel','bus ticket',1);
insert into expenses(expenseAmt,expenseBy,expenseTag,expenseDesc,expenseType)values(80,4,'party','bbc',1);
insert into expenses(expenseAmt,expenseBy,expenseTag,expenseDesc,expenseType)values(40,2,'party','friscos',0);

insert into sharedetails values(1,2,10);
insert into sharedetails values(1,3,10);
insert into sharedetails values(1,4,10);
insert into sharedetails values(1,1,10);
insert into sharedetails values(2,1,5);
insert into sharedetails values(2,2,5);
insert into sharedetails values(2,3,5);
insert into sharedetails values(2,4,5);
insert into sharedetails values(3,1,20);
insert into sharedetails values(3,2,20);
insert into sharedetails values(3,3,20);
insert into sharedetails values(3,4,20);
insert into sharedetails values(4,1,10);
insert into sharedetails values(4,2,30);







