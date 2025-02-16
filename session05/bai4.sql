use session05;

-- Tạo bảng products
CREATE TABLE products4 (
    product_id INT AUTO_INCREMENT PRIMARY KEY, 
    product_name VARCHAR(100) NOT NULL,        
    category VARCHAR(50) NOT NULL,            
    price DECIMAL(10, 2) NOT NULL,            
    stock_quantity INT NOT NULL               
);

-- Thêm bản ghi vào products
INSERT INTO products4 (product_name, category, price, stock_quantity)
VALUES
('Laptop Dell XPS 13', 'Electronics', 25999.99, 10),
('Nike Air Max 270', 'Footwear', 4999.00, 50),
('Samsung Galaxy S22', 'Electronics', 19999.99, 25),
('T-Shirt Uniqlo', 'Clothing', 299.99, 100),
('Apple AirPods Pro', 'Accessories', 5999.00, 15),
('T-Shirt Apolo', 'Clothing', 199.99, 100);

-- Viết câu lệnh truy vấn thống kê giá cao nhất của sản phẩm theo từng loại 
SELECT product_name, p.category, price, stock_quantity 
FROM products4 p
WHERE price = (
    SELECT MAX(price) FROM products4 WHERE category = p.category
);
-- Truy vấn để lấy 2 sản phẩm tiếp theo sau khi bỏ qua 2 sản phẩm đầu tiên. Kết quả trả về các trường product_name, category, price, stock_quantity 
select product_name, category, price, stock_quantity from products4 limit 2 offset 2;
-- Truy vấn để lấy tất cả các sản phẩm thuộc danh mục Electronics, sắp xếp theo giá giảm dần. Kết quả trả về các trường product_name, category, price, stock_quantity
select product_name, category, price, stock_quantity from products4 where category = 'Electronics' order by price desc;
-- Truy vấn để lấy sản phẩm rẻ nhất trong danh mục Clothing. Kết quả trả về các trường product_name, category, price, stock_quantity 
select product_name, category, price, stock_quantity from products4 where category = 'Clothing' order by price asc limit 1;

