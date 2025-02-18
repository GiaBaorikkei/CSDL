use session07;

-- Tạo bảng
-- Tạo bảng Departments
CREATE TABLE Departments4 (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL,
    location VARCHAR(255)
);

-- Tạo bảng Employees
CREATE TABLE Employees4 (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dob DATE,
    department_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES Departments(department_id) ON DELETE SET NULL
);

-- Tạo bảng Projects
CREATE TABLE Projects4 (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    start_date DATE,
    end_date DATE
);

-- Tạo bảng WorkReports
CREATE TABLE WorkReports4 (
    report_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    report_date DATE NOT NULL,
    report_content TEXT,
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE SET NULL
);

-- Tạo bảng Timesheets
CREATE TABLE Timesheets4 (
    timesheet_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    project_id INT,
    work_date DATE NOT NULL,
    hours_worked INT CHECK (hours_worked > 0),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id) ON DELETE CASCADE
);

INSERT INTO Departments4 (department_id, department_name, location) VALUES
(1, 'IT', 'Building A'),
(2, 'HR', 'Building B'),
(3, 'Finance', 'Building C');

INSERT INTO Employees4 (employee_id, name, dob, department_id, salary) VALUES
(1, 'Alice Williams', '1985-06-15', 1, 5000.00),
(2, 'Bob Johnson', '1990-03-22', 2, 4500.00),
(3, 'Charlie Brown', '1992-08-10', 1, 5500.00),
(4, 'David Smith', '1988-11-30', NULL, 4700.00);

INSERT INTO Projects4 (project_id, project_name, start_date, end_date) VALUES
(1, 'Project A', '2025-01-01', '2025-12-31'),
(2, 'Project B', '2025-02-01', '2025-11-30');

INSERT INTO WorkReports4 (report_id, employee_id, report_date, report_content) VALUES
(1, 1, '2025-01-31', 'Completed initial setup for Project A.'),
(2, 2, '2025-02-10', 'Completed HR review for Project A.'),
(3, 3, '2025-01-20', 'Worked on debugging and testing for Project A.'),
(4, 4, '2025-02-05', 'Worked on financial reports for Project B.'),
(5, NULL, '2025-02-15', 'No report submitted.');

INSERT INTO Timesheets4 (timesheet_id, employee_id, project_id, work_date, hours_worked) VALUES
(1, 1, 1, '2025-01-10', 8),
(2, 1, 2, '2025-02-12', 7),
(3, 2, 1, '2025-01-15', 6),
(4, 3, 1, '2025-01-20', 8),
(5, 4, 2, '2025-02-05', 5);


-- Hiển thị thông tin của tất cả các nhân viên
select * from Employees4;

-- Hiển thị thông tin của tất cả các dự án
select * from Projects4;

-- Lấy tên nhân viên và tên phòng ban mà họ đang làm việc.
select e.name, d.department_name from Employees4 e
join Departments4 d on d.department_id = e.department_id;

-- Lấy tên nhân viên và nội dung báo cáo công việc của họ
select e.name, w.report_content from Employees4 e
join WorkReports4 w on w.employee_id = e.employee_id;

-- Lấy tên nhân viên, tên dự án và số giờ làm việc cho mỗi dự án
select e.name, p.project_name, t.hours_worked from Employees4 e
join Timesheets4 t on t.employee_id = e.employee_id
join Projects4 p on p.project_id = t.project_id;

-- Lấy tên nhân viên và số giờ làm việc của họ cho dự án "Project A".
select e.name, t.hours_worked from Employees4 e
join Timesheets4 t on e.employee_id = t.employee_id
join Projects4 p on t.project_id = p.project_id
where p.project_name = 'Project A';


-- Cập nhật lương của các nhân viên có tên chứa từ "Alice" (ví dụ: Alice Williams) thành 6500.00.
update Employees4
set salary = 6500
where name like '%alice%';

-- Xóa tất cả báo cáo công việc của nhân viên có tên chứa từ "Brown" (ví dụ: Charlie Brown).
delete from WorkReports4 
where employee_id in (
    select employee_id from Employees4
    where name like '%Brown%'
);

-- Thêm một nhân viên mới có tên "James Lee", ngày sinh "1996-05-20", vào phòng ban "IT" (department_id = 1) với lương 5000.00.
insert into Employees4 (name, dob, department_id, salary) 
value ('James Lee', '1996-05-20', 1, 5000.00);
