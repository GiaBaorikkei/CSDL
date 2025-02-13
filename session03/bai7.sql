use session03;

create table Students7 (
	student_id int primary key auto_increment,
    name varchar(255) not null,
    email varchar(255) not null unique,
    date_of_birthday date not null,
    gender enum('Male', 'Female', 'Other') not null,
    gpa decimal(3,2) check(gpa >= 0 and gpa <= 4) 
);

insert into Students7 (name, email, date_of_birthday, gender, gpa) values
('Nguyen Van A', 'nguyenvana@example.com', '2000-05-15', 'Male', 3.50),
('Tran Thi B', 'tranthib@example.com', '1999-08-22', 'Female', 3.80),
('Le Van C', 'levanc@example.com', '2001-01-10', 'Male', 2.70),
('Pham Thi D', 'phamthid@example.com', '1998-12-05', 'Female', 3.00),
('Hoang Van E', 'hoangvane@example.com', '2000-03-18', 'Male', 3.60),
('Do Thi F', 'dothif@example.com', '2001-07-25', 'Female', 4.00),
('Vo Van G', 'vovang@example.com', '2000-05-15', 'Male', 3.20),
('Nguyen Thi H', 'nguyenthih@example.com', '1999-09-15', 'Female', 2.90),
('Bui Van I', 'buivani@example.com', '2002-02-28', 'Male', 3.40),
('Tran Thi J', 'tranthij@example.com', '2001-06-12', 'Female', 3.75);

-- Lấy danh sách sinh viên có GPA lớn hơn 3.0 và là nữ
select * from Students7 where gpa > 3 and gender = 'Female';
-- Lấy thông tin sinh viên có GPA cao nhất mà ngày sinh sau năm 2000.
select * from Students7 where gpa = (select max(gpa) from Students7 where date_of_birthday > '2000-01-01');
-- Lấy danh sách sinh viên có ngày sinh trùng với ngày sinh của sinh viên có student_id = 1
select * from Students7 where date_of_birthday = (select date_of_birthday from Students7 where student_id = 1);
-- Tăng GPA thêm 0.5 cho sinh viên có GPA nhỏ hơn 2.5, nhưng không vượt quá 4.0.
update Students7 set gpa = if(gpa + 0.5, 4.0, gpa + 0.5) where gpa < 2.5;
-- Cập nhật giới tính thành "Other" cho sinh viên có email chứa ký tự "test" trong địa chỉ email
update Students7 set gender = 'Other' where email like '%test%';
-- Xóa sinh viên có ngày sinh sớm nhất trong bảng
delete from Students7 where date_of_birthday = (select min(date_of_birthday) from Students7);
-- Tính tuổi của tất cả sinh viên dựa trên ngày sinh (ngày hiện tại trừ ngày sinh) và hiển thị kèm theo tên.
select name, year(now()) - year(date_of_birthday) as age from Students7;  







