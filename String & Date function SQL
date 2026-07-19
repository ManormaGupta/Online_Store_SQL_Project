SELECT UPPER(name) AS upper_name FROM users;
SELECT LOWER(name) AS lower_name FROM users;
SELECT name, LENGTH(name) AS name_length FROM users;
SELECT SUBSTRING_INDEX(name, ' ', 1) AS first_name FROM users;
SELECT TRIM(name) AS clean_name FROM users;
SELECT REPLACE(email, '@gmail.com', '') AS username FROM users;
SELECT name, email FROM users WHERE email LIKE '%gmail%';
SELECT CONCAT(name, ' - ', city) AS name_city FROM users;

SELECT CURDATE() AS today;
SELECT NOW() AS current_datetime;
SELECT name,DATE_FORMAT(dob, '%d-%m-%Y') AS birth_date FROM users;
SELECT name, dob,YEAR(CURDATE()) - YEAR(dob) AS age FROM users;
SELECT name,MONTHNAME(dob) AS birth_month FROM users;
SELECT name,YEAR(dob) AS birth_year FROM users;
SELECT name, dob FROM users ORDER BY dob ASC LIMIT 1;
SELECT name, dob FROM users ORDER BY dob DESC LIMIT 1;
SELECT name, dob FROM users WHERE YEAR(dob) > 1995;
SELECT name,DATEDIFF(CURDATE(), created_at) AS days_since_joined FROM users;

