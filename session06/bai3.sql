use session06;

-- Tạo bảng Orders
CREATE TABLE Orders3 (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,              
    CustomerName VARCHAR(100) NOT NULL,                 
    ProductName VARCHAR(100) NOT NULL,                  
    Quantity INT NOT NULL CHECK (Quantity > 0),         
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),    
    OrderDate DATE NOT NULL                             
);

-- Thêm giá trị vào bảng Orders
INSERT INTO Orders3 (CustomerName, ProductName, Quantity, Price, OrderDate)
VALUES
    ('Nguyen Van A', 'Laptop', 1, 15000000, '2025-01-01'),
    ('Tran Thi B', 'Smartphone', 2, 8000000, '2025-01-01'),
    ('Nguyen Van A', 'Headphones', 3, 2000000, '2025-01-03'),
    ('Le Van C', 'Laptop', 1, 15000000, '2025-01-01'),
    ('Nguyen Van A', 'Smartphone', 1, 8000000, '2025-01-05'),
    ('Tran Thi B', 'Headphones', 1, 2000000, '2025-01-05'),
    ('Le Van C', 'Smartphone', 3, 8000000, '2025-01-07'),
    ('Tran Thi B', 'Laptop', 1, 15000000, '2025-01-03');

-- Truy vấn để tìm giá trị nhỏ nhất (MinPrice) và lớn nhất (MaxPrice) của cột giá sản phẩm (Price).
select max(price) as MaxPrice, min(price) as MinPrice from Orders3;
-- Truy vấn để đếm số lượng đơn hàng được đặt bởi từng khách hàng. Hiển thị các trường: tên khách hàng (CustomerName) và số lượng đơn hàng (OrderCount).
select CustomerName, count(Quantity) from Orders3 group by CustomerName;
-- Truy vấn để tìm ngày đặt hàng sớm nhất (EarliestDate) và muộn nhất (LatestDate) trong bảng dữ liệu. 
select min(OrderDate) as EarliestDate, max(OrderDate) as LatestDate from Orders3;

