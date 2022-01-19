create database mydata;
show databases;

drop database mydata;
show databases;

drop database mydata;
drop database if exists mydata;

create database mydata;
use mydata;
show databases;

create table my_product (
		My_key int unsigned not null auto_increment,
        Product_id text,
        Title text,
        Ori_price int,
        discount_price int,
        discount_percent int,
        delevery text,
        primary key(My_key)
);
show tables;
desc my_product;


create table customer (
	no int not null,
    name char(20) not null,
    age tinyint,
    phone varchar(20),
    email varchar(30) not null,
    address varchar(50),
    primary key(no)
);
show tables;
desc customer;

alter table customer add column model_type varchar(10) not null;
desc customer;

alter table customer modify column name varchar(20) not null;
desc customer;

alter table customer change column name model_name varchar(10);
desc customer;

alter table customer drop column age;
desc customer;