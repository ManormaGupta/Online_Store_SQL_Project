DELIMITER //
CREATE FUNCTION get_salary_grade(sal DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE grade VARCHAR(20);
    
    IF sal < 30000 THEN
        SET grade = 'Low';
    ELSEIF sal BETWEEN 30000 AND 60000 THEN
        SET grade = 'Medium';
    ELSE
        SET grade = 'High';
    END IF;
    
    RETURN grade;
END //
DELIMITER ;

SELECT name, salary,get_salary_grade(salary) AS grade FROM users;

DELIMITER //
CREATE FUNCTION get_age(dob DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN YEAR(CURDATE()) - YEAR(dob);
END //
DELIMITER ;

SELECT name, dob,get_age(dob) AS age FROM users;

DELIMITER //
CREATE FUNCTION get_user_info(user_name VARCHAR(100))
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE info VARCHAR(255);
    SELECT CONCAT('Name: ', name,' | City: ', city,' | Salary: ', salary)
    INTO info FROM users WHERE name = user_name LIMIT 1;
    RETURN info;
END //
DELIMITER ;

SELECT get_user_info('Priya Sharma');

CREATE TABLE user_log(
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    user_name VARCHAR(100),
    action VARCHAR(50),
    action_time TIMESTAMP 
    DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //
CREATE TRIGGER after_user_insert
AFTER INSERT ON users FOR EACH ROW
BEGIN
    INSERT INTO user_log(user_id, user_name, action)
    VALUES(NEW.id,NEW.name,'New User Added');
END //
DELIMITER ;

CALL Add_users
('Test User','test@gmail.com','1995-01-01','Delhi','MG Road Delhi - 110001',30000,'Male');
SELECT * FROM user_log;

DELIMITER //
CREATE TRIGGER after_salary_update
AFTER UPDATE ON users FOR EACH ROW
BEGIN
    IF OLD.salary != NEW.salary THEN INSERT INTO user_log(user_id, user_name, action)
        VALUES(NEW.id,NEW.name,
            CONCAT('Salary Changed from ',OLD.salary, ' to ',NEW.salary));
    END IF;
END //
DELIMITER ;

UPDATE users SET salary = 50000 WHERE id = 1;
SELECT * FROM user_log;

DELIMITER //
CREATE TRIGGER before_user_delete
BEFORE DELETE ON users FOR EACH ROW
BEGIN
    INSERT INTO user_log(user_id, user_name, action)
    VALUES(OLD.id,OLD.name,'User Deleted');
END //
DELIMITER ;

DELETE FROM users WHERE id = 51;
SELECT * FROM user_log;