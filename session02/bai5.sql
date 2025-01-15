use session02_database;

create table Customers (
	idCustomer int primary key,
    nameCustomer varchar(100),
    phone varchar(15)
);

create table Invoices (
	idInvoice int primary key,
    dateInvoice date,
    idCustomer int,
    foreign key (idCustomer) references Customers(idCustomer)
);

