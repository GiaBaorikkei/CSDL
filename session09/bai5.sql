use classicmodels;

-- Tạo index có tên idx_creaditLimit trên cột creditLimit của bảng customers.
create index idx_creaditLimit on customers(creditLimit);
-- Viết một truy vấn tìm danh sách các khách hàng có creditLimit từ 50000 đến 100000, bao gồm các cột: customerNumber, customerName, city, creditLimit.
-- Sau đó kết hợp (JOIN)  bảng customers với bảng offices để hiển thị thêm cột country của văn phòng mà khách hàng thuộc quyền quản lý (thông qua salesRepEmployeeNumber).
select c.customerNumber, c.customerName, c.city, c.creditLimit, o.country from customers c
join employees e on c.salesRepEmployeeNumber = e.employeeNumber
join offices o on e.officeCode = o.officeCode
where c.creditLimit between 50000 and 100000
order by c.creditLimit desc
limit 5;