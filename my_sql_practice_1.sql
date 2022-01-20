create database lee;
use lee;
create table mytable (
	id int unsigned not null auto_increment,
    name varchar(50) not null,
    modelnumber varchar(15) not null,
    series varchar(30) not null,
    primary key(id)
);
show tables;
desc mytable;

alter table mytable modify column name varchar(20) not null;
desc mytable;

alter table mytable change column modelnumber model_num varchar(10) not null;
desc mytable;

alter table mytable change column series model_type varchar(10) not null;
desc mytable;

drop table mytable;
show tables;

create table model_info (
	id int unsigned not null auto_increment,
    name varchar(20) not null,
    model_num varchar(10) not null,
    model_type varchar(10) not null,
    primary key(id)
);
desc model_info;

drop database lee;