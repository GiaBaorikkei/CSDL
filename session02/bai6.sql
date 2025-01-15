use session02_database;

create table Employees (
    idEmployee int key,
    nameEmployee varchar(100) not null,
    startDate date,
    wage float default 5000
);

insert into Employees (idEmployee, nameEmployee, startDate, wage) values
(1, 'Nguyễn Văn A', '15-01-2024', 5000),
(2, 'Nguyễn Văn B', '26-03-2022', 5000),
(3, 'Nguyễn Văn C', '12-06-2021', 5000);

update Employees
set wage = 7000
where idEmployee = 1;

delete from Employees
where idEmployee = 3;
