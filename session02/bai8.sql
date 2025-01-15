use session02_database;

/*
	a, Phân tích và liệt kê các vấn đề trong bảng:
    - Thiếu khóa chính Primary key 
    - Thiếu ràng buộc Not null 
    - Không kiểm tra giá trị Diem
    - Điểm là 1 thực thể yếu nên cần 2 khóa kết hợp tạo ra 1 khóa chính
*/

create table sinhVien (
    maSV int primary key,
    ten varchar(100) not null
);

create table mon (
    maMon int primary key,
    tenMon varchar(200) not null
);

create table Diem (
    maSV int not null,
    maMon int not null,
    diem int not null,
    primary key (maSV, maMon),
    foreign key (maSV) references sinhVien(maSV) on delete cascade,
    foreign key (maMon) references mon(maMon) on delete cascade,
    check (diem >= 0 and diem <= 10)
);

