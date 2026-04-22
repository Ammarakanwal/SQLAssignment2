use classicmodels ;
select * from orderdetails;
select * from products;
select * from orderdetails;
#1) Get the order count for each product line where orders exceed 100.
select pl.productLine, count(distinct od.orderNumber) as order_count
from productlines pl
 join products pr
 on pl.productLine=pr.productLine
 join orderdetails od
 on pr.productCode=od.productCode
 group by pl.productLine
 having order_count>100;
 
#2) Get the count of employees reporting to each manager.
select * from employees;
select concat(e1.firstName, ' ',e1.lastName )as Manager_name,count(e2.firstName)  AS Employee_ReportTo
from employees e2
join employees e1
on e2.reportsTo = e1.employeeNumber
group by concat(e1.firstName, ' ', e1.lastName)
order by Manager_name;
#3) For each city, get the order status and order count.
select * from orders;
select * from customers
where city = 'Auckland  ';


select trim(c.city) as city, count(orderNumber) as Order_count ,
count(case when o.status='Shipped' then 1 end) as shipped_count, 
count(case when o.status='Cancelled' then 1 end) as cancelled_count 
from customers c
join orders o
on c.customerNumber=o.customerNumber
group by trim(c.city)
order by city;
#4) Calculate the sales done by each employee.
select * from employees where employeeNumber ='1702' ;
select * from orders where customerNumber = '484';
select * from customers where salesRepEmployeeNumber='1702';
select * from payments ;

select concat(e.firstName,' ' ,e.lastName) as employess_name, 
c.salesRepEmployeeNumber,
count(distinct o.customerNumber) as orders_count,
sum(py.amount) as total_sale
from employees e
join customers c
on e.employeeNumber=c.salesRepEmployeeNumber
join orders o
on c.customerNumber=o.customerNumber
join payments py
on py.customerNumber=c.customerNumber
group by e.employeeNumber, c.salesRepEmployeeNumber
order by employess_name;

#5) Get the total orders sold for each office.
select * from offices; select * from Orders; select * from customers; select * from employees;

select oc.officeCode,
count(distinct od.orderNumber) as order_count
from offices oc
left join employees em
on oc.officeCode = em.officeCode
left join customers cu
on em.employeeNumber = cu.salesRepEmployeeNumber
left join orders od
on cu.customerNumber = od.customerNumber
group by oc.officeCode
order by oc.officeCode;
