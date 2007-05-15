drop table if exists users;
create table users (
	user_id int unsigned not null auto_increment,
	username varchar(20) not null,
	password varchar(20) default null,
	firstname varchar(20) default null,
	middlename varchar(20) default null,
	lastname varchar(20) default null,
	email varchar(80) default null,
	level enum ('god', 'admin', 'user') default 'user',
	status enum ('ok', 'deleted', 'banned') default 'ok',
	subcription datetime default null,
	primary key (user_id)
);

drop table if exists profiles;
create table profiles (
	user_id int unsigned not null,
	photo_id int unsigned not null,
	homepage varchar(120) default null,
	perlmonks_id int unsigned default null,
	cpan_id varchar(20) default null,
	user_perl_id varchar(20) default null,
	primary key (user_id)
);

drop table if exists locations;
create table locations (
	location_id int unsigned not null auto_increment,
	user_id int unsigned not null,
	address varchar(255) default null,
	city varchar(80) default null,
	country varchar(80) default null,
	description varchar(255) default null,
	primary key (location_id)
);

drop table if exists crash_places;
create table crash_places (	 
	crash_place_id int unsigned not null auto_increment,
	location_id int unsigned not null,
	capacity int unsigned default 1,
	description varchar(255) default null,
	primary key (crash_place_id)
);

drop table if exists messages;
create table messages (
	message_id int unsigned not null auto_increment,
	from_user_id int unsigned not null,
	to_user_id int unsigned not null,
	subject varchar(80) default null,
	message text default null,
	datetime datetime,
	status_read tinyint(1) unsigned default 0,
	status_flag tinyint(1) unsigned default 0,
	parent_message_id int unsigned default null,
	primary key (message_id)
);

drop table if exists connections;
create table connections (
	my_user_id int unsigned not null,
	my_connection_user_id int unsigned not null,
	status enum ('pending', 'accepted', 'rejected') default 'pending',
	primary key (my_user_id, my_connection_user_id)
);

drop table if exists bookings;
create table bookings (
	booking_id int unsigned not null auto_increment,
	guest_user_id int unsigned not null,
	host_user_id int unsigned not null,
	location_id int unsigned not null,
	crash_place_id int unsigned not null,
	begin_date datetime not null,
	end_date datetime not null,
	status enum ('requested', 'accepted', 'rejected') default 'requested',
	party_size tinyint(2) unsigned,
	party_description varchar(255) default null,
	primary key (booking_id)
);