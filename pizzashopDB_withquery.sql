--drop table customer
--create customer table

CREATE table customer
(customer_id numeric(10,0) not null,
customer_first_name varchar2(40) not null,
customer_last_name varchar2(40) not null,
customer_email varchar2(40) not null,
customer_phone  numeric(10,0) not null,
customer_address varchar2(40) not null);

--assign pk and fk
alter table customer
add constraint id_pk primary key(customer_id);

--add fake data
insert into customer
values
(1000111, 'Andy', 'Jassy', 'andy_x@gmail.com' , 9595654855, '161  South Western Ave');
insert into customer
values
(1000122, 'Mary', 'Anne', 'mary_x@gmail.com' , 9494556555, '325  North Eastern Ave');
insert into customer
values
(1000112, 'Liu', 'Chen', 'liu_x@gmail.com' , 8545488545, '1200  Norton Way');
insert into customer 
values 
(1000134, 'Andrew', 'Wu', 'andrew_x@gmail.com' , 8545400555, '520 East Lakeway');
insert into customer
values
(1000123, 'Rahul', 'Kumar', 'rahul_x@gmail.com' , 8565452566, '1215 Terrace Avenue');

drop table customer;

--create table store
drop table stores;

create table Stores
(store_id numeric(10,0) not null,
store_name varchar2(40) not null,
store_address varchar2(40) not null);

alter table stores add constraint st_pk primary key (store_id);

--add fake data stores
insert into stores
values
(2000111, 'PizzaStore1' , '600  South Western Ave');



--create table order
--DROP TABLE ORDERS;

create table ORDERS 
(order_id numeric(10,0) not null,
customer_id numeric(10,0) not null,
store_id numeric(10,0) not null,
order_type varchar2(40) not null,
order_date  date default add_months(sysdate,12),
order_status varchar2(40) not null);

--assign pk and fl=k
alter table orders
add constraints id_ord_pk primary key(order_id);

alter table ORDERS
add constraint cu_ord_fk foreign key (customer_id)
references customer(customer_id);

alter table ORDERS
add constraint st_ord_fk foreign key (store_id)
references stores(store_id);

--add fake data
insert into orders
values(5001020,1000111,2000111, 'Phone',TO_DATE('2022-04-04','YYYY-MM-DD'), 'Confirmed');
insert into orders
values(5001111,1000122,2000111, 'App' ,TO_DATE('2022-04-05','YYYY-MM-DD'), 'Confirmed');
insert into orders
values(5001222,1000111,2000111, 'Phone' ,TO_DATE('2022-04-06','YYYY-MM-DD'), 'Confirmed');
insert into orders
values(5001000,1000122,2000111, 'App' ,TO_DATE('2022-04-07','YYYY-MM-DD'), 'Confirmed');
insert into orders
values(5001777,1000122,2000111, 'App' ,TO_DATE('2022-04-08','YYYY-MM-DD') ,'Confirmed');


--create table employee 
create table employee
(employee_id numeric(10,0) not null,
position_id numeric(10,0) not null,
employee_first_name varchar2(40) not null,
employee_last_name varchar2(40) not null);

alter table employee add constraint emp_pk primary key(employee_id);

alter table employee add constraint pst_fk foreign key(position_id)
    references positions(position_id); --- after position

--add fake data
insert into employee
values(2222111,1111, 'Brenda', 'Barnes');
insert into employee
values(2222110,1555, 'Mathew', 'Hayden');
insert into employee
values(2222108,1444, 'Angela', 'Barly');
insert into employee
values(2222109,1222, 'Nick', 'Knight');
insert into employee
values(2222107,1333, 'James', 'Franco'); --Delivery Driver1
insert into employee
values(2222106,1333, 'Mark', 'Dom'); -- Drive2
insert into employee
values(2222105,1333, 'Dave', 'Dom');--Driver3

--create table delivery
create table delivery
(delivery_id numeric(10,0) not null,
order_id numeric(10,0) not null,
employee_id numeric(10,0) not null,
delivery_date DATE not null);

alter table delivery add constraint del_pk primary key(delivery_id);

alter table delivery add constraint ord_fk foreign key(order_id)
references orders(order_id);

alter table delivery add constraint emp_fk foreign key(employee_id)
references employee(employee_id);

--add fake data
insert into delivery
values(4222112,5001020,2222107, TO_DATE('2022-04-04','YYYY-MM-DD'));
insert into delivery
values(4223132, 5001111,2222106,TO_DATE('2022-04-05','YYYY-MM-DD'));
insert into delivery
values(4333132,5001222,2222107, TO_DATE('2022-04-06','YYYY-MM-DD'));
insert into delivery
values(4333100,5001000,2222106, TO_DATE('2022-04-07','YYYY-MM-DD'));
insert into delivery
values(4222100,5001777,2222105, TO_DATE('2022-04-08','YYYY-MM-DD'));


Queues

--CREATE TABLE PRODUCT
create table product
(product_id numeric(10,0) not null,
product_name varchar2(40) not null,
product_price numeric(10,0) not null);

alter table product add constraint prd_pk primary key(product_id);

--add fake data
insert into product
values(200002, 'Marghareita M ' , 20);
insert into product
values(200001, 'Peppernoi L', 30);
insert into product
values(200003, 'Buffalo Ranch Chicken XL', 35);
insert into product
values(200005, 'Vegan XL', 40);
insert into product
values(200006, 'Meatzza L', 35);

--create table payment_method
create table payment_method
(payment_method_id numeric(10,0) not null,
payment_method_name varchar2(40) not null);

alter table payment_method add constraint methodpay_pk primary key(payment_method_id);

--add fake data
insert into payment_method
values(000, 'COD/credit/giftcard');

insert into payment_method
values(001, 'Mobile payment');



--create TABLE PAYMENT
drop table payment;

create table payment
(payment_id numeric(10,0) not null,
order_id numeric(10,0) not null,
payment_method_id numeric(10,0) not null,
payment_amount numeric(10,0) not null,
payment_date date default add_months(sysdate,12));

alter table payment add constraint pay_pk primary key(payment_id);

alter table payment add constraint order_fk foreign key(order_id)
references orders(order_id);

alter table payment add constraint paymethod_fk foreign key(payment_method_id)
references payment_method(payment_method_id);

--add fake data
insert into payment
values(0011100,5001020,000,30, TO_DATE('2022-04-04','YYYY-MM-DD'));
insert into payment
values(0022200,5001111,001,80,TO_DATE('2022-04-05','YYYY-MM-DD'));
insert into payment
values(0033300,5001222,000,40,TO_DATE('2022-04-06','YYYY-MM-DD'));
insert into payment
values(0044400,5001000,001,35,TO_DATE('2022-04-07','YYYY-MM-DD'));
insert into payment
values(0055500,5001777,001,35,TO_DATE('2022-04-08','YYYY-MM-DD'));



--create table position
--drop table positions

create table positions
(position_id numeric(10,0) not null,
store_id numeric(10,0) not null,
Wage numeric(10,0) not null);

alter table positions add constraint pos_pk primary key(position_id);
alter table positions add constraint store_fk foreign key(store_id)
references stores(store_id);

--add fake data (store 2000111)
insert into positions
values(1111,2000111, 80000); -- manager
insert into positions
values(1555,2000111, 60000); -- supervisor
insert into positions
values(1444,2000111, 50000); -- Cashier
insert into positions
values(1222,2000111, 55000); -- Chef
insert into positions
values(1333,2000111, 50000); -- Delivery Partner


drop table positions;
--CREATE TABLE ORDER_ITEM
create table order_item
(item_id numeric(10,0) not null,
order_id numeric(10,0) not null,
product_id numeric(10,0) not null,
item_quantity numeric(10,0) not null);

alter table order_item add constraint item_pk primary key(item_id);

alter table order_item add constraint ordid_fk foreign key(order_id)
references orders(order_id);

alter table order_item add constraint product_fk foreign key(product_id)
references product(product_id);

--add fake data
insert into order_item
values(010,5001020,200003,01);

insert into order_item
values(020,5001111,200005,02);

insert into order_item
values(030,5001222,200002,02);

insert into order_item
values(040,5001000,200001,01);

insert into order_item
values(050,5001777,200006,01);

--view tables
select * from customer;
select * from orders; 
select * from order_item;
select * from delivery;
select * from employee;
select * from stores;
select * from positions;
select * from payment;
select * from payment_method;
select * from product;

---Queries
--Q1 (Find the total amount and the method of payment)

SELECT m.payment_method_name, sum(p.payment_amount) as "Total order amount"
FROM payment p JOIN payment_method m
ON (p.payment_method_id = m.payment_method_id)
GROUP BY m.payment_method_name
;

--Q2 (Find the number of orders processed each month, user prompted to input a specific month & year)

SELECT count(*) as "Number of order"
FROM orders
WHERE EXTRACT(month FROM order_date) = '&enter_month_in_number' AND EXTRACT(year FROM order_date) = '&enter_year_in_number'
;

--Q3 (rank products they offer according to the price of each product)

SELECT product_name, product_price, 
       RANK() OVER(ORDER BY product_price DESC) Rank
FROM product
ORDER BY product_name,
         Rank;
--Q4(Finds the employees wages and lets the user input a last name of an employee and outputs all of the employees that have a higher wage than them)

SELECT e.employee_first_name, e.employee_last_name, p.wage
FROM employee e JOIN positions p
ON (e.position_id = p.position_id)
WHERE p.wage > (
    SELECT z.wage
    FROM positions z JOIN employee x
    ON (z.position_id = x.position_id)
    WHERE x.employee_last_name = '&enter_last_name')
;

--Q5 (Shows the number of products that the pizza shop has)
SELECT count(*) as "Number of product"
FROM product
;





