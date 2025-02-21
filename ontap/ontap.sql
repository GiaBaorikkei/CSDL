create database quanlybanhang;
use quanlybanhang;

create table customers (
    customer_id int auto_increment primary key,
    customer_name varchar(100) not null,
    phone varchar(20) not null unique,
    address varchar(255) null
);

create table products (
    product_id int auto_increment primary key,
    product_name varchar(100) not null unique,
    price decimal(10,2) not null,
    quantity int not null check (quantity >= 0),
    category varchar(50) not null
);

create table employees (
    employee_id int auto_increment primary key,
    employee_name varchar(100) not null,
    birthday date,
    position varchar(50) not null,
    salary decimal(10,2) not null,
    revenue decimal(10,2) default 0
);

create table orders (
    order_id int auto_increment primary key,
    customer_id int not null,
    employee_id int not null,
    order_date datetime default current_timestamp,
    total_amount decimal(10,2) default 0,
    foreign key (customer_id) references customers(customer_id),
    foreign key (employee_id) references employees(employee_id)
);

create table orderdetails (
    order_detail_id int auto_increment primary key,
    order_id int not null,
    product_id int not null,
    quantity int not null check (quantity > 0),
    unit_price decimal(10,2) not null,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);

-- Chèn dữ liệu vào bảng customers
insert into customers (customer_name, phone, address, email) values
('Nguyen Van A', '0123456789', 'Ha Noi', 'a@gmail.com'),
('Tran Thi B', '0987654321', 'Ho Chi Minh', 'b@gmail.com'),
('Le Van C', '0345678912', 'Da Nang', 'c@gmail.com'),
('Pham Thi D', '0567891234', 'Can Tho', 'd@gmail.com'),
('Hoang Van E', '0789123456', 'Hai Phong', 'e@gmail.com');

-- Chèn dữ liệu vào bảng products
insert into products (product_name, price, quantity, category) values
('Laptop Dell', 15000000, 10, 'Electronics'),
('iPhone 13', 20000000, 15, 'Electronics'),
('Samsung Galaxy', 18000000, 20, 'Electronics'),
('Sony Headphone', 3000000, 30, 'Accessories'),
('Logitech Mouse', 500000, 50, 'Accessories');

-- Chèn dữ liệu vào bảng employees
insert into employees (employee_name, position, salary, revenue) values
('Nguyen Van X', 'Sales Manager', 15000000, 50000000),
('Tran Thi Y', 'Sales Executive', 10000000, 30000000),
('Le Van Z', 'Cashier', 8000000, 20000000),
('Pham Thi M', 'Sales Executive', 10000000, 25000000),
('Hoang Van N', 'Sales Assistant', 7000000, 10000000);

-- Chèn dữ liệu vào bảng orders
insert into orders (customer_id, employee_id, total_amount) values
(1, 1, 35000000),
(2, 2, 25000000),
(3, 3, 15000000),
(4, 4, 20000000),
(5, 5, 5000000);

-- Chèn dữ liệu vào bảng orderdetails
insert into orderdetails (order_id, product_id, quantity, unit_price) values
(1, 1, 1, 15000000),
(1, 2, 1, 20000000),
(2, 3, 1, 18000000),
(2, 5, 1, 500000),
(3, 4, 1, 3000000),
(4, 2, 1, 20000000),
(5, 5, 2, 500000);


-- 3.1 Thêm cột email có kiểu dữ liệu varchar(100) not null unique vào bảng Customers
alter table customers
add column email varchar(100) not null unique;

-- 3.2 Xóa cột ngày sinh ra khỏi bảng Employees
alter table employees
drop column birthday;

-- 5.1 Lấy danh sách tất cả khách hàng từ bảng Customers. Thông tin gồm : mã khách hàng, tên khách hàng, email, số điện thoại và địa chỉ
select customer_id, customer_name, email, phone, address from customers;

-- 5.2 Sửa thông tin của sản phẩm có product_id = 1 theo yêu cầu : product_name= “Laptop Dell XPS” và price = 99.99
update products set product_name = 'Laptop Dell XPS', Price = 99.99 where product_id = 1;

-- 5.3 Lấy thông tin những đơn đặt hàng gồm : mã đơn hàng, tên khách hàng, tên nhân viên, tổng tiền và ngày đặt hàng.
select o.order_id, c.customer_name, e.employee_name, o.total_amount, o.order_date from orders o
join customers c on o.customer_id = c.customer_id 
join employees e on o.employee_id = e.employee_id;

-- 6.1 Đếm số lượng đơn hàng của mỗi khách hàng. Thông tin gồm : mã khách hàng, tên khách hàng, tổng số đơn
select c.customer_id, c.customer_name, count(o.order_id) as total_order from customers c
left join orders o on c.customer_id = o.customer_id
group by customer_id, customer_name;

-- 6.2 Thống kê tổng doanh thu của từng nhân viên trong năm hiện tại. Thông tin gồm : mã nhân viên, tên nhân viên, doanh thu
select e.employee_id, e.employee_name, sum(o.total_amount) as revenue  from employees e
join orders o on e.employee_id = o.employee_id
where year(o.order_date) = year(current_date()) 
group by e.employee_id, e.employee_name;

-- 6.3 Thống kê những sản phẩm có số lượng đặt hàng lớn hơn 100 trong tháng hiện tại. Thông tin gồm : mã sản phẩm, tên sản phẩm, số lượt đặt và sắp xếp theo số lượng giảm dần
select p.product_id, p.product_name, sum(d.quantity) as total_quantity from products p 
join orderdetails d on p.product_id = d.product_id
join orders o on d.order_id = o.order_id
where 
    month(o.order_date) = month(current_date()) 
    and year(o.order_date) = year(current_date()) 
group by p.product_id, p.product_name
having total_quantity >= 1
order by total_quantity desc;	

-- 7.1 Lấy danh sách khách hàng chưa từng đặt hàng. Thông tin gồm : mã khách hàng và tên khách hàng
select c.customer_id, c.customer_name from customers c
left join orders o on c.customer_id = o.customer_id
where o.customer_id is null;

-- 7.2 Lấy danh sách sản phẩm có giá cao hơn giá trung bình của tất cả sản phẩm
select product_id, product_name, price from products 
where price > (select avg(price) from products);

-- 7.3 Tìm những khách hàng có mức chi tiêu cao nhất. Thông tin gồm : mã khách hàng, tên khách hàng và tổng chi tiêu .(Nếu các khách hàng có cùng mức chi tiêu thì lấy hết)
select c.customer_id, c.customer_name, sum(total_amount) as total_amount from customers c
join orders o on c.customer_id = o.customer_id
group by c.customer_id, c.customer_name
having sum(total_amount) = (select sum(total_amount) from orders group by customer_id order by sum(total_amount) desc limit 1);

-- 8.1 Tạo view có tên view_order_list hiển thị thông tin đơn hàng gồm : mã đơn hàng, tên khách hàng, tên nhân viên, tổng tiền và ngày đặt. Các bản ghi sắp xếp theo thứ tự ngày đặt mới nhất
create view view_order_list as
select o.order_id, c.customer_name, e.employee_name, o.total_amount, o.order_date from orders o
join customers c on o.customer_id = c.customer_id
join employees e on o.employee_id = e.employee_id
order by o.order_date desc;

-- 8.2 Tạo view có tên view_order_detail_product hiển thị chi tiết đơn hàng gồm : Mã chi tiết đơn hàng, tên sản phẩm, số lượng và giá tại thời điểm mua. Thông tin sắp xếp theo số lượng giảm dần
create view view_order_detail_product as
select d.order_detail_id, p.product_name, d.quantity, d.unit_price from orderdetails d
join products p on d.product_id = p.product_id
order by d.quantity desc;

