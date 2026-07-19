use online_store_db;
select name,gender,
if(gender ='female','yes','no') as is_female from users;

alter table users add column adress varchar(255);

UPDATE users SET adress = CASE id
WHEN 1 THEN 'MG Road, Delhi - 110001'
WHEN 2 THEN 'Linking Road, Mumbai - 400050'
WHEN 3 THEN 'Civil Lines, Rewa - 486001'
WHEN 4 THEN 'Brigade Road, Bangalore - 560001'
WHEN 5 THEN 'Sapna Sangeeta Road, Indore - 452001'
WHEN 6 THEN 'Banjara Hills, Hyderabad - 500001'
WHEN 7 THEN 'Arera Colony, Bhopal - 462001'
WHEN 8 THEN 'CG Road, Ahmedabad - 380001'
WHEN 9 THEN 'Marine Drive, Kochi - 682001'
WHEN 10 THEN 'Boring Road, Patna - 800001'
WHEN 11 THEN 'Hazratganj, Lucknow - 226001'
WHEN 12 THEN 'Mall Road, Kanpur - 208001'
WHEN 13 THEN 'FC Road, Pune - 411001'
WHEN 14 THEN 'MI Road, Jaipur - 302001'
WHEN 15 THEN 'Connaught Place, Delhi - 110002'
WHEN 16 THEN 'Anna Salai, Chennai - 600001'
WHEN 17 THEN 'Park Street, Kolkata - 700001'
WHEN 18 THEN 'Sitabuldi, Nagpur - 440001'
WHEN 19 THEN 'Ring Road, Surat - 395001'
WHEN 20 THEN 'Alkapuri, Vadodara - 390001'
WHEN 21 THEN 'Kalawad Road, Rajkot - 360001'
WHEN 22 THEN 'College Road, Nashik - 422001'
WHEN 23 THEN 'Gandhi Nagar, Rewa - 486002'
WHEN 24 THEN 'Fatehabad Road, Agra - 282001'
WHEN 25 THEN 'Station Road, Mathura - 281001'
WHEN 26 THEN 'Dashashwamedh, Varanasi - 221001'
WHEN 27 THEN 'Civil Lines, Allahabad - 211001'
WHEN 28 THEN 'New Market, Bhopal - 462002'
WHEN 29 THEN 'Vijay Nagar, Indore - 452002'
WHEN 30 THEN 'Bandra West, Mumbai - 400051'
WHEN 31 THEN 'Satellite Road, Ahmedabad - 380002'
WHEN 32 THEN 'Ashram Road, Ahmedabad - 380003'
WHEN 33 THEN 'Koregaon Park, Pune - 411002'
WHEN 34 THEN 'Vaishali Nagar, Jaipur - 302002'
WHEN 35 THEN 'Tilak Road, Pune - 411003'
WHEN 36 THEN 'Govind Nagar, Kanpur - 208002'
WHEN 37 THEN 'Saket, Delhi - 110003'
WHEN 38 THEN 'T Nagar, Chennai - 600002'
WHEN 39 THEN 'Salt Lake, Kolkata - 700002'
WHEN 40 THEN 'Dharampeth, Nagpur - 440002'
WHEN 41 THEN 'Adajan, Surat - 395002'
WHEN 42 THEN 'Fatima Nagar, Pune - 411004'
WHEN 43 THEN 'Tonk Road, Jaipur - 302003'
WHEN 44 THEN 'Lajpat Nagar, Delhi - 110004'
WHEN 45 THEN 'Besant Nagar, Chennai - 600003'
WHEN 46 THEN 'New Alipore, Kolkata - 700003'
WHEN 47 THEN 'Ramdaspeth, Nagpur - 440003'
WHEN 48 THEN 'Pal Road, Rajkot - 360002'
WHEN 49 THEN 'Deccan Gymkhana, Pune - 411005'
WHEN 50 THEN 'Mansarovar, Jaipur - 302004'
END
WHERE id BETWEEN 1 AND 50;

create view rich_users as
select * from users
where salary>65000;

update users set salary = 90000 where id = 3;
select * from rich_users;

show indexes from users;

create index idx_email_salary on users (email,salary);
select * from users where salary <32000;
drop index idx_email on users;

Delimiter //
create procedure select_users ()
begin
	select * from users ;
end //
Delimiter ;

call select_users();

DELIMITER //

CREATE PROCEDURE Add_users(
    IN city_name VARCHAR(50)
)
BEGIN
    SELECT name, adress, salary FROM users
    WHERE address LIKE 
    CONCAT('%', city_name, '%');
END //

DELIMITER ;

DROP PROCEDURE IF EXISTS Add_users;

DELIMITER //

CREATE PROCEDURE Add_users(
    IN user_name VARCHAR(100),
    IN user_email VARCHAR(100),
    IN user_dob DATE,
    IN user_city VARCHAR(50),
    IN user_adress VARCHAR(255),
    IN user_salary DECIMAL(10,2),
    IN user_gender ENUM('Male','Female')
)
BEGIN
    INSERT INTO users(
        name, email, dob, 
        city, adress, salary, gender)
    VALUES(
        user_name, user_email, user_dob,
        user_city, user_adress, 
        user_salary, user_gender);
END //

DELIMITER ;

CALL Add_users
('Manu Gupta','manu.gupta@gmail.com','1999-07-15','Rewa','Station Road, Rewa - 486001',55000,'Female');

SELECT * FROM users 
ORDER BY id DESC 
LIMIT 5;

