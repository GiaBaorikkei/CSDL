create database session02_database;
use session02_database;

-- Primary key: ràng buộc dùng để xác định một cột hoặc tập hợp cột có giá trị duy nhất cho mỗi bản ghi trong bảng
create table Students (
	idStudent int primary key,
    nameStudent varchar(100)
);

-- Not null: ràng buộc đảm bảo rằng một cột không được chứa giá trị NULL
create table Employees (
	idEmployee int primary key,
    nameEmployee varchar(100) not null
);

-- Foreign: ràng buộc dùng để tạo mối quan hệ giữa 2 bảng, đảm bảo giá trị trong 1 cột hoặc tập hợp cột phải khớp với giá trị trong một cột của bảng khác
create table Customers (
    idCustomer int primary key,
    nameCustomer varchar(100) not null
);
create table Orders (
	idOrder int primary key,
    idCustomer int,
	foreign key (idCustomer) references Customers(idCustomer)
);