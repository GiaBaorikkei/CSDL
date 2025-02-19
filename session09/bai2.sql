use session09;

-- Tạo bảng employee
CREATE TABLE employees2 (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2) NOT NULL,
    manager_id INT NULL
);
-- Thêm dữ liệu vào bảng
INSERT INTO employees2 (name, department, salary, manager_id) VALUES
('Alice', 'Sales', 6000, NULL),         
('Bob', 'Marketing', 7000, NULL),     
('Charlie', 'Sales', 5500, 1),         
('David', 'Marketing', 5800, 2),       
('Eva', 'HR', 5000, 3),                
('Frank', 'IT', 4500, 1),              
('Grace', 'Sales', 7000, 3),           
('Hannah', 'Marketing', 5200, 2),     
('Ian', 'IT', 6800, 3),               
('Jack', 'Finance', 3000, 1);          

--  Tạo một view tên view_manager_summary hiển thị danh sách các quản lý với các cột: manager_id (mã quản lý) và total_employees (số nhân viên do quản lý phụ trách).
create view view_manager_summary as select manager_id, count(employee_id) as total_employees from employees2 group by manager_id having manager_id is not null ;
-- Tiến hành hiển thị lại view_manager_summary để kiểm chứng
select * from view_manager_summary; 
--  Kết hợp view view_manager_summary với bảng employees để hiển thị các cột: name (tên quản lý) và total_employees (số nhân viên quản lý).
select e.name, v.total_employees from view_manager_summary v
join employees2 e on v.manager_id = e.employee_id;





