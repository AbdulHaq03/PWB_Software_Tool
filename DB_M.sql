drop database dbproj;
create database dbproj;
use dbproj;

create table user (
id int not null auto_increment primary key,
name varchar(60) not null,
role varchar(50) not null,
address varchar(125) not null,
dob date not null,
gender varchar(1) not null,
email varchar(80) not null,
password varchar(50) not null,
check (email like '%@%.com'),
check (length(password) >= 8),
check (role = 'admin' or role = 'manager' or role = 'member' or role = 'customer'),
check (gender = 'M' or gender = 'F')
);

create table project (
id int not null auto_increment primary key,
name varchar(50) not null,
creation date not null,
mgrid int not null,
foreign key (mgrid) references user(id)
);

create table team (
id int not null auto_increment primary key,
lid int not null,
foreign key (lid) references user(id)
);

create table task(
id int not null auto_increment primary key,
type varchar(50) not null,
priority varchar(25) not null,
status varchar(25) not null,
due date not null,
description varchar(150) not null,
comments varchar(150) not null,
attachments varchar(150),
cid int not null,
foreign key (cid) references user(id),
check (status = 'Completed' or status = 'Assigned' or status = 'Pending'),
check (priority = 'Urgent' or priority = 'High' or priority = 'Medium' or priority = 'Low'),
check (attachments like '%.com')
);

create table user_tasks (
uid int not null,
tid int not null,
pid int not null,
foreign key (uid) references user(id),
foreign key (tid) references task(id),
foreign key (pid) references project(id)
);

create table user_project (
uid int not null,
pid int not null,
foreign key (uid) references user(id),
foreign key (pid) references project(id)
);

create table user_team (
uid int not null,
tid int not null,
foreign key (uid) references user(id),
foreign key (tid) references team(id)
);

create table team_project (
tid int not null,
pid int not null,
foreign key (tid) references team(id),
foreign key (pid) references project(id)
);

insert into user (name, role, address, dob, gender, email, password) values
('Hamiz', 'admin', 'House 46 Street 4 E-11/2', '2003-08-13', 'M', 'hamizsiddiqui138@gmail.com', 'hamiz138'),
('Abdul Haque', 'customer', 'Mehera', '2002-08-28', 'M', 'hayiiii@hotmail.com', 'hayiiiii123')
;

select * from user;