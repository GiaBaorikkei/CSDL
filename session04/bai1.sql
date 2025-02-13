create database session04;
use session04;

create table room (
	roomId int primary key,
    roomName varchar(100) not null,
    manager varchar(50) not null
);

create table computer(
	computerId int primary key,
    CPU int,
    RAM int,
    SSD int,
    foreign key(roomId) references room(roomId)
);

create table subjects(
	subjectId int primary key,
    subjectName varchar(200),
    duration datetime
);

create table register(
	 registerId int primary key,
     subjectId int not null,
     roomId int not null,
     dateStart date
);