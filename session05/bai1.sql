create database session05;
use session05;

create table Customers (
	customer_id int auto_increment primary key,
    name varchar(100) not null,
    email varchar(100) unique,
    phone varchar(15),
    address varchar(255)
);

create table Orders(
	order_id int auto_increment primary key,
    customer_id int,
    order_date date not null,
    total_amount decimal(10,2) not null,
    status varchar(50),
    foreign key (customer_id) references Customers(customer_id)
);

INSERT INTO Customers (name, email, phone, address)
VALUES
('Nguyen Van An', 'nguyenvanan@example.com', '0901234567', '123 Le Loi, TP.HCM'),
('Tran Thi Bich', 'tranthibich@example.com', '0912345678', '456 Nguyen Hue, TP.HCM'),
('Le Van Cuong', 'levancuong@example.com', '0923456789', '789 Dien Bien Phu, Ha Noi');

-- Thêm bản ghi vào bảng orders
INSERT INTO Orders (customer_id, order_date, total_amount, status)
VALUES
(1, '2025-01-10', 500000, 'Pending'),
(1, '2025-01-12', 325000, 'Completed'),
(NULL, '2025-01-13', 450000, 'Cancelled'),
(3, '2025-01-14', 270000, 'Pending'),
(2, '2025-01-16', 850000, NULL);

-- Viết câu lệnh truy vấn để lấy toàn bộ dữ liệu từ bảng orders và bảng customers, bao gồm cả những đơn hàng không có khách hàng liên kết
select order_id, order_date, total_amount, name, email from Orders left join Customers on Orders.customer_id = Customers.customer_id;
-- Viết câu lệnh truy vấn để lấy thông tin khách hàng (customer_id, name, phone) từ bảng customers và thông tin đơn hàng (order_id, status) từ bảng orders, bao gồm cả những khách hàng không có đơn hàng
select c.customer_id, name, phone, order_id, status from Customers c right join Orders o on o.customer_id = c.customer_id;
-- Viết câu lệnh truy vấn để lấy thông tin khách hàng (customer_id, name) và thông tin đơn hàng (order_id, total_amount, order_date), chỉ hiển thị những đơn hàng có liên kết với khách hàng
select o.customer_id, name, order_id, total_amount, order_date  from Orders o inner join Customers c on o.customer_id = c.customer_id;





