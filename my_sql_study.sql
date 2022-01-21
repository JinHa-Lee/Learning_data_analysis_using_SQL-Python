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

drop table my_product;

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
alter table customer modify column name varchar(20) not null;
alter table customer change column name model_name varchar(10);
alter table customer drop column age;
desc customer;

drop table customer;
show tables;


create table my_table (
	id int unsigned not null auto_increment,
    name varchar(20) not null,
    model_num varchar(10) not null,
    model_type varchar(10) not null,
    primary key(id)
);
desc my_table;

insert into my_table values(1,'i7','7700','Kaby Lake');
insert into my_table (name,model_num,model_type) values ('i7','7700K','Kaby Lake');
select * from my_table;

alter table my_table modify column model_type varchar(20) not null;

insert into my_table (name, model_type,model_num) values ('i5','Rocket Lake S','11400');
insert into my_table (name, model_num,model_type) values ('i3','10100F','Comet Lake');
insert into my_table (model_type,model_num,name) values ('Rocket Lake S','11700','i7');
insert into my_table (model_num,name,model_type) values ('12400F','i5','Elder Lake');
insert into my_table (name, model_num,model_type) values ('i5','10400','Comet Lake S');
select * from my_table;

select name from my_table;
select name, model_num from my_table;
select model_type,id from my_table;

select name as cpu_name, model_num as cpu_num,id from my_table order by id asc;
select name as cpu_name, model_type as cpu_type,id from my_table order by name asc;

select id, name from my_table where id <3;
select id, name as cpu_name, model_type as cpu_type from my_table where id >2 and id < 6; 
select id, name, model_num as cpu_num from my_table where id < 3 or name = 'i5';

select id, name, model_type as cpu_type from my_table where model_type like 'Elder%';
select * from my_table where model_type like 'Rocket_______';
select * from my_table where model_type like 'Rocket%' or name like 'i7';

select * from my_table limit 4;
select * from my_table limit 3,2;

select * from my_table where id < 5 or model_type like 'Comet%' order by model_num desc limit 2;
select * from my_table where model_num like '7700%';
select * from my_table where name = 'i7';
select * from my_table where model_type = 'Kaby Lake' limit 1;