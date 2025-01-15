use session02_database;

/*
	a, Phân tích và liệt kê các vấn đề trong bảng:
    - Thiếu khóa chính Primary key 
    - Thiếu ràng buộc Not null 
    - Không kiểm tra giá trị Diem
*/

create table Diem (
	maSV varchar(20) primary key not null,
    diem int not null,
    primary key (maSV),
    check (diem >= 0 and diem <= 10)
);
