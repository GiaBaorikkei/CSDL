use session03;

create table Products (
	product_id int primary key auto_increment,
    name varchar(255) not null,
    price decimal(10,2) not null check(price > 0),
    stock int not null check(stock >= 0),
    category varchar(100) 
);

insert into Products (name, price, stock, category) values
('iPhone 14', 999.99, 20, 'Electronics'),
('Samsung Galaxy S23', 849.99, 15, 'Electronics'),
('Sony Headphones', 199.99, 30, 'Electronics'),
('Wooden Table', 120.50, 10, 'Furniture'),
('Office Chair', 89.99, 25, 'Furniture'),
('Running Shoes', 49.99, 50, 'Sports'),
('Basketball', 29.99, 100, 'Sports'),
('T-Shirt', 19.99, 200, 'Clothing'),
('Laptop Bag', 39.99, 40, 'Accessories'),
('Desk Lamp', 25.00, 35, 'Electronics');

-- Lấy danh sách sản phẩm thuộc loại "Electronics" và có giá lớn hơn 200.
select * from Products where category = 'Electronics' and price > 200;
-- Lấy thông tin tất cả các sản phẩm có số lượng tồn kho dưới 20
select * from Products where stock < 20;
-- Lấy tên sản phẩm và giá của các sản phẩm thuộc loại "Sports" hoặc "Accessories".
select name, price from Products where category = 'Sports' or category = 'Accessories';
-- Cập nhật số lượng tồn kho thành 100 cho sản phẩm có tên bắt đầu bằng "S".
update Products set stock = 100 where name like 'S%';
--  Cập nhật loại sản phẩm thành "Premium Electronics" cho các sản phẩm có giá lớn hơn 500
update Products set category = 'Premium Electronics' where price > 500;
-- Xóa tất cả sản phẩm có số lượng tồn kho bằng 0
delete from Products where stock = 0;
-- Xóa các sản phẩm thuộc loại "Clothing" mà giá dưới 30
delete from Products where category = 'Clothing' and price < 30;