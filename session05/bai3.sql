use session05;

-- Tạo bảng customers
CREATE TABLE customers3 (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    address VARCHAR(255)
);

-- Tạo bảng orders
CREATE TABLE orders3 (
    order_id INT AUTO_INCREMENT PRIMARY KEY, 
    customer_id INT, -- Khóa ngoại
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) 
);

-- Thêm bản ghi vào bảng customers
INSERT INTO customers3 (name, email, phone, address)
VALUES
('Nguyen Van An', 'nguyenvanan@example.com', '0901234567', '123 Le Loi, TP.HCM'),
('Tran Thi Bich', 'tranthibich@example.com', '0912345678', '456 Nguyen Hue, TP.HCM'),
('Le Van Cuong', 'levancuong@example.com', '0923456789', '789 Dien Bien Phu, Ha Noi');

-- Thêm bản ghi vào bảng orders
INSERT INTO orders3 (customer_id, order_date, total_amount, status)
VALUES
(1, '2025-01-10', 500000, 'Pending'),
(1, '2025-01-12', 325000, 'Completed'),
(NULL, '2025-01-13', 450000, 'Cancelled'),
(3, '2025-01-14', 270000, 'Pending'),
(2, '2025-01-16', 850000, NULL);

-- Lấy tên khách hàng, số điện thoại, mã đơn hàng, và số tiền của những đơn hàng có trạng thái là Pending và tổng tiền lớn hơn 300,000. Kết quả trả về các trường name, phone, order_id, total_amount
select name, phone, order_id, total_amount from orders3 
join customers3 on orders3.customer_id = customers3.customer_id 
where status = 'Pending' and total_amount > 300000;
-- Lấy tên khách hàng, email, và mã đơn hàng của những khách hàng có đơn hàng đã hoàn thành hoặc chưa có trạng thái đơn hàng (status là NULL). Kết quả trả về các trường name, email, order_id 
select name, email, order_id from customers3 join orders3 on orders3.customer_id = customers3.customer_id where status = 'Completed' or status is NULL;
-- Lấy tên khách hàng, địa chỉ, mã đơn hàng, và trạng thái đơn hàng của những đơn hàng có trạng thái là Pending hoặc Cancelled. Kết quả trả về các trường name, address, order_id, status
select name, address, order_id, status from customers3 join orders3 on orders3.customer_id = customers3.customer_id where status = 'Pending' or status = 'Cancelled';
-- Lấy tên khách hàng, số điện thoại, mã đơn hàng, và số tiền của những đơn hàng có tổng tiền nằm trong khoảng từ 300,000 đến 600,000. Kết quả trả về các trường name, phone, order_id, total_amount
select name, phone, order_id, total_amount from customers3 join orders3 on orders3.customer_id = customers3.customer_id where total_amount between 300000 and 600000;


