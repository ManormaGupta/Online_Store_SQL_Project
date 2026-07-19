create database online_store_db;
use online_store_db;
create table users(
id int auto_increment primary key,
name varchar (50) not null,
email varchar(20) unique not null,
gender enum ( 'male','female','other'),
dob Date ,
city varchar (20) not null,
created_at timestamp default current_timestamp );

select count(*) from users
where gender != 'male';

select count(*) from users 
where dob < '1995-09-09';

select count(*) from users 
where dob between '1990-09-09' and '1999-12-30';

select * from users 
where gender in ('female','male');

select count(*) from users 
where gender = 'female' and dob > '2000-09-09' ;

select * from users
where gender ='male' or dob > '2000-09-09'
order by dob ASC ;




