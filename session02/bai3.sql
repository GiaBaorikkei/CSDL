use session02_database;

create table Products (
	idProduct int primary key,
    nameProduct varchar(100) not null,
    price decimal not null,
    quantity int
);
