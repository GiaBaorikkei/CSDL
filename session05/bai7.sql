use session05;

-- Tạo bảng students
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Tạo bảng courses
CREATE TABLE courses7 (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    duration INT NOT NULL,
    fee DECIMAL(10, 2) NOT NULL
);

-- Tạo bảng enrollments
CREATE TABLE enrollments (
    enrollment_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
-- Thêm bản ghi vào bảng students
INSERT INTO students (name, email, phone)
VALUES
('Nguyen Van An', 'nguyenvanan@example.com', '0901234567'),
('Tran Thi Bich', NULL, '0912345678'),
('Le Van Cuong', 'levancuong@example.com', NULL),
('Pham Minh Hoang', 'phamminhhoang@example.com', '0934567890'),
('Do Thi Ha', NULL, NULL),
('Hoang Quang Huy', 'hoangquanghuy@example.com', '0956789012');



-- Thêm bản ghi vào bảng cources
INSERT INTO courses7 (course_name, duration, fee)
VALUES
('Python Basics', 30, 500000),
('Web Development', 50, 1000000),
('Data Science', 40, 1500000),
('Machine Learning', 60, 2000000),
('UI/UX Design', 20, 800000);

-- Thêm bản ghi vào bảng enrollments
INSERT INTO enrollments (student_id, course_id, enrollment_date)
VALUES
(1, 1, '2025-01-10'), 
(2, 2, '2025-01-11'), 
(3, 3, '2025-01-12'), 
(4, 1, '2025-01-13'), 
(6, 2, '2025-01-15'), 
(1, 2, '2025-01-16'), 
(2, 3, '2025-01-17'), 
(3, 1, '2025-01-18');

-- Truy vấn danh sách toàn bộ học viên (bao gồm cả những người chưa đăng ký khóa học),
-- hiển thị các trường: tên học viên (student_name), email (email), tên khóa học đã đăng ký (course_name, nếu có),
-- và ngày đăng ký (enrollment_date). Chỉ hiển thị học viên chưa có email hoặc có ngày đăng ký từ '2025-01-12' đến '2025-01-18'. Sắp xếp kết quả theo tên học viên tăng dần
select name, email, course_name, enrollment_date from students 
join enrollments on students.student_id = enrollments.student_id
join courses7 on courses7.course_id = enrollments.course_id
where enrollment_date between '2025-01-12' and '2025-01-18' or email is Null;
-- Truy vấn danh sách toàn bộ các khóa học (bao gồm cả những khóa học chưa có học viên nào đăng ký),
-- hiển thị các trường: tên khóa học (course_name), học phí (fee), tên học viên đã đăng ký (student_name, nếu có),
-- và ngày đăng ký (enrollment_date). Chỉ hiển thị các khóa học có học phí trên 1,000,000 hoặc các khóa học chưa có học viên nào đăng ký.
select course_name, fee, name, enrollment_date from courses7 
join enrollments on courses7.course_id = enrollments.course_id 
join students on students.student_id = enrollments.student_id
where fee > 1000000;
-- Truy vấn danh sách toàn bộ học viên và các khóa học (bao gồm cả học viên chưa đăng ký và khóa học chưa có người đăng ký),
-- hiển thị các trường: tên học viên (student_name), email (email), tên khóa học (course_name), và ngày đăng ký (enrollment_date).
select name, email, course_name, enrollment_date from students 
join enrollments on students.student_id = enrollments.student_id
join courses7 on courses7.course_id = enrollments.course_id
where fee > 1000000;