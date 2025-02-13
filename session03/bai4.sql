use session03;

create table Students4 (
	student_id int primary key auto_increment,
    name varchar(255) not null,
    email varchar(255) unique,
    age int check (age > 0)
);

insert into Students4 (name, email, age) values 
('Nguyen Van A', 'nguyenvana@example.com', 22), 
('Le Thi B', 'lethib@example.com', 20), 
('Tran Van C', 'tranvanc@example.com', 23), 
('Pham Thi D', 'phamthid@example.com', 21);

select * from Students4;

select * from Students4 where student_id = 3;
