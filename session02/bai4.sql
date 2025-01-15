use session02_database;

create table Employees (
    idEmployee int key,
    nameEmployee varchar(100) not null,
    startDate date,
    wage float default 5000
);