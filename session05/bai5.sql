use session05;

-- Tạo bảng students
CREATE TABLE students5 (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Tạo bảng courses
CREATE TABLE courses (
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
    FOREIGN KEY (student_id) REFERENCES students5(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
-- Thêm bản ghi vào bảng students
INSERT INTO students5 (student_name, email, phone)
VALUES
('Nguyen Van An', 'nguyenvanan@example.com', '0901234567'),
('Tran Thi Bich', NULL, '0912345678'),
('Le Van Cuong', 'levancuong@example.com', NULL),
('Pham Minh Hoang', 'phamminhhoang@example.com', '0934567890'),
('Do Thi Ha', NULL, NULL),
('Hoang Quang Huy', 'hoangquanghuy@example.com', '0956789012');

-- Thêm bản ghi vào bảng cources
INSERT INTO courses (course_name, duration, fee)
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

-- Truy vấn để lấy tên học viên (student_name), email (email), tên khóa học (course_name), học phí (fee), 
-- và ngày đăng ký (enrollment_date). Chỉ lấy học viên có ngày đăng ký nằm trong khoảng '2025-01-12' đến '2025-01-18' và học phí trên 800,000.
select student_name, email, course_name, fee, enrollment_date from students5 
join enrollments on students5.student_id = enrollments.student_id 
join courses on courses.course_id = enrollments.course_id
where enrollment_date between '2025-01-12' and '2025-01-18' and fee > 800000;
-- Truy vấn để lấy tên học viên (student_name), tên khóa học (course_name), và học phí (fee) cho những học viên đăng ký khóa học có học phí dưới 1,000,000 hoặc không thuộc khóa học "Python Basics"
select student_name, course_name, fee from students5 
join enrollments on students5.student_id = enrollments.student_id 
join courses on courses.course_id = enrollments.course_id
where fee < 1000000 or course_name not in ('Python Basics') limit 5;
-- Truy vấn để lấy tên học viên (student_name), tên khóa học (course_name), học phí (fee), 
-- và ngày đăng ký (enrollment_date) cho những học viên đã đăng ký khóa học có tên "Web Development" hoặc "Data Science"
select student_name, email, course_name, fee, enrollment_date from students5 
join enrollments on students5.student_id = enrollments.student_id 
join courses on courses.course_id = enrollments.course_id
where course_name = 'Web Development' or course_name = 'Data Science' limit 3;



