drop database if exists jiayun_warehouses;

create database jiayun_warehouses
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;
use jiayun_warehouses;

create table warehouse(
	id int unsigned auto_increment primary key,
	name varchar(255) unique,
	addr varchar(255),
	owner varchar(255) not null,
	owner_name varchar(255) not null,
	description varchar(255),
	phone varchar(255)
);

create table item(
	id int unsigned auto_increment primary key,
	name varchar(255) not null,
	warehouse_id int unsigned not null,
	qty decimal(10,3) default 0.0,
	unit varchar(255) not null,
	description varchar(255),
	last_change datetime not null,
	foreign key(warehouse_id) references warehouse(id),
	unique key(name, warehouse_id)
);

create table flow(
	id int unsigned auto_increment primary key,
	flow_date datetime not null,
	item_name varchar(255) not null,
	qty decimal(10,3) default 0.0,
	unit varchar(255),
	io varchar(255),
	warehouse_name varchar(255) not null,
	other_place varchar(255) not null,
	purpose varchar(255),
	operator varchar(255) not null
);
