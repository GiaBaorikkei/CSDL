use classicmodels;

-- Viết câu truy vấn Select tìm tất cả những khách hàng ở quốc gia(country) là Germany. Sử dụng EXPLAIN ANALYZE để kiểm tra truy vấn thực tế	
EXPLAIN ANALYZE 
select customerName, country from customers where country = 'Germany';
-- Tạo một chỉ mục có tên idx_country cho cột country của bảng customers. 
create index idx_country on customers(country);
-- Hãy xóa chỉ mục idx_country khỏi bảng customers.
drop index idx_country on customers;