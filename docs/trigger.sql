use learning;

CREATE TABLE account (acct_num INT, amount DECIMAL(10,2));

CREATE TRIGGER ins_sum BEFORE INSERT ON account FOR EACH ROW SET @sum = @sum + NEW.amount;

SET @sum = 0;

INSERT INTO account VALUES(137,14.98),(141,1937.50),(97,-100.00);

SELECT @sum AS 'Total amount inserted';

DROP TRIGGER ins_sum;

mysql> delimiter //
mysql> CREATE TRIGGER upd_check BEFORE UPDATE ON account
       FOR EACH ROW
       BEGIN
           IF NEW.amount < 0 THEN
               SET NEW.amount = 0;
           ELSEIF NEW.amount > 100 THEN
               SET NEW.amount = 100;
           END IF;
       END;//
mysql> delimiter ;

select * from account;
update account set amount:=-10101 where acct_num=137;

rollback ;
commit;