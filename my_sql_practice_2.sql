create database ecommerce;
use ecommerce;
show databases;
create table product(
	product_code varchar(20) not null,
    title varchar(200) not null,
    ori_price int,
    discount_price int,
    discount_percent int,
    delivery varchar(2),
    primary key(product_code)
);
desc product;

create table ranking(
	id int unsigned not null auto_increment,
    category varchar(50),
    subcategory varchar(50),
    ranking int not null,
    product_code varchar(20) not null,
    primary key (id)
);

desc ranking;

insert into product values('00004568','아이폰 XS',1360000,1224000,10,'F');
select * from product;

drop database ecommerce;
create database ecommerce;
use ecommerce;
show tables;
select * from product;