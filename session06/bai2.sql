use session06;

-- Tạo bảng Orders
CREATE TABLE Orders2 (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,              
    CustomerName VARCHAR(100) NOT NULL,                 
    ProductName VARCHAR(100) NOT NULL,                  
    Quantity INT NOT NULL CHECK (Quantity > 0),         
    Price DECIMAL(10, 2) NOT NULL CHECK (Price > 0),    
    OrderDate DATE NOT NULL                             
);

-- Thêm giá trị vào bảng Orders
INSERT INTO Orders2 (CustomerName, ProductName, Quantity, Price, OrderDate)
VALUES
    ('Nguyen Van A', 'Laptop', 1, 15000000, '2025-01-01'),
    ('Tran Thi B', 'Smartphone', 2, 8000000, '2025-01-01'),
    ('Nguyen Van A', 'Headphones', 3, 2000000, '2025-01-03'),
    ('Le Van C', 'Laptop', 1, 15000000, '2025-01-01'),
    ('Nguyen Van A', 'Smartphone', 1, 8000000, '2025-01-05'),
    ('Tran Thi B', 'Headphones', 1, 2000000, '2025-01-05'),
    ('Le Van C', 'Smartphone', 3, 8000000, '2025-01-07'),
    ('Tran Thi B', 'Laptop', 1, 15000000, '2025-01-03');
    
--  Truy vấn để hiển thị tên khách hàng (CustomerName), tên sản phẩm (ProductName), và tổng số lượng sản phẩm đã mua (TotalQuantity), nhưng chỉ bao gồm các sản phẩm có tổng số lượng lớn hơn 1.
select CustomerName, ProductName, sum(Quantity) as TotalQuantity from Orders2 group by CustomerName, ProductName having TotalQuantity > 1;
-- Truy vấn để hiển thị tên khách hàng (CustomerName), ngày đặt hàng (OrderDate), và số lượng sản phẩm (Quantity), nhưng chỉ hiển thị các đơn hàng trong ngày mà số lượng sản phẩm lớn hơn 2.
select CustomerName, OrderDate, sum(Quantity) from Orders group by CustomerName, OrderDate having sum(Quantity) > 2;
-- Truy vấn để hiển thị tên khách hàng (CustomerName), ngày đặt hàng (OrderDate), và tổng số tiền đã chi tiêu (TotalSpent), nhưng chỉ bao gồm các nhóm khách hàng đã chi tiêu hơn 20,000,000 trong mỗi ngày.
select CustomerName, OrderDate, sum(Quantity * Price) as TotalSpent from Orders2 
group by CustomerName, OrderDate
having TotalSpent > 20000000;
