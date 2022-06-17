show databases ;

use learning;

CREATE PROCEDURE citycount (IN country CHAR(3), OUT cities INT)
BEGIN
    SELECT COUNT(*) INTO cities FROM world.city
        WHERE CountryCode = country;
END;

CALL citycount('JPN', @cities);

select @cities;


CREATE FUNCTION CalcIncome ( starting_value INT ) RETURNS INT DETERMINISTIC
BEGIN
   DECLARE income INT;
   SET income := 0;
   WHILE income <= 3000
   DO
     SET income = income + starting_value;
   END WHILE;
   RETURN income;
END;

SELECT CalcIncome (1000);

drop function CalcIncome;
drop procedure citycount;



CREATE PROCEDURE p (OUT ver_param VARCHAR(25), INOUT incr_param INT)
BEGIN
  # Set value of OUT parameter
  SELECT VERSION() INTO ver_param;
  # Increment value of INOUT parameter
  SET incr_param = incr_param + 1;
END;

SET @increment = 10;
CALL p(@version, @increment);
SELECT @version, @increment;


